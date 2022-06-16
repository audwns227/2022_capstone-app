import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_login/components/Collector_components/po_list_form.dart';
import 'package:flutter_login/components/PO_components/discharge_list_item.dart';

import '../components/CollCom_components/collector_list_form.dart';

class CollcomPickupListProvider extends ChangeNotifier {
  // 중상에서 필요한 식당목록이 저장되는 리스트 생성
  List<CollectorListForm> _collcompickup = [];


  // An unmodifiable view of the items in the cart.
  UnmodifiableListView<CollectorListForm> get collcompickup  => UnmodifiableListView(_collcompickup);

  // 배출목록을 리스트에 추가하는 메소드
  void add_collcompickup_list(CollectorListForm item) {
    _collcompickup.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}