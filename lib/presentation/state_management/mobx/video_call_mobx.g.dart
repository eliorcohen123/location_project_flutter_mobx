// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoCallMobXStore on _VideoCallMobXStoreMobX, Store {
  final _$_usersAtom = Atom(name: '_VideoCallMobXStoreMobX._users');

  @override
  List<int> get _users {
    _$_usersAtom.reportRead();
    return super._users;
  }

  @override
  set _users(List<int> value) {
    _$_usersAtom.reportWrite(value, super._users, () {
      super._users = value;
    });
  }

  final _$_infoStringsAtom = Atom(name: '_VideoCallMobXStoreMobX._infoStrings');

  @override
  List<String> get _infoStrings {
    _$_infoStringsAtom.reportRead();
    return super._infoStrings;
  }

  @override
  set _infoStrings(List<String> value) {
    _$_infoStringsAtom.reportWrite(value, super._infoStrings, () {
      super._infoStrings = value;
    });
  }

  final _$_mutedAtom = Atom(name: '_VideoCallMobXStoreMobX._muted');

  @override
  bool get _muted {
    _$_mutedAtom.reportRead();
    return super._muted;
  }

  @override
  set _muted(bool value) {
    _$_mutedAtom.reportWrite(value, super._muted, () {
      super._muted = value;
    });
  }

  final _$_VideoCallMobXStoreMobXActionController =
      ActionController(name: '_VideoCallMobXStoreMobX');

  @override
  void isUsersAdd(int users) {
    final _$actionInfo = _$_VideoCallMobXStoreMobXActionController.startAction(
        name: '_VideoCallMobXStoreMobX.isUsersAdd');
    try {
      return super.isUsersAdd(users);
    } finally {
      _$_VideoCallMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isUsersRemove(int users) {
    final _$actionInfo = _$_VideoCallMobXStoreMobXActionController.startAction(
        name: '_VideoCallMobXStoreMobX.isUsersRemove');
    try {
      return super.isUsersRemove(users);
    } finally {
      _$_VideoCallMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isUsersClear() {
    final _$actionInfo = _$_VideoCallMobXStoreMobXActionController.startAction(
        name: '_VideoCallMobXStoreMobX.isUsersClear');
    try {
      return super.isUsersClear();
    } finally {
      _$_VideoCallMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isInfoStringsAdd(String infoStrings) {
    final _$actionInfo = _$_VideoCallMobXStoreMobXActionController.startAction(
        name: '_VideoCallMobXStoreMobX.isInfoStringsAdd');
    try {
      return super.isInfoStringsAdd(infoStrings);
    } finally {
      _$_VideoCallMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isInfoStringsClear() {
    final _$actionInfo = _$_VideoCallMobXStoreMobXActionController.startAction(
        name: '_VideoCallMobXStoreMobX.isInfoStringsClear');
    try {
      return super.isInfoStringsClear();
    } finally {
      _$_VideoCallMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isMuted(bool muted) {
    final _$actionInfo = _$_VideoCallMobXStoreMobXActionController.startAction(
        name: '_VideoCallMobXStoreMobX.isMuted');
    try {
      return super.isMuted(muted);
    } finally {
      _$_VideoCallMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
