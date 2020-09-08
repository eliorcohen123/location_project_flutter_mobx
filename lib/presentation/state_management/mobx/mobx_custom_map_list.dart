import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mobx_custom_map_list.g.dart';

class MobXCustomMapListStore = _MobXCustomMapList
    with _$MobXCustomMapListStore;

abstract class _MobXCustomMapList with Store {
  @observable
  ObservableList<Marker> _markers = ObservableList.of([]);
  @observable
  bool _isCheckingBottomSheet = false;

  ObservableList<Marker> get markersGet => _markers;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  @action
  void clearMarkers() {
    _markers.clear();
  }

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }
}
