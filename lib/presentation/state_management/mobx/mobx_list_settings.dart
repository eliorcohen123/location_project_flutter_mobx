import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mobx_list_settings.g.dart';

class MobXListSettingsStore = _MobXListSettings with _$MobXListSettingsStore;

abstract class _MobXListSettings with Store {
  @observable
  SharedPreferences _sharedPrefs;
  @observable
  String _valueOpen;
  @observable
  double _valueRadius, _valueGeofence;

  SharedPreferences get sharedGet => _sharedPrefs;

  String get valueOpenGet => _valueOpen;

  double get valueRadiusGet => _valueRadius;

  double get valueGeofenceGet => _valueGeofence;

  @action
  void sharedPref(SharedPreferences sharedPrefs) {
    _sharedPrefs = sharedPrefs;
  }

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

  void initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        sharedPref(prefs);

        valueOpen(sharedGet.getString('open') ?? '');

        valueOpenGet == '&opennow=true'
            ? valueOpen('Open')
            : valueOpenGet == ''
                ? valueOpen('All(Open + Close)')
                : valueOpen('All(Open + Close)');

        valueRadius(sharedGet.getDouble('rangeRadius') ?? 5000.0);

        valueGeofence(sharedGet.getDouble('rangeGeofence') ?? 500.0);
      },
    );
  }

  void addOpenToSF(String value) async {
    if (value == 'Open') {
      sharedGet.setString('open', '&opennow=true');
    } else if (value == 'All(Open + Close)') {
      sharedGet.setString('open', '');
    }
  }

  void addRadiusSearchToSF(double value) async {
    sharedGet.setDouble('rangeRadius', value);
  }

  void addGeofenceToSF(double value) async {
    sharedGet.setDouble('rangeGeofence', value);
  }
}
