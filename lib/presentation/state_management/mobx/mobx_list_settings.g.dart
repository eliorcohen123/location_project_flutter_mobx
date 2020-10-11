// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_list_settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXListSettingsStore on _MobXListSettings, Store {
  final _$_sharedPrefsAtom = Atom(name: '_MobXListSettings._sharedPrefs');

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

  final _$_valueOpenAtom = Atom(name: '_MobXListSettings._valueOpen');

  @override
  String get _valueOpen {
    _$_valueOpenAtom.reportRead();
    return super._valueOpen;
  }

  @override
  set _valueOpen(String value) {
    _$_valueOpenAtom.reportWrite(value, super._valueOpen, () {
      super._valueOpen = value;
    });
  }

  final _$_valueRadiusAtom = Atom(name: '_MobXListSettings._valueRadius');

  @override
  double get _valueRadius {
    _$_valueRadiusAtom.reportRead();
    return super._valueRadius;
  }

  @override
  set _valueRadius(double value) {
    _$_valueRadiusAtom.reportWrite(value, super._valueRadius, () {
      super._valueRadius = value;
    });
  }

  final _$_valueGeofenceAtom = Atom(name: '_MobXListSettings._valueGeofence');

  @override
  double get _valueGeofence {
    _$_valueGeofenceAtom.reportRead();
    return super._valueGeofence;
  }

  @override
  set _valueGeofence(double value) {
    _$_valueGeofenceAtom.reportWrite(value, super._valueGeofence, () {
      super._valueGeofence = value;
    });
  }

  final _$_MobXListSettingsActionController =
      ActionController(name: '_MobXListSettings');

  @override
  void sharedPref(SharedPreferences sharedPrefs) {
    final _$actionInfo = _$_MobXListSettingsActionController.startAction(
        name: '_MobXListSettings.sharedPref');
    try {
      return super.sharedPref(sharedPrefs);
    } finally {
      _$_MobXListSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void valueOpen(String valueOpen) {
    final _$actionInfo = _$_MobXListSettingsActionController.startAction(
        name: '_MobXListSettings.valueOpen');
    try {
      return super.valueOpen(valueOpen);
    } finally {
      _$_MobXListSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void valueRadius(double valueRadius) {
    final _$actionInfo = _$_MobXListSettingsActionController.startAction(
        name: '_MobXListSettings.valueRadius');
    try {
      return super.valueRadius(valueRadius);
    } finally {
      _$_MobXListSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void valueGeofence(double valueGeofence) {
    final _$actionInfo = _$_MobXListSettingsActionController.startAction(
        name: '_MobXListSettings.valueGeofence');
    try {
      return super.valueGeofence(valueGeofence);
    } finally {
      _$_MobXListSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
