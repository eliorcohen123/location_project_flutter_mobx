// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_map_list_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomMapListMobXStore on _CustomMapListMobXStoreMobX, Store {
  final _$_markersAtom = Atom(name: '_CustomMapListMobXStoreMobX._markers');

  @override
  ObservableList<Marker> get _markers {
    _$_markersAtom.reportRead();
    return super._markers;
  }

  @override
  set _markers(ObservableList<Marker> value) {
    _$_markersAtom.reportWrite(value, super._markers, () {
      super._markers = value;
    });
  }

  final _$_checkingBottomSheetAtom =
      Atom(name: '_CustomMapListMobXStoreMobX._checkingBottomSheet');

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

  final _$_CustomMapListMobXStoreMobXActionController =
      ActionController(name: '_CustomMapListMobXStoreMobX');

  @override
  void clearMarkers() {
    final _$actionInfo = _$_CustomMapListMobXStoreMobXActionController
        .startAction(name: '_CustomMapListMobXStoreMobX.clearMarkers');
    try {
      return super.clearMarkers();
    } finally {
      _$_CustomMapListMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isCheckingBottomSheet(bool checkingBottomSheet) {
    final _$actionInfo = _$_CustomMapListMobXStoreMobXActionController
        .startAction(name: '_CustomMapListMobXStoreMobX.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(checkingBottomSheet);
    } finally {
      _$_CustomMapListMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
