// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_video_call.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXVideoCallStore on _MobXVideoCall, Store {
  final _$_usersAtom = Atom(name: '_MobXVideoCall._users');

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

  final _$_infoStringsAtom = Atom(name: '_MobXVideoCall._infoStrings');

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

  final _$_isMutedAtom = Atom(name: '_MobXVideoCall._isMuted');

  @override
  bool get _isMuted {
    _$_isMutedAtom.reportRead();
    return super._isMuted;
  }

  @override
  set _isMuted(bool value) {
    _$_isMutedAtom.reportWrite(value, super._isMuted, () {
      super._isMuted = value;
    });
  }

  final _$_MobXVideoCallActionController =
      ActionController(name: '_MobXVideoCall');

  @override
  void usersAdd(int users) {
    final _$actionInfo = _$_MobXVideoCallActionController.startAction(
        name: '_MobXVideoCall.usersAdd');
    try {
      return super.usersAdd(users);
    } finally {
      _$_MobXVideoCallActionController.endAction(_$actionInfo);
    }
  }

  @override
  void usersRemove(int users) {
    final _$actionInfo = _$_MobXVideoCallActionController.startAction(
        name: '_MobXVideoCall.usersRemove');
    try {
      return super.usersRemove(users);
    } finally {
      _$_MobXVideoCallActionController.endAction(_$actionInfo);
    }
  }

  @override
  void usersClear() {
    final _$actionInfo = _$_MobXVideoCallActionController.startAction(
        name: '_MobXVideoCall.usersClear');
    try {
      return super.usersClear();
    } finally {
      _$_MobXVideoCallActionController.endAction(_$actionInfo);
    }
  }

  @override
  void infoStringsAdd(String infoStrings) {
    final _$actionInfo = _$_MobXVideoCallActionController.startAction(
        name: '_MobXVideoCall.infoStringsAdd');
    try {
      return super.infoStringsAdd(infoStrings);
    } finally {
      _$_MobXVideoCallActionController.endAction(_$actionInfo);
    }
  }

  @override
  void infoStringsClear() {
    final _$actionInfo = _$_MobXVideoCallActionController.startAction(
        name: '_MobXVideoCall.infoStringsClear');
    try {
      return super.infoStringsClear();
    } finally {
      _$_MobXVideoCallActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isMuted(bool isMuted) {
    final _$actionInfo = _$_MobXVideoCallActionController.startAction(
        name: '_MobXVideoCall.isMuted');
    try {
      return super.isMuted(isMuted);
    } finally {
      _$_MobXVideoCallActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
