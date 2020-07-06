import 'dart:io';

import 'package:mobx/mobx.dart';

part 'chat_settings_mobx.g.dart';

class ChatSettingsMobXStore = _ChatSettingsMobXStoreMobX
    with _$ChatSettingsMobXStore;

abstract class _ChatSettingsMobXStoreMobX with Store {
  @observable
  bool _loading = false;
  @observable
  String _nickname = '', _aboutMe = '', _photoUrl = '';
  @observable
  File _avatarImageFile;

  bool get loadingGet => _loading;

  String get nicknameGet => _nickname;

  String get aboutMeGet => _aboutMe;

  String get photoUrlGet => _photoUrl;

  File get avatarImageFileGet => _avatarImageFile;

  @action
  void loading(bool loading) {
    _loading = loading;
  }

  @action
  void aboutMe(String aboutMe) {
    _aboutMe = aboutMe;
  }

  @action
  void nickname(String nickname) {
    _nickname = nickname;
  }

  @action
  void photoUrl(String photoUrl) {
    _photoUrl = photoUrl;
  }

  @action
  void avatarImageFile(File avatarImageFile) {
    _avatarImageFile = avatarImageFile;
  }
}
