// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_chat_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LiveChatMobXStore on _LiveChatMobXStoreMobX, Store {
  final _$_placesAtom = Atom(name: '_LiveChatMobXStoreMobX._places');

  @override
  List<ResultsLiveChat> get _places {
    _$_placesAtom.reportRead();
    return super._places;
  }

  @override
  set _places(List<ResultsLiveChat> value) {
    _$_placesAtom.reportWrite(value, super._places, () {
      super._places = value;
    });
  }

  final _$_LiveChatMobXStoreMobXActionController =
      ActionController(name: '_LiveChatMobXStoreMobX');

  @override
  void places(List<ResultsLiveChat> places) {
    final _$actionInfo = _$_LiveChatMobXStoreMobXActionController.startAction(
        name: '_LiveChatMobXStoreMobX.places');
    try {
      return super.places(places);
    } finally {
      _$_LiveChatMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
