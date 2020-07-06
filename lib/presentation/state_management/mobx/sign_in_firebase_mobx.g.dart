// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_firebase_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInFirebaseMobXStore on _SignInFirebaseMobXStoreMobX, Store {
  final _$_successAtom = Atom(name: '_SignInFirebaseMobXStoreMobX._success');

  @override
  bool get _success {
    _$_successAtom.reportRead();
    return super._success;
  }

  @override
  set _success(bool value) {
    _$_successAtom.reportWrite(value, super._success, () {
      super._success = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_SignInFirebaseMobXStoreMobX._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_isLoggedInAtom =
      Atom(name: '_SignInFirebaseMobXStoreMobX._isLoggedIn');

  @override
  bool get _isLoggedIn {
    _$_isLoggedInAtom.reportRead();
    return super._isLoggedIn;
  }

  @override
  set _isLoggedIn(bool value) {
    _$_isLoggedInAtom.reportWrite(value, super._isLoggedIn, () {
      super._isLoggedIn = value;
    });
  }

  final _$_textErrorAtom =
      Atom(name: '_SignInFirebaseMobXStoreMobX._textError');

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

  final _$_SignInFirebaseMobXStoreMobXActionController =
      ActionController(name: '_SignInFirebaseMobXStoreMobX');

  @override
  void success(bool success) {
    final _$actionInfo = _$_SignInFirebaseMobXStoreMobXActionController
        .startAction(name: '_SignInFirebaseMobXStoreMobX.success');
    try {
      return super.success(success);
    } finally {
      _$_SignInFirebaseMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loading(bool loading) {
    final _$actionInfo = _$_SignInFirebaseMobXStoreMobXActionController
        .startAction(name: '_SignInFirebaseMobXStoreMobX.loading');
    try {
      return super.loading(loading);
    } finally {
      _$_SignInFirebaseMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoggedIn(bool isLoggedIn) {
    final _$actionInfo = _$_SignInFirebaseMobXStoreMobXActionController
        .startAction(name: '_SignInFirebaseMobXStoreMobX.isLoggedIn');
    try {
      return super.isLoggedIn(isLoggedIn);
    } finally {
      _$_SignInFirebaseMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textError(String textError) {
    final _$actionInfo = _$_SignInFirebaseMobXStoreMobXActionController
        .startAction(name: '_SignInFirebaseMobXStoreMobX.textError');
    try {
      return super.textError(textError);
    } finally {
      _$_SignInFirebaseMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
