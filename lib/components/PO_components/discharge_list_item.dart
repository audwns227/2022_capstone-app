import 'package:flutter/material.dart';

class DischargeListItem extends StatefulWidget {
  DischargeListItem(this.date, this.quantity, this.weight);
  final String date;
  final String quantity;
  final String weight;

  @override
  _DischargeListItemState createState() => _DischargeListItemState();
}

class _DischargeListItemState extends State<DischargeListItem> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "배출날짜 : " + widget.date,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "캔 개수 : " + widget.quantity + "개",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "총 무게 : " + widget.weight + "KG",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          // OutlinedButton(  //캡디 이후 추가
          //     onPressed: () {
          //       Navigator.pushNamed(
          //           context, '/example'); //여기 팝업으로 배출자 띄우기, DB에서 불러오기
          //     },
          //     child: Text('배출자 확인하기', style: TextStyle(color: Colors.black))),
          // // OutlinedButton(
          // //     onPressed: () {
          // //       Navigator.pushNamed(
          // //           context, '/example'); //여기 팝업으로 처리상태 띄우기, DB에서 불러오기
          // //     },
          // //     child: Text('처리상태:입금완료', style: TextStyle(color: Colors.black))),
          // OutlinedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(
          //           context, '/example'); //여기 팝업으로 담당중상 띄우기, DB에서 불러오기
          //     },
          //     child: Text('담당 중상 확인하기', style: TextStyle(color: Colors.black))),
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
