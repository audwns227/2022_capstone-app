// TODO Implement this library.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_login/provider/user_info/PO_info.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';
import 'package:get/get.dart';
import 'package:flutter_login/data/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Future<String> getDeviceUniqueId() async {
//   String deviceIdentifier = '';
//   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//
//   if (Platform.isAndroid) {
//     final AndroidDeviceInfo androidData = await deviceInfoPlugin.androidID;
//     androidInfo = await deviceInfo.androidInfo;
//   } else if (Platform.isIOS) {
//     deviceIdentifier = iosInfo.identifierForVendor!;
//     iosInfo = await deviceInfo.iosInfo;
//   }
//
//   return deviceIdentifier;
// }

final storage = FlutterSecureStorage();

class POSignUpForm extends StatefulWidget {
  @override
  State<POSignUpForm> createState() => _POSignUpFormState();
}

class _POSignUpFormState extends State<POSignUpForm> {
  final formKey = GlobalKey<FormState>();
  // 1. 글로벌 key

  Future<String> postSignup() async {
    if (Provider.of<POInfo>(context, listen: false).PO_bussiness_num == null ||
        Provider.of<POInfo>(context, listen: false).PO_phonenum == null ||
        Provider.of<POInfo>(context, listen: false).PO_password == null ||
        Provider.of<POInfo>(context, listen: false).PO_address == null ||
        Provider.of<POInfo>(context, listen: false).PO_name == null) return '';

    Map data = {
      'job': "식당",
      'business_num': Provider.of<POInfo>(context, listen: false).PO_bussiness_num,
      'phone_num': Provider.of<POInfo>(context, listen: false).PO_phonenum,
      'password': Provider.of<POInfo>(context, listen: false).PO_password,
      'address': Provider.of<POInfo>(context, listen: false).PO_address,
      'account': Provider.of<POInfo>(context, listen: false).PO_account,
      'po_name': Provider.of<POInfo>(context, listen: false).PO_name,
      'username': "나중에 수정",
    };

    var body = json.encode(data);

    // print(user.account == null);
    print("body 출력" + body);
    final header = {"Content-type": "application/json"};

    // var url = Uri.parse("http://192.168.0.47:8000/users/create");
    var url = Uri.parse("http://54.180.87.157/users/create");
    var response = await http.post(url, headers: header, body: body);
    print("status code : ${response.statusCode}");
    print("response.body : ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("서버연결성공 : ${response.body}");

      print("runtimetype : ${(response.body).runtimeType}");
      final tokens = json.decode(response.body);
      print("tokens : ${tokens}");

      await storage.deleteAll();

      final newAccessToken = tokens['access'];
      final newRefreshToken = tokens['refresh'];
      print("AccessToken : ${newAccessToken}");
      print("RefreshToken : ${newRefreshToken}");

      await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);
      print(await storage.readAll());

      return response.body;
    }


    throw Exception('데이터수신실패');
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: '사업자등록번호',
            onSaved: (val) {
              setState(() {
                context.read<POInfo>().set_businessnum(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '사업자등록번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '핸드폰번호',
            onSaved: (val) {
              setState(() {
                context.read<POInfo>().set_phonenum(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '핸드폰번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: large_gap),
          CustomTextFormField(
            label: '비밀번호',
            onSaved: (val) {
              setState(() {
                context.read<POInfo>().set_password(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '비밀번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '주소',
            onSaved: (val) {
              setState(() {
                context.read<POInfo>().set_address(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '주소는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '계좌번호',
            onSaved: (val) {
              setState(() {
                context.read<POInfo>().set_account(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '계좌번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '상호명',
            onSaved: (val) {
              setState(() {
                context.read<POInfo>().set_POname(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '상호명은 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          // 3. TextButton 추가
          TextButton(
            onPressed: () async {
              if (this.formKey.currentState!.validate()) {
                this.formKey.currentState?.save();
                print(Provider.of<POInfo>(context, listen: false).PO_bussiness_num);
                postSignup();
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text('회원가입완료'),
                          content: Text('회원가입이 완료되었습니다.'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('확인'),
                              onPressed: () {
                                Navigator.pushNamed(context, "/mainPO");
                              },
                            )
                          ]);
                    });
              }
            },
            child: Text("가입"),
          ),
        ],
      ),
    );
  }
}
