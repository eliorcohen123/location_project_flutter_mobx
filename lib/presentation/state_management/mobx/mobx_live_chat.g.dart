// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_live_chat.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXLiveChatStore on _MobXLiveChat, Store {
  final _$_sharedPrefsAtom = Atom(name: '_MobXLiveChat._sharedPrefs');

  @override
  SharedPreferences get _sharedPrefs {
    _$_sharedPrefsAtom.reportRead();
    return super._sharedPrefs;
  }

  @override
  set _sharedPrefs(SharedPreferences value) {
    _$_sharedPrefsAtom.reportWrite(value, super._sharedPrefs, () {
      super._sharedPrefs = value;
    });
  }

  final _$_placesAtom = Atom(name: '_MobXLiveChat._places');

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

  final _$_MobXLiveChatActionController =
      ActionController(name: '_MobXLiveChat');

  @override
  void sharedPref(SharedPreferences sharedPrefs) {
    final _$actionInfo = _$_MobXLiveChatActionController.startAction(
        name: '_MobXLiveChat.sharedPref');
    try {
      return super.sharedPref(sharedPrefs);
    } finally {
      _$_MobXLiveChatActionController.endAction(_$actionInfo);
    }
  }

  @override
  void lPlaces(List<ResultsLiveChat> places) {
    final _$actionInfo = _$_MobXLiveChatActionController.startAction(
        name: '_MobXLiveChat.lPlaces');
    try {
      return super.lPlaces(places);
    } finally {
      _$_MobXLiveChatActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
