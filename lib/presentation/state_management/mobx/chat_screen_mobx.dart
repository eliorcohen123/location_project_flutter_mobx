import 'package:mobx/mobx.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart' as rec;

part 'chat_screen_mobx.g.dart';

class ChatScreenMobXStore = _ChatScreenMobXStoreMobX with _$ChatScreenMobXStore;

abstract class _ChatScreenMobXStoreMobX with Store {
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

  @action
  void isRecording(rec.Recording current) {
    _current = current;
  }

  @action
  void isRecordingStatus(rec.RecordingStatus currentStatus) {
    _currentStatus = currentStatus;
  }
}
