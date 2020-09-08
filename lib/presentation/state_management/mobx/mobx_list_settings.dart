import 'package:mobx/mobx.dart';

part 'mobx_list_settings.g.dart';

class MobXListSettingsStore = _MobXListSettings with _$MobXListSettingsStore;

abstract class _MobXListSettings with Store {
  @observable
  String _valueOpen;
  @observable
  double _valueRadius, _valueGeofence;

  String get valueOpenGet => _valueOpen;

  double get valueRadiusGet => _valueRadius;

  double get valueGeofenceGet => _valueGeofence;

  @action
  void valueOpen(String valueOpen) {
    _valueOpen = valueOpen;
  }

  @action
  void valueRadius(double valueRadius) {
    _valueRadius = valueRadius;
  }

  @action
  void valueGeofence(double valueGeofence) {
    _valueGeofence = valueGeofence;
  }
}
