import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'custom_map_list_mobx.g.dart';

class CustomMapListMobXStore = _CustomMapListMobXStoreMobX
    with _$CustomMapListMobXStore;

abstract class _CustomMapListMobXStoreMobX with Store {
  @observable
  ObservableList<Marker> _markers = ObservableList.of([]);
  @observable
  bool _checkingBottomSheet = false;

  ObservableList<Marker> get markersGet => _markers;

  bool get checkingBottomSheetGet => _checkingBottomSheet;

  @action
  void clearMarkers() {
    _markers.clear();
  }

  @action
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    _checkingBottomSheet = checkingBottomSheet;
  }
}
