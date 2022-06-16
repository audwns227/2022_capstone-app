//scale_measure_list_form.dart
//맨마지막꺼만 삭제됨

import 'package:flutter/material.dart';
import 'package:flutter_login/pages/PO_pages/scale_measure_page.dart';
import 'package:flutter_login/provider/scale_list.dart';
import 'package:provider/provider.dart';

import '/provider/count.dart';
import '/provider/weight.dart';

class MeasureList extends StatefulWidget {
  MeasureList(this.weight);

  double weight = 0;

  late int here_index; //부모클래스인 MeasurePage에서 index받아올 변수

  @override
  MeasureListState createState() => MeasureListState();
}

class MeasureListState extends State<MeasureList> {
  @override
  Widget build(BuildContext context) {
    MeasurePageState? parent = context.findAncestorStateOfType<MeasurePageState>(); //Parent child관계를 생성하는코드

    widget.here_index = parent!.current_index;

    return Form(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.weight.toString() + "KG",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(widget.here_index.toString()), //인덱스가 잘 변경되나 확인하기위해 만든 코드
              OutlinedButton(
                  onPressed: () {
                    context.read<ScaleList>().remove_weighgt_list(widget.here_index);
                    context.read<Weight>().decrement_weight(widget.weight); //
                    context.read<Count>().decrement_count();
                    parent.current_index -= 1;


                    // setState(() {
                    //   widget.select_n = parent.n;
                    //   widget.here_index = widget.select_n[parent.index];
                    //   parent.items.removeAt(widget.here_index); //삭제버튼 클릭시 해당 인덱스의 항목 삭제
                    //   parent.current_index -= 1; //index를 하나 줄여줌
                    //   parent.total_weight -= widget.weight; //삭제버튼 눌렀을때 전체량 감소
                    //   parent.count -= 1; //리스트에서 삭제하면 리스트 길이 출력으로 변경되나
                    //
                    // });
                  },
                  child: Text('삭제', style: TextStyle(color: Colors.black))),
            ],
          ),
          Container(
            width: 500,
            child: Divider(
              color: Colors.black,
              thickness: 1.0,
            ),
          )
        ],
      ),
    );
  }
}
