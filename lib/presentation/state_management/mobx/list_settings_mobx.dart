import 'package:mobx/mobx.dart';

part 'list_settings_mobx.g.dart';

class ListSettingsMobXStore = _ListSettingsMobXStoreMobX
    with _$ListSettingsMobXStore;

abstract class _ListSettingsMobXStoreMobX with Store {
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
