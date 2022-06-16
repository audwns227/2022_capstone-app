import 'package:flutter/foundation.dart';

class CollComInfo extends ChangeNotifier {
  String? _phone_num;
  String? _username;
  String? _address;
  String? _account;
  String? _po_name;
  String? _business_num;
  String? _password;
  String _job = '좌상';

  String? get collcom_phonenum => _phone_num;
  String? get collcom_username => _username;
  String? get collcom_address => _address;
  String? get collcom_account => _account;
  String? get collcom_name => _po_name;
  String? get collcom_bussiness_num => _business_num;
  String? get collcom_password => _password;
  String get collcom_job => _job;

  void set_phonenum(String text) {
    _phone_num = text;
    notifyListeners();
  }
  void set_username(String text) {
    _username = text;
    notifyListeners();
  }
  void set_address(String text) {
    _address = text;
    notifyListeners();
  }
  void set_account(String text) {
    _account = text;
    notifyListeners();
  }
  void set_POname(String text) {
    _po_name = text;
    notifyListeners();
  }
  void set_businessnum(String text) {
    _business_num = text;
    notifyListeners();
  }
  void set_password(String text) {
    _password = text;
    notifyListeners();
  }
}