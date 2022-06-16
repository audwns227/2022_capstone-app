import 'package:flutter/material.dart';
import 'package:flutter_login/components/signup/collector_signup_form.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/size.dart';

class CollectorSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Logo("중상 회원가입"),
            SizedBox(height: large_gap), // 1. 추가
            CollectorSignupForm(), // signup_form.dart
          ],
        ),
      ),
    );
  }
}
