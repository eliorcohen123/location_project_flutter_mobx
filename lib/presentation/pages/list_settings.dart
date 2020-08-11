import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/list_settings_mobx.dart';
import 'package:locationprojectflutter/presentation/utils/responsive_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list_map.dart';

class ListSettings extends StatefulWidget {
  const ListSettings({Key key}) : super(key: key);

  @override
  _ListSettingsState createState() => _ListSettingsState();
}

class _ListSettingsState extends State<ListSettings> {
  SharedPreferences _sharedPrefs;
  ListSettingsMobXStore _mobX = ListSettingsMobXStore();

  @override
  void initState() {
    super.initState();

    _initGetSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: _appBar(),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _openPlaces(),
                  SizedBox(
                    height: ResponsiveScreen().heightMediaQuery(context, 20),
                  ),
                  _radiusSearch(),
                  _radiusGeofence(),
                  SizedBox(
                    height: ResponsiveScreen().heightMediaQuery(context, 100),
                  ),
                  _buttonSave()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          color: Color(0xFFE9FFFF),
          size: 40,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _openPlaces() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Open Places",
              style: TextStyle(color: Colors.greenAccent),
            ),
            SizedBox(
              width: ResponsiveScreen().widthMediaQuery(context, 5),
            ),
            Icon(
              Icons.open_with,
              color: Colors.greenAccent,
              size: ResponsiveScreen().heightMediaQuery(context, 40),
            ),
          ],
        ),
        RadioButtonGroup(
          labels: [
            'Open',
            'All(Open + Close)',
          ],
          picked: _mobX.valueOpenGet,
          labelStyle: TextStyle(color: Colors.indigo),
          activeColor: Colors.greenAccent,
          onSelected: (String label) => {
            _mobX.valueOpen(label),
          },
        ),
      ],
    );
  }

  Widget _radiusSearch() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Radius Search",
              style: TextStyle(color: Colors.greenAccent),
            ),
            SizedBox(
              width: ResponsiveScreen().widthMediaQuery(context, 5),
            ),
            Icon(
              Icons.my_location,
              color: Colors.greenAccent,
              size: ResponsiveScreen().heightMediaQuery(context, 40),
            ),
          ],
        ),
        Slider(
          value: _mobX.valueRadiusGet,
          min: 0.0,
          max: 50000.0,
          divisions: 50000,
          activeColor: Colors.indigo,
          inactiveColor: Colors.grey,
          label: _mobX.valueRadiusGet.round().toString(),
          onChanged: (double newValue) {
            _mobX.valueRadius(newValue);
          },
          semanticFormatterCallback: (double newValue) {
            return '${newValue.round()}';
          },
        ),
      ],
    );
  }

  Widget _radiusGeofence() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Radius Geofence",
              style: TextStyle(color: Colors.greenAccent),
            ),
            SizedBox(
              width: ResponsiveScreen().widthMediaQuery(context, 5),
            ),
            Icon(
              Icons.location_searching,
              color: Colors.greenAccent,
              size: ResponsiveScreen().heightMediaQuery(context, 40),
            ),
          ],
        ),
        Slider(
          value: _mobX.valueGeofenceGet,
          min: 500.0,
          max: 1000.0,
          divisions: 500,
          activeColor: Colors.indigo,
          inactiveColor: Colors.grey,
          label: _mobX.valueGeofenceGet.round().toString(),
          onChanged: (double newValue) {
            _mobX.valueGeofence(newValue);
          },
          semanticFormatterCallback: (double newValue) {
            return '${newValue.round()}';
          },
        ),
      ],
    );
  }

  Widget _buttonSave() {
    return RaisedButton(
      child: Text('Save'),
      color: Colors.greenAccent,
      onPressed: () => {
        _addOpenToSF(_mobX.valueOpenGet),
        _addRadiusSearchToSF(_mobX.valueRadiusGet),
        _addGeofenceToSF(_mobX.valueGeofenceGet),
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListMap(),
          ),
        ),
      },
    );
  }

  void _initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          _sharedPrefs = prefs;
        });

        _mobX.valueOpen(_sharedPrefs.getString('open') ?? '');

        _mobX.valueOpenGet == '&opennow=true'
            ? _mobX.valueOpen('Open')
            : _mobX.valueOpenGet == ''
                ? _mobX.valueOpen('All(Open + Close)')
                : _mobX.valueOpen('All(Open + Close)');

        _mobX.valueRadius(_sharedPrefs.getDouble('rangeRadius') ?? 5000.0);

        _mobX
            .valueGeofence(_sharedPrefs.getDouble('rangeGeofence') ?? 500.0);
      },
    );
  }

  void _addOpenToSF(String value) async {
    if (value == 'Open') {
      _sharedPrefs.setString('open', '&opennow=true');
    } else if (value == 'All(Open + Close)') {
      _sharedPrefs.setString('open', '');
    }
  }

  void _addRadiusSearchToSF(double value) async {
    _sharedPrefs.setDouble('rangeRadius', value);
  }

  void _addGeofenceToSF(double value) async {
    _sharedPrefs.setDouble('rangeGeofence', value);
  }
}
