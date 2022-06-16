import 'dart:convert';

import 'package:http/http.dart' as http;

class User{
  String? phone_num;
  String? username;
  String? address;
  String? account;
  String? po_name;
  String? business_num;
  String? password;
  String? job;

  User({this.phone_num,
    this.username,
    this.address,
    this.account,
    this.po_name,
    this.business_num,
    this.password,
    this.job});

  // void nullCheck(){
  //   if(this.phone_num == null)
  //       this.phone_num = 'null';
  //   if(this.username == null)
  //     this.username = 'null';
  //   if(this.address == null)
  //     this.address = 'null';
  //   if(this.po_name == null)
  //     this.po_name = 'null';
  //   if(this.business_num == null)
  //     this.business_num = 'null';
  //   if(this.password == null)
  //     this.password = 'null';
  //   if(this.phone_num == null)
  //     this.phone_num = 'null';
  // }

  User.fromJson(Map<String, dynamic> json) {
    phone_num = json['phone_num'];
    username = json['username'];
    address = json['address'];
    account = json['account'];
    po_name = json['po_name'];
    business_num = json['business_num'];
    password = json['password'];
    job = json['job'];
  }
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['phone_num'] = this.phone_num;
//   data['username'] = this.username;
//   data['adderss'] = this.address;
//   data['account'] = this.account;
//   data['po_name'] = this.po_name;
//   data['business_num'] = this.business_num;
//   data['password'] = this.password;
//   data['job'] = this.job;
// }


}

// Future<List<User>> fetchUsers() async{
// final response = await http.get('https:~~');

// if(response.statusCode == 200){
//   final users = json.decode(response.body);
//
//   List<User> userMap = [];
//   for(var user in users){
//     userMap.add(User(
//       phone_num: user['phone_num'],
//       username: user['username'],
//       address: user['address'],
//       po_name: user['po_name'],
//       business_num: user['business_num'],
//       password: user['password'],
//       job: user['job'],
//     ));
//   }
//   return userMap;
// }
// //예외처리 해주기
// throw Exception('예외처리');
// }