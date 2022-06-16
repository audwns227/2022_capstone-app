// TODO Implement this library.
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../provider/PO_list_provider.dart';
import '../../provider/user_info/collector_info.dart';
import '../Collector_components/po_list_form.dart';

// Future<String?> getMobileID() async{
//   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//
//   String? id = '';
//
//   try {
//     // 플랫폼 확인
//     if (Platform.isAndroid) {
//       // 안드로이드의 경우 androidInfo를 이용
//       // 이때 await으로 데이터 받을때까지 대기를 해야함
//       final AndroidDeviceInfo androidData = await deviceInfoPlugin.androidInfo;
//       // 전달 받은 변수의 멤버 변수인 androidId가 고유 id이다.
//       id = androidData.androidId;
//     } else if (Platform.isIOS) {
//       // iOS의 경우 iosInfo를 이용
//       // 이때 await으로 데이터 받을때까지 대기를 해야함
//       final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
//       // 전달 받은 변수의 멤버 변수인 identifierForVendor가 고유 id이다.
//       id = iosData.identifierForVendor;
//     }
//   } on PlatformException {
//     // 어떠한 원인으로 실패할 경우
//     id = '';
//   }
//   // id 한번 출력해보고
//   print('id: $id');
//   // 값 리턴
//   return id;
// }
class CollectorSignupForm extends StatefulWidget {
  @override
  State<CollectorSignupForm> createState() => _CollectorSignupFormState();
}

class _CollectorSignupFormState extends State<CollectorSignupForm> {
  final formKey = GlobalKey<FormState>();
 // 1. 글로벌 key
  Future<String> postSignup() async {
    if (Provider.of<CollectorInfo>(context, listen: false).collector_bussiness_num == null ||
        Provider.of<CollectorInfo>(context, listen: false).collector_phonenum == null ||
        Provider.of<CollectorInfo>(context, listen: false).collector_password == null ||
        Provider.of<CollectorInfo>(context, listen: false).collector_account == null ||
        Provider.of<CollectorInfo>(context, listen: false).collector_username == null) return '';

    Map data = {
      'job': "중상",
      'business_num': Provider.of<CollectorInfo>(context, listen: false).collector_bussiness_num,
      'phone_num': Provider.of<CollectorInfo>(context, listen: false).collector_phonenum,
      'password': Provider.of<CollectorInfo>(context, listen: false).collector_password,
      'address': "null",
      'account': Provider.of<CollectorInfo>(context, listen: false).collector_account,
      'po_name': "null",
      'username': Provider.of<CollectorInfo>(context, listen: false).collector_username,
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

      //await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
      //await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);

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
            onSaved: (val){
              setState((){
                context.read<CollectorInfo>().set_businessnum(val);
              });
            },
            validator: (val){
              if (val.length < 1) {
                return '사업자등록번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '이름',
            onSaved: (val){
              setState((){
                context.read<CollectorInfo>().set_username(val);
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '이름은 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '핸드폰번호',
            onSaved: (val){
              setState((){
                context.read<CollectorInfo>().set_phonenum(val);
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '핸드폰번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: large_gap),
          CustomTextFormField(
            label: '비밀번호',
            onSaved: (val){
              setState((){
                context.read<CollectorInfo>().set_password(val);
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '비밀번호는 필수사항입니다.';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '계좌번호',
            onSaved: (val){
              setState((){
                context.read<CollectorInfo>().set_account(val);
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '계좌번호는 필수사항입니다.';
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
                                Provider.of<POListProvider>(context, listen: false).add_po_list(POListForm("버거킹 충무로역점", "서울 중구 퇴계로 216", "4", "46"));
                                Provider.of<POListProvider>(context, listen: false).add_po_list(POListForm("썬더치킨", "서울 중구 퇴계로44길 12", "5", "57"));
                                Provider.of<POListProvider>(context, listen: false).add_po_list(POListForm("산타돈부리", "서울 중구 서애로 19 1층", "2", "32"));
                                Provider.of<POListProvider>(context, listen: false).add_po_list(POListForm("사랑채", "서울 중구 필동로 34 삼경하이빌", "3", "39"));
                                Provider.of<POListProvider>(context, listen: false).add_po_list(POListForm("김치만", "서울 중구 필동로 30-1", "2", "23"));
                                Navigator.pushNamed(context, "/mainCollector");
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
