import 'package:flutter/material.dart';
import 'package:flutter_login/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';

class AddPOPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPOPage();
  }
}

class _AddPOPage extends State<AddPOPage> {
  final _formKey = GlobalKey<FormState>();
  String parttime_name = '';
  String parttime_phonennum = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '배출자 이름',
            onSaved: (val){
              setState((){
                this.parttime_name = val;
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '배출자이름을 입력해주세요';
              }
              return null;
            },
          ),
          SizedBox(height: medium_gap),
          CustomTextFormField(
            label: '배출자 핸드폰번호',
            onSaved: (val){
              setState((){
                this.parttime_phonennum = val;
              });
            },
            validator: (val){
              if(val.length <1 ){
                return '배출자핸드폰번호를 입력해주세요.';
              }
              return null;
            },
          ),
          SizedBox(height: xlarge_gap),
          TextButton(
            child: Text("앱 설치 문자 보내기"),
            onPressed: () {
              // // 3. 유효성 검사
              // if (_formKey.currentState!.validate()) {
              //   Navigator.pushNamed(context, "/home");
              // }
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text('문자 전송 완료'),
                        content: Text('앱 설치 문자가 배출자에게 전송되었습니다.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('확인'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ]);
                  });
            },
          ),
        ]));
  }
}
