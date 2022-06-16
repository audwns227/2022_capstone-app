import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/provider/collcom_pickup_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/collector_list_provider.dart';

class CollectorListForm extends StatelessWidget{
  CollectorListForm(this.collector_name, this.count, this.weight);
  final String collector_name;
  final String count;
  final String weight;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "중상명 : " + collector_name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 개수 : " + count + "개",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 무게 : " + weight + "KG",
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
                        Provider.of<CollectorListProvider>(context, listen: false).remove_collector_list();
                        Provider.of<CollcomPickupListProvider>(context, listen: false).add_collcompickup_list(CollectorListForm("홍길동", "4", "46"));
                        Navigator.pushNamed(context, "/mainCollCom");
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