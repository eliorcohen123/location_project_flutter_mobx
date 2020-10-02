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
  @observable
  String _finalTagsChips;
  @observable
  List<String> _tagsChips = [];

  bool get isSearchingAfterGet => _isSearchingAfter;

  bool get isSearchingGet => _isSearching;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  bool get isActiveSearchGet => _isActiveSearch;

  bool get isActiveNavGet => _isActiveNav;

  int get countGet => _count;

  String get finalTagsChipsGet => _finalTagsChips;

  List<String> get tagsChipsGet => _tagsChips;

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

  @action
  void finalTagsChips(String finalTagsChips) {
    _finalTagsChips = finalTagsChips
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(', ', '')
        .replaceAll('Banks', '&bank')
        .replaceAll('Bars', '&bar|night_club')
        .replaceAll('Beauty', '&beauty_salon|hair_care')
        .replaceAll('Books', '&book_store|library')
        .replaceAll('Bus stations', '&bus_station')
        .replaceAll('Cars', '&car_dealer|car_rental|car_repair|car_wash')
        .replaceAll('Clothing', '&clothing_store')
        .replaceAll('Doctors', '&doctor')
        .replaceAll('Gas stations', '&gas_station')
        .replaceAll('Gym', '&gym')
        .replaceAll('Jewelries', '&jewelry_store')
        .replaceAll('Parks', '&park|amusement_park|parking|rv_park')
        .replaceAll('Restaurants', '&food|restaurant|cafe|bakery')
        .replaceAll('School', '&school')
        .replaceAll('Spa', '&spa');
  }

  @action
  void tagsChips(List<String> tagsChips) {
    _tagsChips = tagsChips;
  }
}
