// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_register_email_firebase.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXRegisterEmailFirebaseStore on _MobXRegisterEmailFirebase, Store {
  final _$_iSuccessAtom = Atom(name: '_MobXRegisterEmailFirebase._iSuccess');

  @override
  bool get _iSuccess {
    _$_iSuccessAtom.reportRead();
    return super._iSuccess;
  }

  @override
  set _iSuccess(bool value) {
    _$_iSuccessAtom.reportWrite(value, super._iSuccess, () {
      super._iSuccess = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_MobXRegisterEmailFirebase._isLoading');

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

  final _$_textErrorAtom = Atom(name: '_MobXRegisterEmailFirebase._textError');

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

  final _$_MobXRegisterEmailFirebaseActionController =
      ActionController(name: '_MobXRegisterEmailFirebase');

  @override
  void isSuccess(bool isSuccess) {
    final _$actionInfo = _$_MobXRegisterEmailFirebaseActionController
        .startAction(name: '_MobXRegisterEmailFirebase.isSuccess');
    try {
      return super.isSuccess(isSuccess);
    } finally {
      _$_MobXRegisterEmailFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoading(bool isLoading) {
    final _$actionInfo = _$_MobXRegisterEmailFirebaseActionController
        .startAction(name: '_MobXRegisterEmailFirebase.isLoading');
    try {
      return super.isLoading(isLoading);
    } finally {
      _$_MobXRegisterEmailFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textError(String textError) {
    final _$actionInfo = _$_MobXRegisterEmailFirebaseActionController
        .startAction(name: '_MobXRegisterEmailFirebase.textError');
    try {
      return super.textError(textError);
    } finally {
      _$_MobXRegisterEmailFirebaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
