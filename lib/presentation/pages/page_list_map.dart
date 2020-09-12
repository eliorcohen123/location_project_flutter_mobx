import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:ui';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram_stories/flutter_instagram_stories.dart';
import 'package:flutter_instagram_stories/settings.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:latlong/latlong.dart' as dis;
import 'package:locationprojectflutter/core/constants/constants_colors.dart';
import 'package:locationprojectflutter/core/constants/constants_urls_keys.dart';
import 'package:locationprojectflutter/data/models/model_googleapis/results.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
import 'package:locationprojectflutter/data/repositories_impl/location_repo_impl.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/mobx_list_map.dart';
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:locationprojectflutter/presentation/utils/utils_app.dart';
import 'package:locationprojectflutter/presentation/widgets/drawer_total.dart';
import 'package:locationprojectflutter/presentation/utils/responsive_screen.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:locationprojectflutter/presentation/widgets/add_or_edit_favorites_places.dart';
//import 'package:locationprojectflutter/core/services/service_locator.dart';

class PageListMap extends StatefulWidget {
  @override
  _PageListMapState createState() => _PageListMapState();
}

class _PageListMapState extends State<PageListMap> {
  final String _API_KEY = ConstantsUrlsKeys.API_KEY_GOOGLE_MAPS;
  final _formKeySearch = GlobalKey<FormState>();
  final _controllerSearch = TextEditingController();
  final _databaseReference = Firestore.instance;
  final LocationRepoImpl _locationRepoImpl = LocationRepoImpl();
  List<Results> _places = [];
  double _valueRadius;
  String _open;
  UserLocation _userLocation;
  SharedPreferences _sharedPrefs;
  MobXListMapStore _provider = MobXListMapStore();

//  LocationRepoImpl _locationRepoImpl;
//  _ListMapState() : _locationRepoImpl = serviceLocator();

