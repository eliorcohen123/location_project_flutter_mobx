import 'package:mobx/mobx.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:locationprojectflutter/core/constants/constants_urls_keys.dart';
import 'package:locationprojectflutter/data/models/model_googleapis/results.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
import 'package:locationprojectflutter/data/repositories_impl/location_repo_impl.dart';
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:locationprojectflutter/presentation/widgets/widget_add_edit_favorite_places.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:locationprojectflutter/core/services/service_locator.dart';

part 'mobx_list_map.g.dart';

class MobXListMapStore = _MobXListMap with _$MobXListMapStore;

abstract class _MobXListMap with Store {
  final String _API_KEY = ConstantsUrlsKeys.API_KEY_GOOGLE_MAPS;
  final GlobalKey<FormState> _formKeySearch = GlobalKey<FormState>();
  final TextEditingController _controllerSearch = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LocationRepoImpl _locationRepoImpl = LocationRepoImpl();
  @observable
  SharedPreferences _sharedPrefs;
  @observable
  bool _isActiveSearch = false,
      _isActiveNav = false,
      _isCheckingBottomSheet = false,
      _isSearching = true,
      _isSearchingAfter = false,
      _isDisplayGrid = false;
  @observable
  int _count;
  @observable
  String _finalTagsChips;
  @observable
  List<String> _tagsChips = [];
  List<Results> _places = [];
  List<DocumentSnapshot> _listMessage;
  List<String> _optionsChips = [
    'Banks',
    'Bars',
    'Beauty',
    'Bus stations',
    'Cars',
    'Clothing',
    'Doctors',
    'Gas stations',
    'Gym',
    'Jewelries',
    'Parks',
    'Restaurants',
    'School',
    'Spa',
  ];
  double _valueRadius;
  String _open;
  UserLocation _userLocation;

//  LocationRepoImpl _locationRepoImpl;
//  _ListMapState() : _locationRepoImpl = serviceLocator();

  String get API_KEYGet => _API_KEY;

  GlobalKey<FormState> get formKeySearchGet => _formKeySearch;

  TextEditingController get controllerSearchGet => _controllerSearch;

  SharedPreferences get sharedGet => _sharedPrefs;

  bool get isActiveSearchGet => _isActiveSearch;

  bool get isActiveNavGet => _isActiveNav;

  bool get isCheckingBottomSheetGet => _isCheckingBottomSheet;

  bool get isSearchingGet => _isSearching;

  bool get isSearchingAfterGet => _isSearchingAfter;

  bool get isDisplayGridGet => _isDisplayGrid;

  int get countGet => _count;

  String get finalTagsChipsGet => _finalTagsChips;

  List<String> get tagsChipsGet => _tagsChips;

  FirebaseFirestore get firestoreGet => _firestore;

  List<DocumentSnapshot> get listMessageGet => _listMessage;

  List<String> get optionsChipsGet => _optionsChips;

  List<Results> get placesGet => _places;

  UserLocation get userLocationGet => _userLocation;

  @action
  void sharedPref(SharedPreferences sharedPrefs) {
    _sharedPrefs = sharedPrefs;
  }

  @action
  void isSearching(bool isSearching) {
    _isSearching = isSearching;
  }

  @action
  void isSearchAfter(bool isSearchAfter) {
    _isSearchingAfter = isSearchAfter;
  }

  @action
  void isCheckingBottomSheet(bool isCheckingBottomSheet) {
    _isCheckingBottomSheet = isCheckingBottomSheet;
  }

  @action
  void isActiveSearch(bool isActiveSearch) {
    _isActiveSearch = isActiveSearch;
  }

  @action
  void isActiveNav(bool isActiveNav) {
    _isActiveNav = isActiveNav;
  }

  @action
  void isDisplayGrid(bool isDisplayGrid) {
    _isDisplayGrid = isDisplayGrid;
  }

  @action
  void count(int count) {
    _count = count;
  }

