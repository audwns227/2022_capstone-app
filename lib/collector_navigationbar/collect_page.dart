import 'package:flutter/material.dart';
import 'package:flutter_login/components/Collector_components/pickup_list_form.dart';
import 'package:flutter_login/provider/pickup_list_provider.dart';
import 'package:provider/provider.dart';

import '../logo.dart';

class CollectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _CollectPage();
  }
}

class _CollectPage extends State<CollectPage>{
  @override
  Widget build(BuildContext context){
    final _pickup = context.watch<PickupListProvider>().pickup;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Logo("수거목록"),
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
                    itemCount: _pickup.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _pickup[index];
                    })),
          ],
        ),
      ),
    );
  }
}