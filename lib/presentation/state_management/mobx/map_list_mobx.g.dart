// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_list_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapListMobXStore on _MapListMobXStoreMobX, Store {
  final _$_markersAtom = Atom(name: '_MapListMobXStoreMobX._markers');

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

  final _$_searchAtom = Atom(name: '_MapListMobXStoreMobX._search');

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

  final _$_MapListMobXStoreMobXActionController =
      ActionController(name: '_MapListMobXStoreMobX');

  @override
  void clearMarkers() {
    final _$actionInfo = _$_MapListMobXStoreMobXActionController.startAction(
        name: '_MapListMobXStoreMobX.clearMarkers');
    try {
      return super.clearMarkers();
    } finally {
      _$_MapListMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSearch(bool search) {
    final _$actionInfo = _$_MapListMobXStoreMobXActionController.startAction(
        name: '_MapListMobXStoreMobX.isSearch');
    try {
      return super.isSearch(search);
    } finally {
      _$_MapListMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
