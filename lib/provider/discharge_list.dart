import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_login/components/PO_components/discharge_list_item.dart';

class DischargeList extends ChangeNotifier {
  // 배출목록이 저장되는 리스트 생성
  List<DischargeListItem> _discharges = [];


  // An unmodifiable view of the items in the cart.
  UnmodifiableListView<DischargeListItem> get discharges  => UnmodifiableListView(_discharges);

  // 배출목록을 리스트에 추가하는 메소드
  void add_discharge_list(DischargeListItem item) {
    _discharges.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  // 배출목록을 리스트에서 삭제하는 메소드
  void remove_discharge_list(int index) {
    _discharges.removeAt(index);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}