import 'package:flutter/material.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/size.dart';

class SelectJobLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 1. 글로벌 key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: medium_gap),
            Logo("로그인 직업 선택"), // . 추가
            SizedBox(height: xlarge_gap),
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
                Navigator.pushNamed(context, "/POlogin");
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
                Navigator.pushNamed(context, "/CollectorLogin");
              },
              child: Text("중상"),
            ),//
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
                Navigator.pushNamed(context, "/CollComLogin");
              },
              child: Text("좌상"),
            ),//// 2. 추가
          ],
        ),
      ),
    );
  }
}
