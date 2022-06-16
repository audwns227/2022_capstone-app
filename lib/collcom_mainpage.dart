import 'package:flutter/material.dart';
import 'collcom_navigationbar/collect_page.dart';
import 'collcom_navigationbar/collector_list_page.dart';
import 'collcom_navigationbar/report_page.dart';
import 'collcom_navigationbar/my_page.dart';

class CollComMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollComMainPage();
}

class _CollComMainPage extends State<CollComMainPage> with SingleTickerProviderStateMixin {
  TabController? controller;
  String? id;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        appBar: AppBar(title: Text("좌상")),
        body: TabBarView(
          children: <Widget>[
            // TabBarView에 채울 위젯들
            CollectorListPage(),
            CollectPage(),
            ReportPage(),
            MyPage(),
          ],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.map),
            ),
            Tab(
              icon: Icon(Icons.star),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
          labelColor: Colors.amber,
          indicatorColor: Colors.deepOrangeAccent,
          controller: controller,
        ));
  }
}
