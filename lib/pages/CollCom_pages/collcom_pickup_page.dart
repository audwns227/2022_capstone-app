import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_login/components/PO_components/discharge_list_item.dart';
import 'package:flutter_login/provider/count.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_login/size.dart';
import 'package:provider/provider.dart';

import '../../collcom_mainpage.dart';
import '/provider/weight.dart';

class CollComPickUpPage extends StatefulWidget {
  const CollComPickUpPage({Key? key}) : super(key: key);

  @override
  CollComPickUpPageState createState() => CollComPickUpPageState();
}

class CollComPickUpPageState extends State<CollComPickUpPage> {
  File? _image;
  final picker = ImagePicker();

  late double weight;
  late int list_num;

  List<DischargeListItem> history = [];

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  int _modifiedcount = 0;

  void _incrementCounter() {
    setState(() {
      _modifiedcount++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _modifiedcount--;
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    final _weight = context.watch<Weight>().weight; //provider에서 총무게 가져옴
    final _count = context.watch<Count>().count;  //provider에서 총개수 가져옴

    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: const Color(0xfff4f3f9),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25.0),
              showImage(),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                ],
              ),
              SizedBox(height: medium_gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "총 수량: " + _count.toString() + "개",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: large_gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "총 무게: " + _weight.toString() + "KG",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  //TextField:입력한 값을 current_weight변수에 저장
                ],
              ),
              SizedBox(height: large_gap),
              RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CollComMainPage()),);
                    },
                  child: Text('수거', style: TextStyle(color: Colors.black))),
            ],
          ),
        ));

  }
}
