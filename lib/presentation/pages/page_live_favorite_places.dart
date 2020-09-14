import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:ui';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:locationprojectflutter/core/constants/constants_colors.dart';
import 'package:locationprojectflutter/core/constants/constants_urls_keys.dart';
import 'package:locationprojectflutter/data/models/model_live_favorites/results_live_favorites.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/mobx_live_favorite_places.dart';
import 'package:locationprojectflutter/presentation/utils/responsive_screen.dart';
import 'package:latlong/latlong.dart' as dis;
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:locationprojectflutter/presentation/widgets/widget_app_bar_total.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:locationprojectflutter/presentation/widgets/widget_add_edit_favorite_places.dart';

class PageLiveFavoritePlaces extends StatefulWidget {
  @override
  _PageLiveFavoritePlacesState createState() => _PageLiveFavoritePlacesState();
}

class _PageLiveFavoritePlacesState extends State<PageLiveFavoritePlaces> {
  final String _API_KEY = ConstantsUrlsKeys.API_KEY_GOOGLE_MAPS;
  final Stream<QuerySnapshot> _snapshots =
      Firestore.instance.collection('places').snapshots();
  UserLocation _userLocation;
  StreamSubscription<QuerySnapshot> _placeSub;
  MobXLiveFavoritePlacesStore _mobX = MobXLiveFavoritePlacesStore();

  @override
  void initState() {
    super.initState();

    _mobX.isCheckingBottomSheet(false);

    _readFirebase();
  }

  @override
  void dispose() {
    super.dispose();

    _placeSub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        _userLocation = Provider.of<UserLocation>(context);
        return Scaffold(
          appBar: WidgetAppBarTotal(),
          body: Stack(
            children: [
              _listViewData(),
              _loading(),
            ],
          ),
        );
      },
    );
  }

  Widget _listViewData() {
    return Column(
      children: <Widget>[
        _mobX.placesGet.length == 0
            ? const Align(
                alignment: Alignment.center,
                child: Text(
                  'No Top Places',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 30,
                  ),
                ),
              )
            : Expanded(
                child: LiveList(
                  showItemInterval: const Duration(milliseconds: 50),
                  showItemDuration: const Duration(milliseconds: 50),
                  reAnimateOnVisibility: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _mobX.placesGet.length,
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
              ),
      ],
    );
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
      dis.LatLng(_mobX.placesGet[index].lat, _mobX.placesGet[index].lng),
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
            _mobX.isCheckingBottomSheet(true),
            _newTaskModalBottomSheet(context, index),
          },
        ),
        IconSlideAction(
          color: Colors.greenAccent,
          icon: Icons.directions,
          onTap: () => {
            ShowerPages.pushPageMapList(
              context,
              _mobX.placesGet[index].name,
              _mobX.placesGet[index].vicinity,
              _mobX.placesGet[index].lat,
              _mobX.placesGet[index].lng,
            ),
          },
        ),
        IconSlideAction(
          color: Colors.blueGrey,
          icon: Icons.share,
          onTap: () => {
            _shareContent(
                _mobX.placesGet[index].name,
                _mobX.placesGet[index].vicinity,
                _mobX.placesGet[index].lat,
                _mobX.placesGet[index].lng,
                _mobX.placesGet[index].photo)
          },
        ),
      ],
      child: Container(
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: ResponsiveScreen().heightMediaQuery(context, 150),
                  width: double.infinity,
                  imageUrl: _mobX.placesGet[index].photo.isNotEmpty
                      ? "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=" +
                          _mobX.placesGet[index].photo +
                          "&key=$_API_KEY"
                      : "https://upload.wikimedia.org/wikipedia/commons/7/75/No_image_available.png",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
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
                  _textList(_mobX.placesGet[index].name, 17.0,
                      ConstantsColors.LIGHT_BLUE),
                  _textList(
                      _mobX.placesGet[index].vicinity, 15.0, Colors.white),
                  _textList(_calculateDistance(_meter), 15.0, Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textList(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(1.0, 1.0),
            blurRadius: 1.0,
            color: ConstantsColors.GRAY,
          ),
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

  Widget _loading() {
    return _mobX.isCheckingBottomSheetGet == true
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

  void _readFirebase() {
    _placeSub?.cancel();
    _placeSub = _snapshots.listen(
      (QuerySnapshot snapshot) {
        final List<ResultsFirestore> places = snapshot.documents
            .map(
              (documentSnapshot) =>
                  ResultsFirestore.fromSqfl(documentSnapshot.data),
            )
            .toList();

        places.sort(
          (a, b) {
            return b.count.compareTo(a.count);
          },
        );

        _mobX.places(places);
      },
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
            _mobX.isCheckingBottomSheet(false);

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
                      nameList: _mobX.placesGet[index].name,
                      addressList: _mobX.placesGet[index].vicinity,
                      latList: _mobX.placesGet[index].lat,
                      lngList: _mobX.placesGet[index].lng,
                      photoList: _mobX.placesGet[index].photo.isNotEmpty
                          ? _mobX.placesGet[index].photo
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
}
