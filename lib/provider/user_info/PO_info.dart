import 'package:flutter/foundation.dart';

class POInfo extends ChangeNotifier {
  String? _phone_num;
  String? _username;
  String? _address;
  String? _account;
  String? _po_name;
  String? _business_num;
  String? _password;
  String _job = '식당';

  String? get PO_phonenum => _phone_num;
  String? get PO_username => _username;
  String? get PO_address => _address;
  String? get PO_account => _account;
  String? get PO_name => _po_name;
  String? get PO_bussiness_num => _business_num;
  String? get PO_password => _password;
  String get PO_job => _job;

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