import 'package:flutter/material.dart';
import 'package:flutter_login/components/PO_components/discharge_list_item.dart';
import 'package:flutter_login/provider/discharge_list.dart';
import 'package:flutter_login/size.dart';
import 'package:flutter_login/logo.dart';
import 'package:provider/provider.dart';

import 'dischargeReportPage.dart';

class ReportPage extends StatefulWidget {
  @override
  List<DischargeListItem> n_list = [];

  State<StatefulWidget> createState() {
    return _ReportPage();
  }
}

class _ReportPage extends State<ReportPage> {

  @override
  Widget build(BuildContext context) {
    final _discharges = context.watch<DischargeList>().discharges;
    DischargeReportPageState? parent = context.findAncestorStateOfType<DischargeReportPageState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Logo("배출목록"),
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
                    itemCount: _discharges.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _discharges[index];
                    })),
          ],
        ),
      ),
    );
  }
}
