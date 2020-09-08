// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_map_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXMapListStore on _MobXMapList, Store {
  final _$_markersAtom = Atom(name: '_MobXMapList._markers');

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

  final _$_isSearchingAtom = Atom(name: '_MobXMapList._isSearching');

  @override
  bool get _isSearching {
    _$_isSearchingAtom.reportRead();
    return super._isSearching;
  }

  @override
  set _isSearching(bool value) {
    _$_isSearchingAtom.reportWrite(value, super._isSearching, () {
      super._isSearching = value;
    });
  }

  final _$_MobXMapListActionController = ActionController(name: '_MobXMapList');

  @override
  void clearMarkers() {
    final _$actionInfo = _$_MobXMapListActionController.startAction(
        name: '_MobXMapList.clearMarkers');
    try {
      return super.clearMarkers();
    } finally {
      _$_MobXMapListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSearching(bool isSearching) {
    final _$actionInfo = _$_MobXMapListActionController.startAction(
        name: '_MobXMapList.isSearching');
    try {
      return super.isSearching(isSearching);
    } finally {
      _$_MobXMapListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
