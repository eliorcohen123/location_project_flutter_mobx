import 'package:locationprojectflutter/data/data_resources/locals/sqflite_helper.dart';
import 'package:locationprojectflutter/data/models/model_sqfl/results_sqfl.dart';
import 'package:mobx/mobx.dart';

part 'favorite_places_mobx.g.dart';

class FavoritePlacesMobXStore = _FavoritePlacesMobX
    with _$FavoritePlacesMobXStore;

abstract class _FavoritePlacesMobX with Store {
  SQFLiteHelper _db = SQFLiteHelper();
  @observable
  ObservableList<ResultsSqfl> _resultsSqfl = ObservableList.of([]);
  @observable
  bool _checkingBottomSheet = false;

  bool get checkingBottomSheetGet => _checkingBottomSheet;

  List<ResultsSqfl> get resultsSqflGet => _resultsSqfl;

  @action
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    _checkingBottomSheet = checkingBottomSheet;
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
