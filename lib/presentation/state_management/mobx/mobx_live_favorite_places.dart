import 'package:locationprojectflutter/data/models/model_live_favorites/results_live_favorites.dart';
import 'package:mobx/mobx.dart';

part 'mobx_live_favorite_places.g.dart';

class MobXLiveFavoritePlacesStore = _MobXLiveFavoritePlaces
    with _$MobXLiveFavoritePlacesStore;

abstract class _MobXLiveFavoritePlaces with Store {
  @observable
  List<ResultsFirestore> _places = [];
  @observable
  bool _isCheckingBottomSheet = false;

  List<ResultsFirestore> get placesGet => _places;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }

  @action
  void places(List<ResultsFirestore> places) {
    _places = places;
  }
}