  @override
  void initState() {
    super.initState();

    _provider.isCheckingBottomSheet(false);
    _provider.isSearching(true);
    _provider.isSearchAfter(false);
    _provider.isActiveSearch(false);
    _provider.isActiveNav(false);

    _initGetSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        _userLocation = Provider.of<UserLocation>(context);
        _searchNearbyTotal(true, _provider.isSearchingGet, false, "", "");
        return Scaffold(
          appBar: _appBar(),
          body: Stack(
            children: [
              _mainBody(),
              if (_provider.isActiveNavGet) _loading(),
              _blur(),
            ],
          ),
          drawer: DrawerTotal(),
        );
      },
    );
  }

  PreferredSizeWidget _appBar() {
    if (_provider.isActiveSearchGet) {
      return AppBar(
        backgroundColor: ConstantsColors.BLACK2,
        title: Form(
          key: _formKeySearch,
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search a place...',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  controller: _controllerSearch,
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                color: ConstantsColors.LIGHT_BLUE,
                onPressed: () {
                  if (_formKeySearch.currentState.validate()) {
                    _provider.isSearchAfter(true);
                    _searchNearbyTotal(
                      false,
                      true,
                      _provider.isSearchingAfterGet,
                      "",
                      _controllerSearch.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            color: ConstantsColors.LIGHT_BLUE,
            onPressed: () => _provider.isActiveSearch(false),
          )
        ],
      );
    } else {
      return AppBar(
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: ConstantsColors.LIGHT_BLUE,
            onPressed: () => _provider.isActiveSearch(true),
          ),
          IconButton(
            icon: const Icon(Icons.navigation),
            color: ConstantsColors.LIGHT_BLUE,
            onPressed: () => {
              _provider.isSearchAfter(true),
              _searchNearbyTotal(
                  false, true, _provider.isSearchingAfterGet, "", ""),
            },
          ),
        ],
      );
    }
  }

  Widget _mainBody() {
    return Column(
      children: <Widget>[
        _storiesInstagram(),
        SizedBox(
          height: ResponsiveScreen().heightMediaQuery(context, 1),
          width: double.infinity,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
        _buttonsType(),
        _listViewData(),
      ],
    );
  }

  Widget _storiesInstagram() {
    return FlutterInstagramStories(
      collectionDbName: 'stories',
      showTitleOnIcon: true,
      iconTextStyle: TextStyle(
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(1.0, 1.0),
            blurRadius: 1.0,
            color: ConstantsColors.GRAY,
          ),
        ],
        fontSize: 6,
        color: Colors.white,
      ),
      iconImageBorderRadius: BorderRadius.circular(30),
      iconBoxDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ConstantsColors.BLACK2,
            blurRadius: 10.0,
            offset: const Offset(
              0.0,
              4.0,
            ),
          ),
        ],
      ),
      iconWidth: ResponsiveScreen().widthMediaQuery(context, 50),
      iconHeight: ResponsiveScreen().heightMediaQuery(context, 50),
      imageStoryDuration: 7,
      progressPosition: ProgressPosition.top,
      repeat: true,
      inline: false,
      languageCode: 'en',
      backgroundColorBetweenStories: Colors.black,
      closeButtonIcon: const Icon(
        Icons.close,
        color: Colors.white,
        size: 28.0,
      ),
      closeButtonBackgroundColor: ConstantsColors.LIGHT_GRAY2,
      sortingOrderDesc: true,
      lastIconHighlight: true,
      lastIconHighlightColor: Colors.deepOrange,
      lastIconHighlightRadius: const Radius.circular(30),
    );
  }

  Widget _buttonsType() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _btnType('Banks', 'bank'),
          _btnType('Bars', 'bar|night_club'),
          _btnType('Beauty', 'beauty_salon|hair_care'),
          _btnType('Books', 'book_store|library'),
          _btnType('Bus stations', 'bus_station'),
          _btnType('Cars', 'car_dealer|car_rental|car_repair|car_wash'),
          _btnType('Clothing', 'clothing_store'),
          _btnType('Doctors', 'doctor'),
          _btnType('Gas stations', 'gas_station'),
          _btnType('Gym', 'gym'),
          _btnType('Jewelries', 'jewelry_store'),
          _btnType('Parks', 'park|amusement_park|parking|rv_park'),
          _btnType('Restaurants', 'food|restaurant|cafe|bakery'),
          _btnType('School', 'school'),
          _btnType('Spa', 'spa'),
        ],
      ),
    );
  }

  Widget _loading() {
    return Container(
      decoration: BoxDecoration(
        color: ConstantsColors.DARK_GRAY2,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _listViewData() {
    return _provider.isSearchingGet || _provider.isSearchingAfterGet
        ? const CircularProgressIndicator()
        : _places.length == 0
            ? const Text(
                'No Places',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 30,
                ),
              )
            : Expanded(
                child: LiveList(
                  showItemInterval: const Duration(milliseconds: 50),
                  showItemDuration: const Duration(milliseconds: 50),
                  reAnimateOnVisibility: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _places.length,
                  itemBuilder: buildAnimatedItem,
                  separatorBuilder: (context, i) {
                    return SizedBox(
                      height: ResponsiveScreen().heightMediaQuery(context, 5),
                      width: double.infinity,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    );
                  },
                ),
              );
  }

  Widget _blur() {
    return _provider.isCheckingBottomSheetGet == true
        ? Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          )
        : Container();
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: _childLiveList(index),
        ),
      );

  Widget _childLiveList(int index) {
    final dis.Distance _distance = dis.Distance();
    final double _meter = _distance(
      dis.LatLng(_userLocation.latitude, _userLocation.longitude),
      dis.LatLng(_places[index].geometry.location.lat,
          _places[index].geometry.location.lng),
    );
    return Slidable(
      key: UniqueKey(),
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.10,
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.green,
          icon: Icons.add,
          onTap: () => {
            _provider.isCheckingBottomSheet(true),
            _newTaskModalBottomSheet(context, index),
          },
        ),
        IconSlideAction(
          color: Colors.greenAccent,
          icon: Icons.directions,
          onTap: () => {
            _createNavPlace(index),
          },
        ),
        IconSlideAction(
          color: Colors.blueGrey,
          icon: Icons.share,
          onTap: () => {
            _shareContent(
                _places[index].name,
                _places[index].vicinity,
                _places[index].geometry.location.lat,
                _places[index].geometry.location.lng,
                _places[index].photos[0].photo_reference)
          },
        ),
      ],
      child: Container(
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.fill,
              height: ResponsiveScreen().heightMediaQuery(context, 150),
              width: double.infinity,
              imageUrl: _places[index].photos.isNotEmpty
                  ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" +
                      _places[index].photos[0].photo_reference +
                      "&key=$_API_KEY"
                  : "https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              height: ResponsiveScreen().heightMediaQuery(context, 150),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ConstantsColors.GRAY,
                    ConstantsColors.TRANSPARENT,
                    ConstantsColors.TRANSPARENT,
                    ConstantsColors.GRAY,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _textListView(
                      _places[index].name, 17.0, ConstantsColors.LIGHT_BLUE),
                  _textListView(_places[index].vicinity, 15.0, Colors.white),
                  Row(
                    children: [
                      _textListView(
                          _calculateDistance(_meter), 15.0, Colors.white),
                      UtilsApp.dividerWidth(context, 20),
                      _textListView(
                        _places[index].opening_hours != null
                            ? _places[index].opening_hours.open_now
                                ? 'Open'
                                : !_places[index].opening_hours.open_now
                                    ? 'Close'
                                    : 'No info'
                            : "No info",
                        15.0,
                        ConstantsColors.YELLOW,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnType(String name, String type) {
    return Row(
      children: <Widget>[
        UtilsApp.dividerWidth(context, 5),
        RaisedButton(
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
          ),
          onPressed: () => {
            _provider.isSearchAfter(true),
            _searchNearbyTotal(
                false, true, _provider.isSearchingAfterGet, type, ""),
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  ConstantsColors.GRAY3,
                  ConstantsColors.BLUE,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(80.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveScreen().heightMediaQuery(context, 10),
              horizontal: ResponsiveScreen().widthMediaQuery(context, 30),
            ),
            child: Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        UtilsApp.dividerWidth(context, 5),
      ],
    );
  }

  Widget _textListView(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(1.0, 1.0),
            blurRadius: 1.0,
            color: ConstantsColors.GRAY,
          ),
        ],
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  void _createNavPlace(int index) async {
    _provider.isActiveNav(true);

    var document =
        _databaseReference.collection('places').document(_places[index].id);
    document.get().then(
      (document) {
        if (document.exists) {
          _provider.count(document['count']);
        } else {
          _provider.count(null);
        }
      },
    ).then(
      (value) => _addToFirebase(index, _provider.countGet),
    );
  }

  void _addToFirebase(int index, int count) async {
    DateTime now = DateTime.now();

    Map<String, dynamic> dataFile = Map();
    dataFile["filetype"] = 'image';
    dataFile["url"] = {
      'en': _places[index].photos.isNotEmpty
          ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" +
              _places[index].photos[0].photo_reference +
              "&key=$_API_KEY"
          : "https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png",
    };

    var listFile = List<Map<String, dynamic>>();
    listFile.add(dataFile);

    await _databaseReference
        .collection("stories")
        .document(_places[index].id)
        .setData(
          {
            "date": now,
            "file": listFile,
            "previewImage": _places[index].photos.isNotEmpty
                ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" +
                    _places[index].photos[0].photo_reference +
                    "&key=$_API_KEY"
                : "https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png",
            "previewTitle": {'en': _places[index].name},
          },
        )
        .then(
          (result) async => {
            await _databaseReference
                .collection("places")
                .document(_places[index].id)
                .setData(
              {
                "date": now,
                'idLive': _places[index].id,
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
                _provider.isActiveNav(false),
                print(_provider.isActiveNavGet),
                ShowerPages.pushPageMapList(
                  context,
                  _places[index].name,
                  _places[index].vicinity,
                  _places[index].geometry.location.lat,
                  _places[index].geometry.location.lng,
                ),
              },
            )
          },
        )
        .catchError(
          (err) => print(err),
        );
  }

  String _calculateDistance(double _meter) {
    String _myMeters;
    if (_meter < 1000.0) {
      _myMeters = 'Meters: ' + (_meter.round()).toString();
    } else {
      _myMeters =
          'KM: ' + (_meter.round() / 1000.0).toStringAsFixed(2).toString();
    }
    return _myMeters;
  }

  void _searchNearbyTotal(bool start, bool isSearching, bool isSearchingAfter,
      String type, String text) {
    _searchNearby(start, isSearching, isSearchingAfter, type, text).then(
      (value) => {
        _sortSearchNearby(value),
      },
    );
  }

  Future _searchNearby(bool start, bool isSearching, bool isSearchingAfter,
      String type, String text) async {
    if (start && isSearching) {
      _places = await _locationRepoImpl.getLocationJson(_userLocation.latitude,
          _userLocation.longitude, _open, type, _valueRadius.round(), text);
      _provider.isSearching(false);
      print(_provider.isSearchingGet);
    } else if (!start && isSearchingAfter) {
      _places = await _locationRepoImpl.getLocationJson(_userLocation.latitude,
          _userLocation.longitude, _open, type, _valueRadius.round(), text);
      _provider.isSearchAfter(false);
      print(_provider.isSearchingAfterGet);
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

  void _shareContent(
      String name, String vicinity, double lat, double lng, String photo) {
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

  void _newTaskModalBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            _provider.isCheckingBottomSheet(false);

            Navigator.pop(context, false);

            return Future.value(false);
          },
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                child: ListView(
                  children: [
                    AddOrEditFavoritesPlaces(
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

  void _initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          _sharedPrefs = prefs;
        });
        _valueRadius = _sharedPrefs.getDouble('rangeRadius') ?? 5000.0;
        _open = _sharedPrefs.getString('open') ?? '';
      },
    );
  }
}