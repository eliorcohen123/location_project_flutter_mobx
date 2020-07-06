import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map_list_mobx.g.dart';

class MapListMobXStore = _MapListMobXStoreMobX with _$MapListMobXStore;

abstract class _MapListMobXStoreMobX with Store {
  @observable
  ObservableList<Marker> _markers = ObservableList.of([]);
  @observable
  bool _search = false;

  List<Marker> get markersGet => _markers;

  bool get searchGet => _search;

  @action
  void clearMarkers() {
    _markers.clear();
  }

  @action
  void isSearch(bool search) {
    _search = search;
  }
}
