// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_home_chat.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXHomeChatStore on _MobXHomeChat, Store {
  final _$_sharedPrefsAtom = Atom(name: '_MobXHomeChat._sharedPrefs');

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

  final _$_MobXHomeChatActionController =
      ActionController(name: '_MobXHomeChat');

  @override
  void sharedPref(SharedPreferences sharedPrefs) {
    final _$actionInfo = _$_MobXHomeChatActionController.startAction(
        name: '_MobXHomeChat.sharedPref');
    try {
      return super.sharedPref(sharedPrefs);
    } finally {
      _$_MobXHomeChatActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
