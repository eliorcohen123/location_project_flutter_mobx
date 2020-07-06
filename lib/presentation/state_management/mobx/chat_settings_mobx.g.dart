// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatSettingsMobXStore on _ChatSettingsMobXStoreMobX, Store {
  final _$_loadingAtom = Atom(name: '_ChatSettingsMobXStoreMobX._loading');

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

  final _$_nicknameAtom = Atom(name: '_ChatSettingsMobXStoreMobX._nickname');

  @override
  String get _nickname {
    _$_nicknameAtom.reportRead();
    return super._nickname;
  }

  @override
  set _nickname(String value) {
    _$_nicknameAtom.reportWrite(value, super._nickname, () {
      super._nickname = value;
    });
  }

  final _$_aboutMeAtom = Atom(name: '_ChatSettingsMobXStoreMobX._aboutMe');

  @override
  String get _aboutMe {
    _$_aboutMeAtom.reportRead();
    return super._aboutMe;
  }

  @override
  set _aboutMe(String value) {
    _$_aboutMeAtom.reportWrite(value, super._aboutMe, () {
      super._aboutMe = value;
    });
  }

  final _$_photoUrlAtom = Atom(name: '_ChatSettingsMobXStoreMobX._photoUrl');

  @override
  String get _photoUrl {
    _$_photoUrlAtom.reportRead();
    return super._photoUrl;
  }

  @override
  set _photoUrl(String value) {
    _$_photoUrlAtom.reportWrite(value, super._photoUrl, () {
      super._photoUrl = value;
    });
  }

  final _$_avatarImageFileAtom =
      Atom(name: '_ChatSettingsMobXStoreMobX._avatarImageFile');

  @override
  File get _avatarImageFile {
    _$_avatarImageFileAtom.reportRead();
    return super._avatarImageFile;
  }

  @override
  set _avatarImageFile(File value) {
    _$_avatarImageFileAtom.reportWrite(value, super._avatarImageFile, () {
      super._avatarImageFile = value;
    });
  }

  final _$_ChatSettingsMobXStoreMobXActionController =
      ActionController(name: '_ChatSettingsMobXStoreMobX');

  @override
  void loading(bool loading) {
    final _$actionInfo = _$_ChatSettingsMobXStoreMobXActionController
        .startAction(name: '_ChatSettingsMobXStoreMobX.loading');
    try {
      return super.loading(loading);
    } finally {
      _$_ChatSettingsMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void aboutMe(String aboutMe) {
    final _$actionInfo = _$_ChatSettingsMobXStoreMobXActionController
        .startAction(name: '_ChatSettingsMobXStoreMobX.aboutMe');
    try {
      return super.aboutMe(aboutMe);
    } finally {
      _$_ChatSettingsMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nickname(String nickname) {
    final _$actionInfo = _$_ChatSettingsMobXStoreMobXActionController
        .startAction(name: '_ChatSettingsMobXStoreMobX.nickname');
    try {
      return super.nickname(nickname);
    } finally {
      _$_ChatSettingsMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void photoUrl(String photoUrl) {
    final _$actionInfo = _$_ChatSettingsMobXStoreMobXActionController
        .startAction(name: '_ChatSettingsMobXStoreMobX.photoUrl');
    try {
      return super.photoUrl(photoUrl);
    } finally {
      _$_ChatSettingsMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  void avatarImageFile(File avatarImageFile) {
    final _$actionInfo = _$_ChatSettingsMobXStoreMobXActionController
        .startAction(name: '_ChatSettingsMobXStoreMobX.avatarImageFile');
    try {
      return super.avatarImageFile(avatarImageFile);
    } finally {
      _$_ChatSettingsMobXStoreMobXActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
