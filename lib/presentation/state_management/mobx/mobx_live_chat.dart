import 'package:locationprojectflutter/data/models/model_live_chat/results_live_chat.dart';
import 'package:mobx/mobx.dart';

part 'mobx_live_chat.g.dart';

class MobXLiveChatStore = _MobXLiveChat with _$MobXLiveChatStore;

abstract class _MobXLiveChat with Store {
  @observable
  List<ResultsLiveChat> _places = [];

  List<ResultsLiveChat> get placesGet => _places;

  @action
  void places(List<ResultsLiveChat> places) {
    _places = places;
  }
}
