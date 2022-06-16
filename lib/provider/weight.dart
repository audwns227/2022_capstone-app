import 'package:flutter/foundation.dart';

class Weight extends ChangeNotifier {
  double _weight = 0.0;

  double get weight => _weight;

  void increment_weight(double value) {
    _weight += value;
    notifyListeners(); //must be inserted
  }

  void decrement_weight(double value) {
    _weight -= value;
    notifyListeners(); //must be inserted
  }

  void setZero_weight(){
    _weight = 0;
    notifyListeners();
  }
}