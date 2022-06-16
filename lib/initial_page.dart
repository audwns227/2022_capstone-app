import 'package:flutter/material.dart';
import 'package:flutter_login/initial_form.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/size.dart';

import 'custom_text_form_field.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("Recycle Ledger"),
            SizedBox(height: xlarge_gap), // 1. 추가
            InitialForm(), // 2. 추가
          ],
        ),
      ),
    );
  }
}
