//scale_measure_page.dart
//맨 마지막꺼만 삭제됨

import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';
//import 'package:flutter_login/provider/weightlist_provider.dart';

import 'package:flutter_login/components/PO_components/scale_measure_list_form.dart';
import 'package:flutter_login/navigationbar/dischargeReportPage.dart';
import 'package:flutter_login/provider/count.dart';
import 'package:flutter_login/provider/scale_list.dart';
import 'package:flutter_login/provider/weight.dart';
import 'package:provider/provider.dart';

import '../../logo.dart';
import '/size.dart';

class MeasurePage extends StatefulWidget {
  const MeasurePage({Key? key}) : super(key: key);

  @override
  MeasurePageState createState() => MeasurePageState();
}

class MeasurePageState extends State<MeasurePage> {
  double current_weight = 0; //현재 측정중인 폐식용유 무게
  int count = 0; //폐식용유 통 개수
  double total_weight = 0; //전체 무게

  List<MeasureList> items = [];

  int current_index = -1; //삭제를 위해 필요한 인덱스

  final fieldText = TextEditingController(); //TextField clear하기위해 선언

  void clearText() { //TextField clear하는 메소드
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    final _items = context.watch<ScaleList>().items;
    DischargeReportPageState? parent = context.findAncestorStateOfType<DischargeReportPageState>(); //Parent child관계를 생성하는코드

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Logo("저울측정"),
            Container(
              //선 긋는 container
              width: 500,
              child: Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "현재 무게:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                //TextField:입력한 값을 current_weight변수에 저장
                Flexible(
                  //TextField의 크기가 무한한 에러를 해결하기위해 사용
                  child: TextField(
                    controller: fieldText,
                    onChanged: (text) {
                      setState(() {
                        current_weight =
                            double.parse(text); //입력한 값을 current_weight변수에 저장
                      });
                    },
                  ),
                ),
                Text(
                  "KG",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                OutlinedButton(
                    onPressed: () {
                      clearText(); //ok눌렀을때 TextField clear
                      context.read<ScaleList>().add_weight_list(MeasureList(current_weight));
                      setState(() {
                        Provider.of<Count>(context, listen: false).increment_count();  //전체무게 갱신
                        Provider.of<Weight>(context, listen: false).increment_weight(current_weight);  //전체 개수 갱신
                      });
                    },
                    child: Text('OK', style: TextStyle(color: Colors.black))),
              ],
            ),
            SizedBox(height: large_gap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "수량:" + Provider.of<Count>(context).count.toString() + '캔',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "총 무게" + Provider.of<Weight>(context).weight.toString() + "KG",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(MeasureList(current_weight)
                .weight
                .toString()), //MeasureList클래스의 항목에 접근이 잘되나 확인하는 코드
            SizedBox(height: large_gap),
            Container(
              //선 긋는 container
              width: 500,
              child: Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
            ),
            Expanded(
                child: ListView.builder(
                  //item리스트를 가지고 리스트뷰 생성
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
                      current_index = index; //자식클래스인 MeasureList로 index변수의 값 넘기기위해 저장
                      return _items[index];
                    })),

            RaisedButton(
              onPressed: () {
                Navigator.pop(context, '무게가 측정되었습니다'); //"/initial"
                setState(() {

                });
              },
              child: Text("제출"),
            ),
          ],
        ),
      ),
    );
  }
}
