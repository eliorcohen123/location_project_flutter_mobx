import 'package:locationprojectflutter/data/models/model_live_chat/results_live_chat.dart';
import 'package:mobx/mobx.dart';

part 'live_chat_mobx.g.dart';

class LiveChatMobXStore = _LiveChatMobXStoreMobX with _$LiveChatMobXStore;

abstract class _LiveChatMobXStoreMobX with Store {
  @observable
  List<ResultsLiveChat> _places = List();

  List<ResultsLiveChat> get placesGet => _places;

  @action
  void places(List<ResultsLiveChat> places) {
    _places = places;
  }
}
