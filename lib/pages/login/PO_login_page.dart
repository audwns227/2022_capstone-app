import 'package:flutter/material.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/size.dart';
import '../../components/login/PO_login_form.dart';

class POLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("식당 로그인"),
            SizedBox(height: large_gap), // 1. 추가
            PO_Login(), // 2. 추가
          ],
        ),
      ),
    );
  }
}
