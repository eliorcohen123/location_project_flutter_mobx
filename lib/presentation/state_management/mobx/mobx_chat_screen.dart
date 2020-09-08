import 'package:mobx/mobx.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart' as rec;

part 'mobx_chat_screen.g.dart';

class MobXChatScreenStore = _MobXChatScreen with _$MobXChatScreenStore;

abstract class _MobXChatScreen with Store {
  @observable
  bool _isLoading = false, _isShowSticker = false;
  @observable
  rec.Recording _current;
  @observable
  rec.RecordingStatus _currentStatus = rec.RecordingStatus.Initialized;

  bool get isLoadingGet => _isLoading;

  bool get isShowStickerGet => _isShowSticker;

  rec.Recording get isCurrentGet => _current;

  rec.RecordingStatus get isCurrentStatusGet => _currentStatus;

  @action
  void isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  @action
  void isShowSticker(bool isShowSticker) {
    _isShowSticker = isShowSticker;
  }

  void recording(rec.Recording current) {
    _current = current;
  }

  void recordingStatus(rec.RecordingStatus currentStatus) {
    _currentStatus = currentStatus;
  }
}
