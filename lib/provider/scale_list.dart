import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_login/components/PO_components/scale_measure_list_form.dart';

class ScaleList extends ChangeNotifier {
  // 측정한 무게 들어갈 리스트 생성
  List<MeasureList> _items = [];

  // An unmodifiable view of the items in the cart.
  UnmodifiableListView<MeasureList> get items => UnmodifiableListView(_items);

  // item을 추가하는 메소드
  void add_weight_list(MeasureList item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  // 해당 인덱스에 해당하는 항목 삭제
  void remove_weighgt_list(int index) {
    _items.removeAt(index);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove_all() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}