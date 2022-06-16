import 'package:flutter/material.dart';
//배출자 등록/삭제 페이지
import 'manage/addPOPage.dart';
import 'manage/deletePOPage.dart';
// class ManagePOPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState(){
//     return _ManagePOPage();
//   }
// }

// class _ManagePOPage extends State<ManagePOPage>{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold();
//   }
// }

class ManagePOPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Text("배출자 관리"),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.add),
                        text: "등록",
                      ),
                      Tab(
                        icon: Icon(Icons.delete),
                        text: "삭제",
                      ),
                    ],
                  ),
                ),
                body: TabBarView(children: <Widget>[
                  AddPOPage(),
                  DeletePOPage(),
                ]))));
  }
}
