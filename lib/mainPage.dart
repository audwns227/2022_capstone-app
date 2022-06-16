import 'package:flutter/material.dart';
import 'navigationbar/reportPage.dart';
import 'navigationbar/managePOPage.dart';
import 'navigationbar/dischargeReportPage.dart';
import 'navigationbar/settingPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with SingleTickerProviderStateMixin {
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
        appBar: AppBar(title: Text("식당")),
        body: TabBarView(
          children: <Widget>[
            // TabBarView에 채울 위젯들
            ReportPage(),
            ManagePOPage(),
            DischargeReportPage(),
            SettingPage()
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
