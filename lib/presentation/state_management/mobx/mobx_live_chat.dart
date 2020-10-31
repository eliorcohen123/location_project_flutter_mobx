import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locationprojectflutter/data/models/model_live_chat/results_live_chat.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mobx_live_chat.g.dart';

class MobXLiveChatStore = _MobXLiveChat with _$MobXLiveChatStore;

abstract class _MobXLiveChat with Store {
  final Stream<QuerySnapshot> _snapshots = FirebaseFirestore.instance
      .collection('liveMessages')
      .orderBy('date', descending: true)
      .limit(50)
      .snapshots();
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @observable
  SharedPreferences _sharedPrefs;
  @observable
  List<ResultsLiveChat> _places = [];
  StreamSubscription<QuerySnapshot> _placeSub;
  String _valueUserEmail;

  SharedPreferences get sharedGet => _sharedPrefs;

  List<ResultsLiveChat> get placesGet => _places;

  TextEditingController get messageControllerGet => _messageController;

  StreamSubscription<QuerySnapshot> get placeSubGet => _placeSub;

  String get valueUserEmailGet => _valueUserEmail;

  @action
  void sharedPref(SharedPreferences sharedPrefs) {
    _sharedPrefs = sharedPrefs;
  }

  @action
  void lPlaces(List<ResultsLiveChat> places) {
    _places = places;
  }

  void initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        sharedPref(prefs);
        _valueUserEmail = sharedGet.getString('userEmail') ?? 'guest@gmail.com';
      },
    );
  }

  void callback() async {
    if (_messageController.text.length > 0) {
      await _firestore.collection("liveMessages").add(
        {
          'text': _messageController.text,
          'from': _valueUserEmail,
          'date': DateTime.now(),
        },
      ).then(
        (value) => _messageController.text = '',
      );
    }
  }

  void readFirebase() {
    _placeSub?.cancel();
    _placeSub = _snapshots.listen(
      (QuerySnapshot snapshot) {
        final List<ResultsLiveChat> places = snapshot.docs
            .map(
              (documentSnapshot) =>
                  ResultsLiveChat.fromSqfl(documentSnapshot.data()),
            )
            .toList();

        lPlaces(places);
      },
    );
  }
}
