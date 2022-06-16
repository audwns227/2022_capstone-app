import 'package:flutter/foundation.dart';

class Count extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment_count() {
    _count += 1;
    notifyListeners(); //must be inserted
  }

  void decrement_count() {
    _count -= 1;
    notifyListeners(); //must be inserted
  }

  void setZero_count(){
    _count = 0;
    notifyListeners();
  }
}