// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_map_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMapMobXStore on _ListMapMobXStoreMobXStoreMobX, Store {
  final _$_activeSearchAtom =
      Atom(name: '_ListMapMobXStoreMobXStoreMobX._activeSearch');

  @override
  bool get _activeSearch {
    _$_activeSearchAtom.reportRead();
    return super._activeSearch;
  }

  @override
  set _activeSearch(bool value) {
    _$_activeSearchAtom.reportWrite(value, super._activeSearch, () {
      super._activeSearch = value;
    });
  }

  final _$_activeNavAtom =
      Atom(name: '_ListMapMobXStoreMobXStoreMobX._activeNav');

  @override
  bool get _activeNav {
    _$_activeNavAtom.reportRead();
    return super._activeNav;
  }

  @override
  set _activeNav(bool value) {
    _$_activeNavAtom.reportWrite(value, super._activeNav, () {
      super._activeNav = value;
    });
  }

  final _$_checkingBottomSheetAtom =
      Atom(name: '_ListMapMobXStoreMobXStoreMobX._checkingBottomSheet');

  @override
  bool get _checkingBottomSheet {
    _$_checkingBottomSheetAtom.reportRead();
    return super._checkingBottomSheet;
  }

  @override
  set _checkingBottomSheet(bool value) {
    _$_checkingBottomSheetAtom.reportWrite(value, super._checkingBottomSheet,
        () {
      super._checkingBottomSheet = value;
    });
  }

  final _$_searchAtom = Atom(name: '_ListMapMobXStoreMobXStoreMobX._search');

  @override
  bool get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(bool value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$_searchAfterAtom =
      Atom(name: '_ListMapMobXStoreMobXStoreMobX._searchAfter');

  @override
  bool get _searchAfter {
    _$_searchAfterAtom.reportRead();
    return super._searchAfter;
  }

  @override
  set _searchAfter(bool value) {
    _$_searchAfterAtom.reportWrite(value, super._searchAfter, () {
      super._searchAfter = value;
    });
  }

  final _$_countAtom = Atom(name: '_ListMapMobXStoreMobXStoreMobX._count');

  @override
  int get _count {
    _$_countAtom.reportRead();
    return super._count;
  }

  @override
  set _count(int value) {
    _$_countAtom.reportWrite(value, super._count, () {
      super._count = value;
    });
  }

  final _$_ListMapMobXStoreMobXStoreMobXActionController =
      ActionController(name: '_ListMapMobXStoreMobXStoreMobX');

  @override
  void isSearch(bool search) {
    final _$actionInfo = _$_ListMapMobXStoreMobXStoreMobXActionController
        .startAction(name: '_ListMapMobXStoreMobXStoreMobX.isSearch');
    try {
      return super.isSearch(search);
    } finally {
      _$_ListMapMobXStoreMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSearchAfter(bool searchAfter) {
    final _$actionInfo = _$_ListMapMobXStoreMobXStoreMobXActionController
        .startAction(name: '_ListMapMobXStoreMobXStoreMobX.isSearchAfter');
    try {
      return super.isSearchAfter(searchAfter);
    } finally {
      _$_ListMapMobXStoreMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    final _$actionInfo =
        _$_ListMapMobXStoreMobXStoreMobXActionController.startAction(
            name: '_ListMapMobXStoreMobXStoreMobX.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(checkingBottomSheet);
    } finally {
      _$_ListMapMobXStoreMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isActiveSearch(bool activeSearch) {
    final _$actionInfo = _$_ListMapMobXStoreMobXStoreMobXActionController
        .startAction(name: '_ListMapMobXStoreMobXStoreMobX.isActiveSearch');
    try {
      return super.isActiveSearch(activeSearch);
    } finally {
      _$_ListMapMobXStoreMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isActiveNav(bool activeNav) {
    final _$actionInfo = _$_ListMapMobXStoreMobXStoreMobXActionController
        .startAction(name: '_ListMapMobXStoreMobXStoreMobX.isActiveNav');
    try {
      return super.isActiveNav(activeNav);
    } finally {
      _$_ListMapMobXStoreMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void count(int count) {
    final _$actionInfo = _$_ListMapMobXStoreMobXStoreMobXActionController
        .startAction(name: '_ListMapMobXStoreMobXStoreMobX.count');
    try {
      return super.count(count);
    } finally {
      _$_ListMapMobXStoreMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
