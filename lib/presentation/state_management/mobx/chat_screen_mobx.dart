import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chat_screen_mobx.g.dart';

class ChatScreenMobXStore = _ChatScreenMobXStoreMobX with _$ChatScreenMobXStore;

abstract class _ChatScreenMobXStoreMobX with Store {
  @observable
  bool _isLoading = false, _isShowSticker = false;

  bool get isLoadingGet => _isLoading;

  bool get isShowStickerGet => _isShowSticker;

  @action
  void isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  @action
  void isShowSticker(bool isShowSticker) {
    _isShowSticker = isShowSticker;
  }
}
