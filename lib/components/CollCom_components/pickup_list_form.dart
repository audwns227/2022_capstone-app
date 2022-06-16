import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickUpListForm extends StatefulWidget{
  PickUpListForm(this.collector_name, this.count, this.weight);
  final String collector_name;
  final String count;
  final String weight;

  @override
  State<PickUpListForm> createState() => _PickUpListFormState();
}

class _PickUpListFormState extends State<PickUpListForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "중상명 : " + widget.collector_name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 개수 : " + widget.count + "개",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 무게 : " + widget.weight + "KG",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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