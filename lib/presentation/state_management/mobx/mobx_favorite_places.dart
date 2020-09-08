import 'package:locationprojectflutter/data/data_resources/locals/sqflite_helper.dart';
import 'package:locationprojectflutter/data/models/model_sqfl/results_sqfl.dart';
import 'package:mobx/mobx.dart';

part 'mobx_favorite_places.g.dart';

class MobXFavoritePlacesStore = _MobXFavoritePlaces
    with _$MobXFavoritePlacesStore;

abstract class _MobXFavoritePlaces with Store {
  SQFLiteHelper _db = SQFLiteHelper();
  @observable
  ObservableList<ResultsSqfl> _resultsSqfl = ObservableList.of([]);
  @observable
  bool _isCheckingBottomSheet = false;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  ObservableList<ResultsSqfl> get resultsSqflGet => _resultsSqfl;

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }

  @action
  void deleteItem(ResultsSqfl result, int index) {
    _db.deleteResult(result.id).then(
      (_) {
        _resultsSqfl.removeAt(index);
      },
    );
  }

  @action
  void deleteData() {
    _db.deleteData().then(
      (_) {
        _resultsSqfl.clear();
      },
    );
  }

  @action
  void getItems() {
    _db.getAllResults().then(
      (results) {
        _resultsSqfl.clear();
        results.forEach(
          (result) {
            _resultsSqfl.add(
              ResultsSqfl.fromSqfl(result),
            );
          },
        );
      },
    );
  }
}
