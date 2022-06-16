// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:flutter_login/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';

class SelectPO extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
  @override
  Widget build(BuildContext context) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: _formKey,
      child: Column(
        children: [
          Text("점주, 알바 중 선택해주세요."),
          SizedBox(height: large_gap),
          // 3. TextButton 추가
          SizedBox(height: large_gap),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(400, 60),
            ),
            onPressed: () {
              // 3. 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/signup");
              }
            },
            child: Text("점주"),
          ),

          SizedBox(height: large_gap),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(400, 60),
            ),
            onPressed: () {
              // 3. 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/signupparttime");
              }
            },
            child: Text("알바"),
          ),
        ],
      ),
    );
  }
}
