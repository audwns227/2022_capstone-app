// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:flutter_login/size.dart';

class SelectSignupForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
  @override
  Widget build(BuildContext context) {
    return Form(
      // 2. 글로벌 key를 Form 태그에 연결하여 해당 key로 Form의 상태를 관리할 수 있다.
      key: _formKey,
      child: Column(
        children: [
          Text("식당, 중상, 좌상, 단석 중 선택해주세요."),
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
            child: Text("식당"),
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
                Navigator.pushNamed(context, "/collectorsignup");
              }
            },
            child: Text("중상"),
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
                Navigator.pushNamed(context, "/collcomsignup");
              }
            },
            child: Text("좌상"),
          ),

          SizedBox(height: large_gap),
          // TextButton(  //캡디 이후 집어넣기
          //   style: TextButton.styleFrom(
          //     backgroundColor: Colors.green,
          //     primary: Colors.black,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     minimumSize: Size(400, 60),
          //   ),
          //   onPressed: () {
          //     // 3. 유효성 검사
          //     if (_formKey.currentState!.validate()) {
          //       Navigator.pushNamed(context, "/signup");
          //     }
          //   },
          //   child: Text("단석"),
          // ),
        ],
      ),
    );
  }
}
