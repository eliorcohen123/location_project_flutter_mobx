// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_favorite_places_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LiveFavoritePlacesMobXStore on _LiveFavoritePlacesMobXStoreMobX, Store {
  final _$_placesAtom = Atom(name: '_LiveFavoritePlacesMobXStoreMobX._places');

  @override
  List<ResultsFirestore> get _places {
    _$_placesAtom.reportRead();
    return super._places;
  }

  @override
  set _places(List<ResultsFirestore> value) {
    _$_placesAtom.reportWrite(value, super._places, () {
      super._places = value;
    });
  }

  final _$_checkingBottomSheetAtom =
      Atom(name: '_LiveFavoritePlacesMobXStoreMobX._checkingBottomSheet');

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

  final _$_LiveFavoritePlacesMobXStoreMobXActionController =
      ActionController(name: '_LiveFavoritePlacesMobXStoreMobX');

  @override
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    final _$actionInfo =
        _$_LiveFavoritePlacesMobXStoreMobXActionController.startAction(
            name: '_LiveFavoritePlacesMobXStoreMobX.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(checkingBottomSheet);
    } finally {
      _$_LiveFavoritePlacesMobXStoreMobXActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void places(List<ResultsFirestore> places) {
    final _$actionInfo = _$_LiveFavoritePlacesMobXStoreMobXActionController
        .startAction(name: '_LiveFavoritePlacesMobXStoreMobX.places');
    try {
      return super.places(places);
    } finally {
      _$_LiveFavoritePlacesMobXStoreMobXActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
