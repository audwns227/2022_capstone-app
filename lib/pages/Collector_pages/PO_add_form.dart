import 'package:flutter/material.dart';

import '../../custom_text_form_field.dart';
import '../../logo.dart';
import '../../size.dart';


class POAdd extends StatefulWidget {
  @override
  State<POAdd> createState() => _POAddState();
}

class _POAddState extends State<POAdd> {
  String po_name = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("식당 추가"),
            CustomTextFormField(
              label: '식당명',
              onSaved: (val){
                setState((){
                  this.po_name = val;
                });
              },
              validator: (val){
                if(val.length <1 ){
                  return '식당명을 입력해주세요.';
                }
                return null;
              },
            ),
            SizedBox(height: medium_gap),
            CustomTextFormField(
              label: '식당주소',
              onSaved: (val){
                setState((){
                  this.address = val;
                });
              },
              validator: (val){
                if(val.length <1 ){
                  return '식당주소를 입력해주세요.';
                }
                return null;
              },
            ),
            SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/initial"); //"/initial"
            },
            child: Text("추가"),
          )
          ],
        ),
      ),
    );
  }
}
