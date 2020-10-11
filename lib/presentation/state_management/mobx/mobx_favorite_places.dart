import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:locationprojectflutter/core/constants/constants_urls_keys.dart';
import 'package:locationprojectflutter/data/data_resources/locals/sqflite_helper.dart';
import 'package:locationprojectflutter/data/models/model_sqfl/results_sqfl.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
import 'package:locationprojectflutter/presentation/widgets/widget_add_edit_favorite_places.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

part 'mobx_favorite_places.g.dart';

class MobXFavoritePlacesStore = _MobXFavoritePlaces
    with _$MobXFavoritePlacesStore;

abstract class _MobXFavoritePlaces with Store {
  final String _API_KEY = ConstantsUrlsKeys.API_KEY_GOOGLE_MAPS;
  SQFLiteHelper _db = SQFLiteHelper();
  @observable
  ObservableList<ResultsSqfl> _resultsSqfl = ObservableList.of([]);
  @observable
  bool _isCheckingBottomSheet = false;
  UserLocation _userLocation;

  String get API_KEYGet => _API_KEY;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  ObservableList<ResultsSqfl> get resultsSqflGet => _resultsSqfl;

  UserLocation get userLocationGet => _userLocation;

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }

  @action
  void deleteItem(ResultsSqfl result, int index) {
    _db.deleteResult(result.id).then(
      (_) {
        _resultsSqfl.removeAt(index);
      },
    );
  }

  @action
  void deleteData() {
    _db.deleteData().then(
      (_) {
        _resultsSqfl.clear();
      },
    );
  }

  @action
  void getItems() {
    _db.getAllResults().then(
      (results) {
        _resultsSqfl.clear();
        results.forEach(
          (result) {
            _resultsSqfl.add(
              ResultsSqfl.fromSqfl(result),
            );
          },
        );
      },
    );
  }

  void userLocation(BuildContext context) {
    _userLocation = Provider.of<UserLocation>(context);
  }

  void newTaskModalBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            isCheckingBottomSheet(false);

            Navigator.pop(context, false);

            return Future.value(false);
          },
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                child: ListView(
                  children: [
                    WidgetAddEditFavoritePlaces(
                      id: resultsSqflGet[index].id,
                      nameList: resultsSqflGet[index].name,
                      addressList: resultsSqflGet[index].vicinity,
                      latList: resultsSqflGet[index].lat,
                      lngList: resultsSqflGet[index].lng,
                      photoList: resultsSqflGet[index].photo.isNotEmpty
                          ? resultsSqflGet[index].photo
                          : "",
                      edit: true,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  String calculateDistance(double _meter) {
    String _myMeters;
    if (_meter < 1000.0) {
      _myMeters = 'Meters: ' + (_meter.round()).toString();
    } else {
      _myMeters =
          'KM: ' + (_meter.round() / 1000.0).toStringAsFixed(2).toString();
    }
    return _myMeters;
  }

  void shareContent(String name, String vicinity, double lat, double lng,
      String photo, BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(
        'Name: $name' +
            '\n' +
            'Vicinity: $vicinity' +
            '\n' +
            'Latitude: $lat' +
            '\n' +
            'Longitude: $lng' +
            '\n' +
            'Photo: $photo',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
