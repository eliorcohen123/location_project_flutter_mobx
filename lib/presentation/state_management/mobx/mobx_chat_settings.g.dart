// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_chat_settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobXChatSettingsStore on _MobXChatSettings, Store {
  final _$_isLoadingAtom = Atom(name: '_MobXChatSettings._isLoading');

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

  final _$_nicknameAtom = Atom(name: '_MobXChatSettings._nickname');

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

  final _$_aboutMeAtom = Atom(name: '_MobXChatSettings._aboutMe');

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

  final _$_photoUrlAtom = Atom(name: '_MobXChatSettings._photoUrl');

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
      Atom(name: '_MobXChatSettings._avatarImageFile');

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

  final _$_MobXChatSettingsActionController =
      ActionController(name: '_MobXChatSettings');

  @override
  void isLoading(bool isLoading) {
    final _$actionInfo = _$_MobXChatSettingsActionController.startAction(
        name: '_MobXChatSettings.isLoading');
    try {
      return super.isLoading(isLoading);
    } finally {
      _$_MobXChatSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void aboutMe(String aboutMe) {
    final _$actionInfo = _$_MobXChatSettingsActionController.startAction(
        name: '_MobXChatSettings.aboutMe');
    try {
      return super.aboutMe(aboutMe);
    } finally {
      _$_MobXChatSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nickname(String nickname) {
    final _$actionInfo = _$_MobXChatSettingsActionController.startAction(
        name: '_MobXChatSettings.nickname');
    try {
      return super.nickname(nickname);
    } finally {
      _$_MobXChatSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void photoUrl(String photoUrl) {
    final _$actionInfo = _$_MobXChatSettingsActionController.startAction(
        name: '_MobXChatSettings.photoUrl');
    try {
      return super.photoUrl(photoUrl);
    } finally {
      _$_MobXChatSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void avatarImageFile(File avatarImageFile) {
    final _$actionInfo = _$_MobXChatSettingsActionController.startAction(
        name: '_MobXChatSettings.avatarImageFile');
    try {
      return super.avatarImageFile(avatarImageFile);
    } finally {
      _$_MobXChatSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
