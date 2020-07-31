import 'package:mobx/mobx.dart';

part 'video_call_mobx.g.dart';

class VideoCallMobXStore = _VideoCallMobXStoreMobX with _$VideoCallMobXStore;

abstract class _VideoCallMobXStoreMobX with Store {
  @observable
  List<int> _users = <int>[];
  @observable
  List<String> _infoStrings = <String>[];
  @observable
  bool _muted = false;

  List<int> get isUsersGet => _users;

  List<String> get isInfoStringsGet => _infoStrings;

  bool get isMutedGet => _muted;

  @action
  void isUsersAdd(int users) {
    _users.add(users);
  }

  @action
  void isUsersRemove(int users) {
    _users.remove(users);
  }

  @action
  void isUsersClear() {
    _users.clear();
  }

  @action
  void isInfoStringsAdd(String infoStrings) {
    _infoStrings.add(infoStrings);
  }

  @action
  void isInfoStringsClear() {
    _infoStrings.clear();
  }

  @action
  void isMuted(bool muted) {
    _muted = muted;
  }
}
