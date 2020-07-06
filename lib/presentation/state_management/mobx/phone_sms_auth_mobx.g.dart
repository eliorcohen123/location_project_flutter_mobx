// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_sms_auth_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhoneSMSAuthMobXStore on _PhoneSMSAuthMobXStoreMobX, Store {
  final _$_successAtom = Atom(name: '_PhoneSMSAuthMobXStoreMobX._success');

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

  final _$_loadingAtom = Atom(name: '_PhoneSMSAuthMobXStoreMobX._loading');

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

  final _$_textErrorAtom = Atom(name: '_PhoneSMSAuthMobXStoreMobX._textError');

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

  final _$_textOkAtom = Atom(name: '_PhoneSMSAuthMobXStoreMobX._textOk');

  @override
  String get _textOk {
    _$_textOkAtom.reportRead();
    return super._textOk;
  }

  @override
  set _textOk(String value) {
    _$_textOkAtom.reportWrite(value, super._textOk, () {
      super._textOk = value;
    });
  }

  final _$_verificationIdAtom =
      Atom(name: '_PhoneSMSAuthMobXStoreMobX._verificationId');

  @override
  String get _verificationId {
    _$_verificationIdAtom.reportRead();
    return super._verificationId;
  }

  @override
  set _verificationId(String value) {
    _$_verificationIdAtom.reportWrite(value, super._verificationId, () {
      super._verificationId = value;
    });
  }

  final _$_PhoneSMSAuthMobXStoreMobXActionController =
      ActionController(name: '_PhoneSMSAuthMobXStoreMobX');

  @override
  void success(bool success) {
    final _$actionInfo = _$_PhoneSMSAuthMobXStoreMobXActionController
        .startAction(name: '_PhoneSMSAuthMobXStoreMobX.success');
    try {
      return super.success(success);
    } finally {
      _$_PhoneSMSAuthMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loading(bool loading) {
    final _$actionInfo = _$_PhoneSMSAuthMobXStoreMobXActionController
        .startAction(name: '_PhoneSMSAuthMobXStoreMobX.loading');
    try {
      return super.loading(loading);
    } finally {
      _$_PhoneSMSAuthMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textError(String textError) {
    final _$actionInfo = _$_PhoneSMSAuthMobXStoreMobXActionController
        .startAction(name: '_PhoneSMSAuthMobXStoreMobX.textError');
    try {
      return super.textError(textError);
    } finally {
      _$_PhoneSMSAuthMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textOk(String textOk) {
    final _$actionInfo = _$_PhoneSMSAuthMobXStoreMobXActionController
        .startAction(name: '_PhoneSMSAuthMobXStoreMobX.textOk');
    try {
      return super.textOk(textOk);
    } finally {
      _$_PhoneSMSAuthMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verificationId(String verificationId) {
    final _$actionInfo = _$_PhoneSMSAuthMobXStoreMobXActionController
        .startAction(name: '_PhoneSMSAuthMobXStoreMobX.verificationId');
    try {
      return super.verificationId(verificationId);
    } finally {
      _$_PhoneSMSAuthMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
