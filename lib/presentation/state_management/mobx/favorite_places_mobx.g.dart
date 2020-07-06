// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_places_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritePlacesMobXStore on _FavoritePlacesMobX, Store {
  final _$_resultsSqflAtom = Atom(name: '_FavoritePlacesMobX._resultsSqfl');

  @override
  ObservableList<ResultsSqfl> get _resultsSqfl {
    _$_resultsSqflAtom.reportRead();
    return super._resultsSqfl;
  }

  @override
  set _resultsSqfl(ObservableList<ResultsSqfl> value) {
    _$_resultsSqflAtom.reportWrite(value, super._resultsSqfl, () {
      super._resultsSqfl = value;
    });
  }

  final _$_checkingBottomSheetAtom =
      Atom(name: '_FavoritePlacesMobX._checkingBottomSheet');

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

  final _$_FavoritePlacesMobXActionController =
      ActionController(name: '_FavoritePlacesMobX');

  @override
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    final _$actionInfo = _$_FavoritePlacesMobXActionController.startAction(
        name: '_FavoritePlacesMobX.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(checkingBottomSheet);
    } finally {
      _$_FavoritePlacesMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(ResultsSqfl result, int index) {
    final _$actionInfo = _$_FavoritePlacesMobXActionController.startAction(
        name: '_FavoritePlacesMobX.deleteItem');
    try {
      return super.deleteItem(result, index);
    } finally {
      _$_FavoritePlacesMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteData() {
    final _$actionInfo = _$_FavoritePlacesMobXActionController.startAction(
        name: '_FavoritePlacesMobX.deleteData');
    try {
      return super.deleteData();
    } finally {
      _$_FavoritePlacesMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getItems() {
    final _$actionInfo = _$_FavoritePlacesMobXActionController.startAction(
        name: '_FavoritePlacesMobX.getItems');
    try {
      return super.getItems();
    } finally {
      _$_FavoritePlacesMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
