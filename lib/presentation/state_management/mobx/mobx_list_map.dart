import 'package:mobx/mobx.dart';

part 'mobx_list_map.g.dart';

class MobXListMapStore = _MobXListMap with _$MobXListMapStore;

abstract class _MobXListMap with Store {
  @observable
  bool _isActiveSearch = false,
      _isActiveNav = false,
      _isCheckingBottomSheet = false,
      _isSearching = true,
      _isSearchingAfter = false;
  @observable
  int _count;

  bool get isSearchingAfterGet => _isSearchingAfter;

  bool get isSearchingGet => _isSearching;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  bool get isActiveSearchGet => _isActiveSearch;

  bool get isActiveNavGet => _isActiveNav;

  int get countGet => _count;

  @action
  void isSearching(bool isSearching) {
    _isSearching = isSearching;
  }

  @action
  void isSearchAfter(bool isSearchAfter) {
    _isSearchingAfter = isSearchAfter;
  }

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }

  @action
  void isActiveSearch(bool isActiveSearch) {
    _isActiveSearch = isActiveSearch;
  }

  @action
  void isActiveNav(bool isActiveNav) {
    _isActiveNav = isActiveNav;
  }

  @action
  void count(int count) {
    _count = count;
  }
}
