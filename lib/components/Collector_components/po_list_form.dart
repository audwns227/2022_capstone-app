import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class POListForm extends StatelessWidget{
  POListForm(this.PO_name, this.address, this.count, this.weight);
  final String PO_name;
  final String address;
  final String count;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "식당명 : " + PO_name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "주소 : " + address ,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 개수 : " + count + " 개",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 무게 : " + weight + " KG",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          OutlineButton(
            child: Text("수거"),
            onPressed: () {
              // // 3. 유효성 검사
              // if (_formKey.currentState!.validate()) {
              //   Navigator.pushNamed(context, "/home");
              // }
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('수거'),
                  content: const Text('수거하시겠습니까?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('아니요'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/pickup");
                      },
                      child: const Text('네'),
                    ),
                  ],
                ),
              );
            },
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