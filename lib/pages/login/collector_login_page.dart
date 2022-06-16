import 'package:flutter/material.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/size.dart';

import '../../custom_text_form_field.dart';

class CollectorLoginPage extends StatefulWidget {
  @override
  State<CollectorLoginPage> createState() => _CollectorLoginPageState();
}

class _CollectorLoginPageState extends State<CollectorLoginPage> {
  final _formKey = GlobalKey<FormState>();
  String phone_num = "";
  String password = "";

 // 1. 글로벌 key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("중상 로그인"),
            SizedBox(height: large_gap), // 1. 추가
            CustomTextFormField(
              label: '핸드폰번호',
              onSaved: (val){
                setState((){
                  this.phone_num = val;
                });
              },
              validator: (val){
                if(val.length <1 ){
                  return '핸드폰번호는 필수사항입니다.';
                }
                return null;
              },
            ),
            SizedBox(height: medium_gap),
            CustomTextFormField(
              label: '비밀번호',
              onSaved: (val){
                setState((){
                  this.password = val;
                });
              },
              validator: (val){
                if(val.length <1 ){
                  return '비밀번호는 필수사항입니다.';
                }
                return null;
              },
            ),
            SizedBox(height: large_gap),
            // 3. TextButton 추가
            TextButton(
              onPressed: () {
                // 3. 유효성 검사
                  Navigator.pushNamed(context, "/mainCollector");
              },
              child: Text("Login"),
            ), // 2. 추가
          ],
        ),
      ),
    );
  }
}
