// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_login/size.dart';

class ScaleInitialForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
  @override
  Widget build(BuildContext context) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: _formKey,
      child: Column(
        children: [
          // 3. TextButton 추가
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              // 3. 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/login");
              }
            },
            child: Text("블루투스 연결 기기확인"),
          ),

          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              // 3. 유효성 검사
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, "/selectSignup");
              }
            },
            child: Text("블루투스 연결 확인"),
          ),
        ],
      ),
    );
  }
}
