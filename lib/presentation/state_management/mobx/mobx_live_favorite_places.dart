import 'package:mobx/mobx.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:locationprojectflutter/core/constants/constants_urls_keys.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
import 'package:locationprojectflutter/presentation/widgets/widget_add_edit_favorite_places.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

part 'mobx_live_favorite_places.g.dart';

class MobXLiveFavoritePlacesStore = _MobXLiveFavoritePlaces
    with _$MobXLiveFavoritePlacesStore;

abstract class _MobXLiveFavoritePlaces with Store {
  final String _API_KEY = ConstantsUrlsKeys.API_KEY_GOOGLE_MAPS;
  @observable
  bool _isCheckingBottomSheet = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _listMessage;
  UserLocation _userLocation;

  String get API_KEYGet => _API_KEY;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  FirebaseFirestore get firestoreGet => _firestore;

  List<DocumentSnapshot> get listMessageGet => _listMessage;

  UserLocation get userLocationGet => _userLocation;

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }

  void listMessage(List<DocumentSnapshot> listMessage) {
    _listMessage = listMessage;
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
                      nameList: listMessageGet[index]['name'],
                      addressList: listMessageGet[index]['vicinity'],
                      latList: listMessageGet[index]['lat'],
                      lngList: listMessageGet[index]['lng'],
                      photoList: listMessageGet[index]['photo'].isNotEmpty
                          ? listMessageGet[index]['photo']
                          : "",
                      edit: false,
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
