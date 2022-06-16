import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/components/PO_components/discharge_list_item.dart';
import 'package:flutter_login/provider/count.dart';
import 'package:flutter_login/provider/scale_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_login/size.dart';
import 'package:provider/provider.dart';
import '../provider/discharge_list.dart';
import '../provider/weight.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // 로컬 타임 불러오기
import 'package:hashcodes/hashcodes.dart'; // tracking id 생성을 위한 hashcode
import 'package:flutter_login/provider/user_info/PO_info.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final storage = FlutterSecureStorage();

class DischargeReportPage extends StatefulWidget {
  const DischargeReportPage({Key? key}) : super(key: key);

  @override
  DischargeReportPageState createState() => DischargeReportPageState();
}

class DischargeReportPageState extends State<DischargeReportPage> {
  File? _image;
  final picker = ImagePicker();

  late double weight;
  late int list_num;

  String currentTime = "";

  // List<DischargeListItem> history = [];

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  Future<String> postDischarge() async {

    var now = DateTime.now();
    currentTime = DateFormat('yy/MM/dd - HH:mm:ss').format(now);
    print(currentTime);
    // print(currentTime.runtimeType);

    var currentHash = currentTime.hashCode;
    print(currentHash); // 현재시간 연,월,일, 시,분,초 기준 해시값 생성 -> tracking id로 부여

    var provider = Provider.of<POInfo>(context, listen: false);
    var count = Provider.of<Count>(context, listen: false).count;
    var weight = Provider.of<Weight>(context, listen: false).weight;
    print("provider로부터 받아온 count : ${count}");
    print("provider로부터 받아온 weight : ${weight}");

    Map<String, Map<String, Object>> data = {
      "Tracking": {
        "Can_info": {
          "QTY" : count,
          // "KG" : weight
        },
        "Image_id": "필수", // 해야됨
        "PO_id": "",
        "Status": {
          "Type" : "등록",
          "From" : "",
          "To" : ""
        },
        "Tracking_id": currentHash
      },
      "Image":{
        "Image_id":"필수",  // 해야됨
        "Image_url": "필수",  // 해야됨
        "Tracking_id": currentHash
      },
      "PO":{
        "Discharge_date": currentTime,
        "Open_status": "영업중",
        "PO_id": "",
        "PO_info": {
          "주소" : provider.PO_address, // provider 로 불러와서 넣기
          "상호명" : provider.PO_name
        },
        "Tracking_id": currentHash
      }
    };

    print("map 선언 성공");

    if(data.isNotEmpty){
      var body = json.encode(data);
      print("body 출력" + body);
    }
    else{
      print("json encode 실패");
    }
    var body = json.encode(data);

    // 기기에 저장된 AccessToken 로드
    final accessToken = await storage.read(key: 'ACCESS_TOKEN');
    print(accessToken);

    final header = {
      "Content-type": "application/json",
      "Authorization": 'Bearer $accessToken'
    };

    var url = Uri.parse("http://54.180.87.157/qldb/discharge");
    var response = await http.post(url, headers: header, body: body);
    print(response.statusCode);
    // if (response.body == null)
    // print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);

      print((response.body).runtimeType);
      final res = json.decode(response.body);
      print(res);

      print(await storage.readAll());

      return response.body;
    }

    throw Exception('데이터수신실패');
  }

  int _modifiedcount = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _modifiedcount++;
  //   });
  // }
  //
  // void _decrementCounter() {
  //   setState(() {
  //     _modifiedcount--;
  //   });
  // }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? Text('  카메라 버튼을 눌러 \n 폐식용유를 찍어주세요.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    final _weight = context.watch<Weight>().weight; //provider에서 총무게 가져옴
    final _count = context.watch<Count>().count;  //provider에서 총개수 가져옴

    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: const Color(0xfff4f3f9),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25.0),
              showImage(),
              SizedBox(
                height: 25.0,
              ),
              // Text("폐식용유를 찍어주세요."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // 카메라 촬영 버튼
                  FloatingActionButton(
                    child: Icon(Icons.add_a_photo),
                    tooltip: 'pick Iamge',
                    heroTag: '사진촬영', //There are multiple heroes that share the same tag within a subtree. 오류 해결

                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                  ),

                  // 갤러리에서 이미지를 가져오는 버튼
                  // FloatingActionButton(
                  //   child: Icon(Icons.wallpaper),
                  //   tooltip: 'pick Iamge',
                  //   heroTag: '갤러리에서 사진선택',
                  //   onPressed: () {
                  //     getImage(ImageSource.gallery);
                  //   },
                  // ),

                  //예시로 만든버튼(무게 측정 페이지로 이동)
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Measure');
                    },
                    child: Text("무게측정"),
                  ),
                ],
              ),
              SizedBox(height: medium_gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "총 수량: " + _count.toString() + "개",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  //TextField:입력한 값을 current_weight변수에 저장
                  // 폐식용유 수량 down 버튼
                  // FloatingActionButton(
                  //   child: Icon(Icons.arrow_drop_down),
                  //   onPressed: () {
                  //     _decrementCounter();
                  //   },
                  // ),
                  // FloatingActionButton(
                  //   child: Icon(Icons.arrow_drop_up),
                  //   onPressed: () {
                  //     _incrementCounter();
                  //   },
                  // ),
                ],
              ),
              SizedBox(height: medium_gap),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "총 무게: " + _weight.toString() + "KG",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  //TextField:입력한 값을 current_weight변수에 저장
                ],
              ),
              RaisedButton(
                  onPressed: () {
                    postDischarge();
                    Navigator.pushNamed(context, "/mainPO");
                    context.read<DischargeList>().add_discharge_list(DischargeListItem(currentTime, _count.toString(), _weight.toString()));
                    context.read<ScaleList>().remove_all();  //배출하면 리스트 초기화(새로운 값 받기위해)
                    context.read<Count>().setZero_count();   //배출하면 총 개수 초기화(새로운 무게 측정 위해)
                    context.read<Weight>().setZero_weight(); //배출하면 총 무게 초기화(새로운 무게측정 위해)
                  },
                  child: Text('배출', style: TextStyle(color: Colors.black))),
            ],
          ),
        ));
  }
}
