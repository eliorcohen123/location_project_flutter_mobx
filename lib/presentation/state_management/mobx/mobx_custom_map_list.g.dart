// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_custom_map_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXCustomMapListStore on _MobXCustomMapList, Store {
  final _$_markersAtom = Atom(name: '_MobXCustomMapList._markers');

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

  final _$_isCheckingBottomSheetAtom =
      Atom(name: '_MobXCustomMapList._isCheckingBottomSheet');

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

  final _$_MobXCustomMapListActionController =
      ActionController(name: '_MobXCustomMapList');

  @override
  void clearMarkers() {
    final _$actionInfo = _$_MobXCustomMapListActionController.startAction(
        name: '_MobXCustomMapList.clearMarkers');
    try {
      return super.clearMarkers();
    } finally {
      _$_MobXCustomMapListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    final _$actionInfo = _$_MobXCustomMapListActionController.startAction(
        name: '_MobXCustomMapList.isCheckingBottomSheet');
    try {
      return super.isCheckingBottomSheet(isCheckingBottomSheet);
    } finally {
      _$_MobXCustomMapListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
