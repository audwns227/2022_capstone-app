import 'package:flutter/material.dart';
import 'package:flutter_login/logo.dart';
import 'package:flutter_login/components/PO_components/scale_initial_form.dart';
import 'package:flutter_login/size.dart';

class ScaleInitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("저울 설정"),
            SizedBox(height: xlarge_gap), // 1. 추가
            ScaleInitialForm()
          ],
        ),
      ),
    );
  }
}
