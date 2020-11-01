// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_live_favorite_places.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXLiveFavoritePlacesStore on _MobXLiveFavoritePlaces, Store {
  final _$_isCheckingBottomSheetAtom =
      Atom(name: '_MobXLiveFavoritePlaces._isCheckingBottomSheet');

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

  final _$_MobXLiveFavoritePlacesActionController =
      ActionController(name: '_MobXLiveFavoritePlaces');

  @override
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    final _$actionInfo = _$_MobXLiveFavoritePlacesActionController.startAction(
        name: '_MobXLiveFavoritePlaces.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(isCheckingBottomSheet);
    } finally {
      _$_MobXLiveFavoritePlacesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
