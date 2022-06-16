import 'package:flutter/material.dart';
import 'package:flutter_login/components/Collector_components/po_list_form.dart';
import 'package:flutter_login/provider/PO_list_provider.dart';
import 'package:provider/provider.dart';

import '../logo.dart';

class RestaurantListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _RestaurantListPage();
  }
}

class _RestaurantListPage extends State<RestaurantListPage>{

  
  @override
  Widget build(BuildContext context){
    final _po = context.watch<POListProvider>().po;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Logo("식당리스트"),
              Container(
                //선 긋는 container
                width: 500,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
            // POListForm("버거킹 충무로역점", "서울 중구 퇴계로 216", "4", "46"),
            // POListForm("썬더치킨", "서울 중구 퇴계로44길 12", "5", "57"),
            // POListForm("산타돈부리", "서울 중구 서애로 19 1층", "2", "32"),
            // POListForm("사랑채", "서울 중구 필동로 34 삼경하이빌", "3", "39"),
            // POListForm("김치만", "서울 중구 필동로 30-1", "2", "23"),
            // POListForm("온수반", "서울 중구 퇴계로34길 16-9", "4", "52"),

              Expanded(
                  child: ListView.builder(
                    //item리스트를 가지고 리스트뷰 생성
                      itemCount: _po.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _po[index];
                      })),
            ],
          ),
      ),
    );

  }
}