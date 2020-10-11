// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_phone_sms_auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXPhoneSMSAuthStore on _MobXPhoneSMSAuth, Store {
  final _$_isSuccessAtom = Atom(name: '_MobXPhoneSMSAuth._isSuccess');

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

  final _$_isLoadingAtom = Atom(name: '_MobXPhoneSMSAuth._isLoading');

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

  final _$_textErrorAtom = Atom(name: '_MobXPhoneSMSAuth._textError');

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

  final _$_textOkAtom = Atom(name: '_MobXPhoneSMSAuth._textOk');

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

  final _$_verificationIdAtom = Atom(name: '_MobXPhoneSMSAuth._verificationId');

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

  final _$_sharedPrefsAtom = Atom(name: '_MobXPhoneSMSAuth._sharedPrefs');

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

  final _$_MobXPhoneSMSAuthActionController =
      ActionController(name: '_MobXPhoneSMSAuth');

  @override
  void sharedPref(SharedPreferences sharedPrefs) {
    final _$actionInfo = _$_MobXPhoneSMSAuthActionController.startAction(
        name: '_MobXPhoneSMSAuth.sharedPref');
    try {
      return super.sharedPref(sharedPrefs);
    } finally {
      _$_MobXPhoneSMSAuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isSuccess(bool isSuccess) {
    final _$actionInfo = _$_MobXPhoneSMSAuthActionController.startAction(
        name: '_MobXPhoneSMSAuth.isSuccess');
    try {
      return super.isSuccess(isSuccess);
    } finally {
      _$_MobXPhoneSMSAuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoading(bool isLoading) {
    final _$actionInfo = _$_MobXPhoneSMSAuthActionController.startAction(
        name: '_MobXPhoneSMSAuth.isLoading');
    try {
      return super.isLoading(isLoading);
    } finally {
      _$_MobXPhoneSMSAuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textError(String textError) {
    final _$actionInfo = _$_MobXPhoneSMSAuthActionController.startAction(
        name: '_MobXPhoneSMSAuth.textError');
    try {
      return super.textError(textError);
    } finally {
      _$_MobXPhoneSMSAuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  void textOk(String textOk) {
    final _$actionInfo = _$_MobXPhoneSMSAuthActionController.startAction(
        name: '_MobXPhoneSMSAuth.textOk');
    try {
      return super.textOk(textOk);
    } finally {
      _$_MobXPhoneSMSAuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sVerificationId(String verificationId) {
    final _$actionInfo = _$_MobXPhoneSMSAuthActionController.startAction(
        name: '_MobXPhoneSMSAuth.sVerificationId');
    try {
      return super.sVerificationId(verificationId);
    } finally {
      _$_MobXPhoneSMSAuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
