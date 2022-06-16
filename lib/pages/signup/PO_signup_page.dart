import 'package:flutter/material.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/size.dart';
import '../../components/signup/PO_signup_form.dart';
import '../../custom_text_form_field.dart';

class POSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Logo("식당 회원가입"),
            SizedBox(height: large_gap), // 1. 추가
            POSignUpForm(), // signup_forma.dart
          ],
        ),
      ),
    );
  }
}
