// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_favorite_places.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXFavoritePlacesStore on _MobXFavoritePlaces, Store {
  final _$_resultsSqflAtom = Atom(name: '_MobXFavoritePlaces._resultsSqfl');

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

  final _$_isCheckingBottomSheetAtom =
      Atom(name: '_MobXFavoritePlaces._isCheckingBottomSheet');

  @override
  bool get _isCheckingBottomSheet {
    _$_isCheckingBottomSheetAtom.reportRead();
    return super._isCheckingBottomSheet;
  }

  @override
  set _isCheckingBottomSheet(bool value) {
    _$_isCheckingBottomSheetAtom
        .reportWrite(value, super._isCheckingBottomSheet, () {
      super._isCheckingBottomSheet = value;
    });
  }

  final _$_MobXFavoritePlacesActionController =
      ActionController(name: '_MobXFavoritePlaces');

  @override
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    final _$actionInfo = _$_MobXFavoritePlacesActionController.startAction(
        name: '_MobXFavoritePlaces.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(isCheckingBottomSheet);
    } finally {
      _$_MobXFavoritePlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(ResultsSqfl result, int index) {
    final _$actionInfo = _$_MobXFavoritePlacesActionController.startAction(
        name: '_MobXFavoritePlaces.deleteItem');
    try {
      return super.deleteItem(result, index);
    } finally {
      _$_MobXFavoritePlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteData() {
    final _$actionInfo = _$_MobXFavoritePlacesActionController.startAction(
        name: '_MobXFavoritePlaces.deleteData');
    try {
      return super.deleteData();
    } finally {
      _$_MobXFavoritePlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getItems() {
    final _$actionInfo = _$_MobXFavoritePlacesActionController.startAction(
        name: '_MobXFavoritePlaces.getItems');
    try {
      return super.getItems();
    } finally {
      _$_MobXFavoritePlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
