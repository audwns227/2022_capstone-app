import 'package:flutter/material.dart';
import 'package:flutter_login/initial_form.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/components/signup/select_PO_form.dart';
import 'package:flutter_login/components/signup/select_signup_form.dart';
import 'package:flutter_login/size.dart';

class SelectPOPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: medium_gap),
            Logo("식당직원선택"), // 1. 추가
            SelectPO(), // 2. 추가
          ],
        ),
      ),
    );
  }
}
