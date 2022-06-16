import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_login/components/CollCom_components/collector_list_form.dart';

class CollectorListProvider extends ChangeNotifier {
  // 중상에서 필요한 식당목록이 저장되는 리스트 생성
  List<CollectorListForm> _collector = [];


  // An unmodifiable view of the items in the cart.
  UnmodifiableListView<CollectorListForm> get collector  => UnmodifiableListView(_collector);

  // 배출목록을 리스트에 추가하는 메소드
  void add_collector_list(CollectorListForm item) {
    _collector.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove_collector_list() {
    _collector.removeAt(0);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}