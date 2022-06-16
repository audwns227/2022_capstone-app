// TODO Implement this library.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';
import 'package:get/get.dart';
import 'package:flutter_login/data/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../provider/collector_list_provider.dart';
import '../../provider/user_info/collcom_info.dart';
import '../CollCom_components/collector_list_form.dart';

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

class CollComSignUpForm extends StatefulWidget {
  @override
  State<CollComSignUpForm> createState() => _CollComSignUpFormState();
}

class _CollComSignUpFormState extends State<CollComSignUpForm> {
  final formKey = GlobalKey<FormState>();
  // 1. 글로벌 key

  Future<String> postSignup() async {
    if (Provider.of<CollComInfo>(context, listen: false).collcom_bussiness_num == null ||
        Provider.of<CollComInfo>(context, listen: false).collcom_phonenum == null ||
        Provider.of<CollComInfo>(context, listen: false).collcom_password == null ||
        Provider.of<CollComInfo>(context, listen: false).collcom_address == null ||
        Provider.of<CollComInfo>(context, listen: false).collcom_name == null) return '';

    Map data = {
      'job': "좌상",
      'business_num': Provider.of<CollComInfo>(context, listen: false).collcom_bussiness_num,
      'phone_num': Provider.of<CollComInfo>(context, listen: false).collcom_phonenum,
      'password': Provider.of<CollComInfo>(context, listen: false).collcom_password,
      'address': Provider.of<CollComInfo>(context, listen: false).collcom_address,
      'account': Provider.of<CollComInfo>(context, listen: false).collcom_account,
      'po_name': Provider.of<CollComInfo>(context, listen: false).collcom_name,
      'username': "나중에 수정",
    };

    var body = json.encode(data);

    // print(user.account == null);
    print("body 출력" + body);
    final header = {"Content-type": "application/json"};

    // var url = Uri.parse("http://192.168.0.47:8000/users/create");
    var url = Uri.parse("http://3.36.83.73/users/create");
    var response = await http.post(url, headers: header, body: body);
    print("status code : ${response.statusCode}");
    print("response.body : ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("서버연결성공 : ${response.body}");

      print("runtimetype : ${(response.body).runtimeType}");
      final tokens = json.decode(response.body);
      print("tokens : ${tokens}");

      final newAccessToken = tokens['access'];
      final newRefreshToken = tokens['refresh'];
      print("AccessToken : ${newAccessToken}");
      print("RefreshToken : ${newRefreshToken}");

      await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
      await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);

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
                context.read<CollComInfo>().set_businessnum(val);
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
                context.read<CollComInfo>().set_phonenum(val);
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
                context.read<CollComInfo>().set_password(val);
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
                context.read<CollComInfo>().set_address(val);
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
                context.read<CollComInfo>().set_account(val);
              });
            },
            validator: (val) {
              if (val.length < 1) {
                return '계좌번호는상필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '상호명',
            onSaved: (val) {
              setState(() {
                context.read<CollComInfo>().set_POname(val);
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
                //print(user.business_num);
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
                                Provider.of<CollectorListProvider>(context, listen: false).add_collector_list(CollectorListForm("홍길동", "4", "46"));
                                Provider.of<CollectorListProvider>(context, listen: false).add_collector_list(CollectorListForm("허균", "5", "83"));
                                Provider.of<CollectorListProvider>(context, listen: false).add_collector_list(CollectorListForm("김상덕", "6", "97"));
                                Provider.of<CollectorListProvider>(context, listen: false).add_collector_list(CollectorListForm("김철수", "7", "101"));
                                Provider.of<CollectorListProvider>(context, listen: false).add_collector_list(CollectorListForm("이영희", "3", "59"));
                                Navigator.pushNamed(context, "/mainCollCom");
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
