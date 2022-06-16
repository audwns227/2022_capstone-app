// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_login/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';

class PO_Login extends StatefulWidget {
  @override
  State<PO_Login> createState() => _PO_LoginState();
}

class _PO_LoginState extends State<PO_Login> {
  final _formKey = GlobalKey<FormState>();

  String phone_num = '';
  String serial_num = '';

 // 1. 글로벌 key
  @override
  Widget build(BuildContext context) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: '핸드폰번호',
            onSaved: (val){
              setState((){
                this.phone_num = val;
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '핸드폰번호를 입력해주세요';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '비밀번호',
            onSaved: (val){
              setState((){
                this.serial_num = val;
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '비밀번호를 입력해주세요.';
              }
              return null;
            },
          ),
          SizedBox(height: large_gap),
          // 3. TextButton 추가
          TextButton(
            onPressed: () {
              // 3. 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/mainPO");
              }
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
