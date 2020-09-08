import 'dart:io';
import 'package:mobx/mobx.dart';

part 'mobx_chat_settings.g.dart';

class MobXChatSettingsStore = _MobXChatSettings with _$MobXChatSettingsStore;

abstract class _MobXChatSettings with Store {
  @observable
  bool _isLoading = false;
  @observable
  String _nickname = '', _aboutMe = '', _photoUrl = '';
  @observable
  File _avatarImageFile;

  bool get isLoadingGet => _isLoading;

  String get nicknameGet => _nickname;

  String get aboutMeGet => _aboutMe;

  String get photoUrlGet => _photoUrl;

  File get avatarImageFileGet => _avatarImageFile;

  @action
  void isLoading(bool isLoading) {
    _isLoading = isLoading;
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