  @action
  void finalTagsChips(String finalTagsChips) {
    _finalTagsChips = finalTagsChips
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(', ', '')
        .replaceAll('Banks', '|bank')
        .replaceAll('Bars', '|bar|night_club')
        .replaceAll('Beauty', '|beauty_salon|hair_care')
        .replaceAll('Books', '|book_store|library')
        .replaceAll('Bus stations', '|bus_station')
        .replaceAll('Cars', '|car_dealer|car_rental|car_repair|car_wash')
        .replaceAll('Clothing', '|clothing_store')
        .replaceAll('Doctors', '|doctor')
        .replaceAll('Gas stations', '|gas_station')
        .replaceAll('Gym', '|gym')
        .replaceAll('Jewelries', '|jewelry_store')
        .replaceAll('Parks', '|park|amusement_park|parking|rv_park')
        .replaceAll('Restaurants', '|food|restaurant|cafe|bakery')
        .replaceAll('School', '|school')
        .replaceAll('Spa', '|spa');
  }

  @action
  void tagsChips(List<String> tagsChips) {
    _tagsChips = tagsChips;
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
                      nameList: _places[index].name,
                      addressList: _places[index].vicinity,
                      latList: _places[index].geometry.location.lat,
                      lngList: _places[index].geometry.location.lng,
                      photoList: _places[index].photos.isNotEmpty
                          ? _places[index].photos[0].photo_reference
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

  void createNavPlace(int index, BuildContext context) async {
    isActiveNav(true);

    DocumentReference document =
        _firestore.collection('places').doc(_places[index].place_id);
    document.get().then(
      (document) {
        if (document.exists) {
          count(document.data()['count']);
        } else {
          count(null);
        }
      },
    ).then(
      (value) => _addToFirebase(index, countGet, context),
    );
  }

  void _addToFirebase(int index, int count, BuildContext context) async {
    await _firestore.collection("places").doc(_places[index].place_id).set(
      {
        "date": DateTime.now(),
        'idLive': _places[index].place_id,
        'count': count != null ? count + 1 : 1,
        "name": _places[index].name,
        "vicinity": _places[index].vicinity,
        "lat": _places[index].geometry.location.lat,
        "lng": _places[index].geometry.location.lng,
        "photo": _places[index].photos.isNotEmpty
            ? _places[index].photos[0].photo_reference
            : "",
      },
    ).then(
      (result) => {
        isActiveNav(false),
        print(isActiveNavGet),
        ShowerPages.pushPageMapList(
          context,
          _places[index].name,
          _places[index].vicinity,
          _places[index].geometry.location.lat,
          _places[index].geometry.location.lng,
        ),
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

  void initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        sharedPref(prefs);
        _valueRadius = sharedGet.getDouble('rangeRadius') ?? 5000.0;
        _open = sharedGet.getString('open') ?? '';
      },
    );
  }

  void searchNearbyTotal(bool start, bool isSearching, bool isSearchingAfter,
      String type, String text) {
    _searchNearby(start, isSearching, isSearchingAfter, type, text).then(
      (value) => {
        _sortSearchNearby(value),
      },
    );
  }

  Future _searchNearby(bool start, bool bIsSearching, bool isSearchingAfter,
      String type, String text) async {
    if (start && bIsSearching) {
      _places = await _locationRepoImpl.getLocationJson(_userLocation.latitude,
          _userLocation.longitude, _open, type, _valueRadius.round(), text);
      isSearching(false);
      print(isSearchingGet);
    } else if (!start && isSearchingAfter) {
      _places = await _locationRepoImpl.getLocationJson(_userLocation.latitude,
          _userLocation.longitude, _open, type, _valueRadius.round(), text);
      isSearchAfter(false);
      print(isSearchingAfterGet);
    }
    return _places;
  }

  void _sortSearchNearby(List<Results> _places) {
    _places.sort(
      (a, b) => sqrt(
        pow(a.geometry.location.lat - _userLocation.latitude, 2) +
            pow(a.geometry.location.lng - _userLocation.longitude, 2),
      ).compareTo(
        sqrt(
          pow(b.geometry.location.lat - _userLocation.latitude, 2) +
              pow(b.geometry.location.lng - _userLocation.longitude, 2),
        ),
      ),
    );
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
