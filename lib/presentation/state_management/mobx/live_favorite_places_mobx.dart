import 'package:locationprojectflutter/data/models/model_live_favorites/results_live_favorites.dart';
import 'package:mobx/mobx.dart';

part 'live_favorite_places_mobx.g.dart';

class LiveFavoritePlacesMobXStore = _LiveFavoritePlacesMobXStoreMobX
    with _$LiveFavoritePlacesMobXStore;

abstract class _LiveFavoritePlacesMobXStoreMobX with Store {
  @observable
  List<ResultsFirestore> _places = List();
  @observable
  bool _checkingBottomSheet = false;

  List<ResultsFirestore> get placesGet => _places;

  bool get checkingBottomSheetGet => _checkingBottomSheet;

  @action
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    _checkingBottomSheet = checkingBottomSheet;
  }

  @action
  void places(List<ResultsFirestore> places) {
    _places = places;
  }
}
