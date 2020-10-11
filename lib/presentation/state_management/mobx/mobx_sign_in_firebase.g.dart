// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_sign_in_firebase.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXSignInFirebaseStore on _MobXSignInFirebase, Store {
  final _$_sharedPrefsAtom = Atom(name: '_MobXSignInFirebase._sharedPrefs');

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

  final _$_isSuccessAtom = Atom(name: '_MobXSignInFirebase._isSuccess');

  @override
  bool get _isSuccess {
    _$_isSuccessAtom.reportRead();
    return super._isSuccess;
  }

  @override
  set _isSuccess(bool value) {
    _$_isSuccessAtom.reportWrite(value, super._isSuccess, () {
      super._isSuccess = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_MobXSignInFirebase._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_textErrorAtom = Atom(name: '_MobXSignInFirebase._textError');

  @override
  String get _textError {
    _$_textErrorAtom.reportRead();
    return super._textError;
  }

  @override
  set _textError(String value) {
    _$_textErrorAtom.reportWrite(value, super._textError, () {
      super._textError = value;
    });
  }

  final _$_MobXSignInFirebaseActionController =
      ActionController(name: '_MobXSignInFirebase');

  @override
  void sharedPref(SharedPreferences sharedPrefs) {
    final _$actionInfo = _$_MobXSignInFirebaseActionController.startAction(
        name: '_MobXSignInFirebase.sharedPref');
    try {
      return super.sharedPref(sharedPrefs);
    } finally {
      _$_MobXSignInFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSuccess(bool isSuccess) {
    final _$actionInfo = _$_MobXSignInFirebaseActionController.startAction(
        name: '_MobXSignInFirebase.isSuccess');
    try {
      return super.isSuccess(isSuccess);
    } finally {
      _$_MobXSignInFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoading(bool isLoading) {
    final _$actionInfo = _$_MobXSignInFirebaseActionController.startAction(
        name: '_MobXSignInFirebase.isLoading');
    try {
      return super.isLoading(isLoading);
    } finally {
      _$_MobXSignInFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textError(String textError) {
    final _$actionInfo = _$_MobXSignInFirebaseActionController.startAction(
        name: '_MobXSignInFirebase.textError');
    try {
      return super.textError(textError);
    } finally {
      _$_MobXSignInFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
