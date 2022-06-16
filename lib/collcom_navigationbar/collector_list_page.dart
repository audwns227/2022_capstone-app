import 'package:flutter/material.dart';
import 'package:flutter_login/components/CollCom_components/collector_list_form.dart';
import 'package:provider/provider.dart';

import '../logo.dart';
import '../provider/collector_list_provider.dart';

class CollectorListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _CollectorListPage();
  }
}

class _CollectorListPage extends State<CollectorListPage>{

  List<CollectorListForm> collector_list = [];

  @override
  Widget build(BuildContext context){
    final _collector = context.watch<CollectorListProvider>().collector;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Logo("중상리스트"),
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
                      itemCount: _collector.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _collector[index];
                      })),
            ],
          ),
      ),
    );

  }
}