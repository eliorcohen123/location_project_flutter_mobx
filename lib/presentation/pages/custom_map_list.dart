import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/custom_map_list_mobx.dart';
import 'package:provider/provider.dart';
import 'package:locationprojectflutter/presentation/widgets/add_or_edit_favorites_places.dart';

class CustomMapList extends StatefulWidget {
  CustomMapList({Key key}) : super(key: key);

  @override
  _CustomMapListState createState() => _CustomMapListState();
}

class _CustomMapListState extends State<CustomMapList> {
  MapCreatedCallback _onMapCreated;
  bool _zoomGesturesEnabled = true;
  LatLng _currentLocation;
  UserLocation _userLocation;
  CustomMapListMobXStore _mobX = CustomMapListMobXStore();

  @override
  void initState() {
    super.initState();

    _mobX.isCheckingBottomSheet(false);
    _mobX.clearMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        _userLocation = Provider.of<UserLocation>(context);
        _currentLocation =
            LatLng(_userLocation.latitude, _userLocation.longitude);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            leading: IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: Color(0xFFE9FFFF),
                size: 40,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Container(
              child: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _currentLocation,
                  zoom: 10.0,
                ),
                markers: Set<Marker>.of(_mobX.markersGet),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: _zoomGesturesEnabled,
                mapType: MapType.normal,
                onTap: _addMarker,
              ),
              _mobX.checkingBottomSheetGet == true
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
                  : Container(),
            ],
          )),
        );
      },
    );
  }

  void _addMarker(LatLng point) {
    _mobX.clearMarkers();
    _mobX.markersGet.add(
      Marker(
        markerId: MarkerId(
          point.toString(),
        ),
        position: point,
        onTap: () => {
          _mobX.isCheckingBottomSheet(true),
          _newTaskModalBottomSheet(context, point),
        },
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
      ),
    );
  }

  void _newTaskModalBottomSheet(BuildContext context, LatLng point) {
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
                    AddOrEditFavoritesPlaces(
                      latList: point.latitude,
                      lngList: point.longitude,
                      photoList: "",
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
