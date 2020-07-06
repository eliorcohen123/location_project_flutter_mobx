// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_email_firebase_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterEmailFirebaseMobXStore
    on _RegisterEmailFirebaseMobXStoreMobX, Store {
  final _$_successAtom =
      Atom(name: '_RegisterEmailFirebaseMobXStoreMobX._success');

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

  final _$_loadingAtom =
      Atom(name: '_RegisterEmailFirebaseMobXStoreMobX._loading');

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

  final _$_textErrorAtom =
      Atom(name: '_RegisterEmailFirebaseMobXStoreMobX._textError');

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

  final _$_RegisterEmailFirebaseMobXStoreMobXActionController =
      ActionController(name: '_RegisterEmailFirebaseMobXStoreMobX');

  @override
  void success(bool success) {
    final _$actionInfo = _$_RegisterEmailFirebaseMobXStoreMobXActionController
        .startAction(name: '_RegisterEmailFirebaseMobXStoreMobX.success');
    try {
      return super.success(success);
    } finally {
      _$_RegisterEmailFirebaseMobXStoreMobXActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void loading(bool loading) {
    final _$actionInfo = _$_RegisterEmailFirebaseMobXStoreMobXActionController
        .startAction(name: '_RegisterEmailFirebaseMobXStoreMobX.loading');
    try {
      return super.loading(loading);
    } finally {
      _$_RegisterEmailFirebaseMobXStoreMobXActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void textError(String textError) {
    final _$actionInfo = _$_RegisterEmailFirebaseMobXStoreMobXActionController
        .startAction(name: '_RegisterEmailFirebaseMobXStoreMobX.textError');
    try {
      return super.textError(textError);
    } finally {
      _$_RegisterEmailFirebaseMobXStoreMobXActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
