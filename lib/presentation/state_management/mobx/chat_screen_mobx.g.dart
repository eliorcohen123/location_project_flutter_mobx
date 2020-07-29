// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_screen_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatScreenMobXStore on _ChatScreenMobXStoreMobX, Store {
  final _$_isLoadingAtom = Atom(name: '_ChatScreenMobXStoreMobX._isLoading');

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

  final _$_isShowStickerAtom =
      Atom(name: '_ChatScreenMobXStoreMobX._isShowSticker');

  @override
  bool get _isShowSticker {
    _$_isShowStickerAtom.reportRead();
    return super._isShowSticker;
  }

  @override
  set _isShowSticker(bool value) {
    _$_isShowStickerAtom.reportWrite(value, super._isShowSticker, () {
      super._isShowSticker = value;
    });
  }

  final _$_currentAtom = Atom(name: '_ChatScreenMobXStoreMobX._current');

  @override
  rec.Recording get _current {
    _$_currentAtom.reportRead();
    return super._current;
  }

  @override
  set _current(rec.Recording value) {
    _$_currentAtom.reportWrite(value, super._current, () {
      super._current = value;
    });
  }

  final _$_currentStatusAtom =
      Atom(name: '_ChatScreenMobXStoreMobX._currentStatus');

  @override
  rec.RecordingStatus get _currentStatus {
    _$_currentStatusAtom.reportRead();
    return super._currentStatus;
  }

  @override
  set _currentStatus(rec.RecordingStatus value) {
    _$_currentStatusAtom.reportWrite(value, super._currentStatus, () {
      super._currentStatus = value;
    });
  }

  final _$_ChatScreenMobXStoreMobXActionController =
      ActionController(name: '_ChatScreenMobXStoreMobX');

  @override
  void isLoading(bool isLoading) {
    final _$actionInfo = _$_ChatScreenMobXStoreMobXActionController.startAction(
        name: '_ChatScreenMobXStoreMobX.isLoading');
    try {
      return super.isLoading(isLoading);
    } finally {
      _$_ChatScreenMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isShowSticker(bool isShowSticker) {
    final _$actionInfo = _$_ChatScreenMobXStoreMobXActionController.startAction(
        name: '_ChatScreenMobXStoreMobX.isShowSticker');
    try {
      return super.isShowSticker(isShowSticker);
    } finally {
      _$_ChatScreenMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isRecording(rec.Recording current) {
    final _$actionInfo = _$_ChatScreenMobXStoreMobXActionController.startAction(
        name: '_ChatScreenMobXStoreMobX.isRecording');
    try {
      return super.isRecording(current);
    } finally {
      _$_ChatScreenMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isRecordingStatus(rec.RecordingStatus currentStatus) {
    final _$actionInfo = _$_ChatScreenMobXStoreMobXActionController.startAction(
        name: '_ChatScreenMobXStoreMobX.isRecordingStatus');
    try {
      return super.isRecordingStatus(currentStatus);
    } finally {
      _$_ChatScreenMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
