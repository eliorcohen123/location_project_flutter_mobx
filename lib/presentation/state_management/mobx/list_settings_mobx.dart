import 'package:mobx/mobx.dart';

part 'list_settings_mobx.g.dart';

class ListSettingsMobXStore = _ListSettingsMobXStoreMobX
    with _$ListSettingsMobXStore;

abstract class _ListSettingsMobXStoreMobX with Store {
  @observable
  double _valueRadius, _valueGeofence;

  double get valueRadiusGet => _valueRadius;

  double get valueGeofenceGet => _valueGeofence;

  @action
  void valueGeofence(double valueGeofence) {
    _valueGeofence = valueGeofence;
  }

  @action
  void valueRadius(double valueRadius) {
    _valueRadius = valueRadius;
  }
}
