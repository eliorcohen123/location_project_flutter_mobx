import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mobx_map_list.g.dart';

class MobXMapListStore = _MobXMapList with _$MobXMapListStore;

abstract class _MobXMapList with Store {
  @observable
  ObservableList<Marker> _markers = ObservableList.of([]);
  @observable
  bool _isSearching = false;

  List<Marker> get markersGet => _markers;

  bool get isSearchingGet => _isSearching;

  @action
  void clearMarkers() {
    _markers.clear();
  }

  @action
  void isSearching(bool isSearching) {
    _isSearching = isSearching;
  }
}
