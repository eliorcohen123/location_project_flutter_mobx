import 'package:mobx/mobx.dart';

part 'mobx_video_call.g.dart';

class MobXVideoCallStore = _MobXVideoCall with _$MobXVideoCallStore;

abstract class _MobXVideoCall with Store {
  @observable
  List<int> _users = [];
  @observable
  List<String> _infoStrings = [];
  @observable
  bool _muted = false;

  List<int> get isUsersGet => _users;

  List<String> get isInfoStringsGet => _infoStrings;

  bool get isMutedGet => _muted;

  @action
  void usersAdd(int users) {
    _users.add(users);
  }

  @action
  void usersRemove(int users) {
    _users.remove(users);
  }

  @action
  void usersClear() {
    _users.clear();
  }

  @action
  void infoStringsAdd(String infoStrings) {
    _infoStrings.add(infoStrings);
  }

  @action
  void infoStringsClear() {
    _infoStrings.clear();
  }

  @action
  void isMuted(bool muted) {
    _muted = muted;
  }
}
