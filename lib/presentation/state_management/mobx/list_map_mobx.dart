import 'package:mobx/mobx.dart';

part 'list_map_mobx.g.dart';

class ListMapMobXStore = _ListMapMobXStoreMobXStoreMobX with _$ListMapMobXStore;

abstract class _ListMapMobXStoreMobXStoreMobX with Store {
  @observable
  bool _activeSearch = false,
      _activeNav = false,
      _checkingBottomSheet = false,
      _search = true,
      _searchAfter = false;
  @observable
  int _count;

  bool get searchAfterGet => _searchAfter;

  bool get searchGet => _search;

  bool get checkingBottomSheetGet => _checkingBottomSheet;

  bool get activeSearchGet => _activeSearch;

  bool get activeNavGet => _activeNav;

  int get countGet => _count;

  @action
  void isSearch(bool search) {
    _search = search;
  }

  @action
  void isSearchAfter(bool searchAfter) {
    _searchAfter = searchAfter;
  }

  @action
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    _checkingBottomSheet = checkingBottomSheet;
  }

  @action
  void isActiveSearch(bool activeSearch) {
    _activeSearch = activeSearch;
  }

  @action
  void isActiveNav(bool activeNav) {
    _activeNav = activeNav;
  }

  @action
  void count(int count) {
    _count = count;
  }
}
