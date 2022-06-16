import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickUpListForm extends StatefulWidget{
  PickUpListForm(this.PO_name, this.address, this.count, this.weight);
  final String PO_name;
  final String address;
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
            "식당명 : " + widget.PO_name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "주소 : " + widget.address ,
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