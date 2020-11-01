import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mobx_live_chat.g.dart';

class MobXLiveChatStore = _MobXLiveChat with _$MobXLiveChatStore;

abstract class _MobXLiveChat with Store {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @observable
  SharedPreferences _sharedPrefs;
  String _valueUserEmail;
  List<DocumentSnapshot> _listMessage;

  TextEditingController get messageControllerGet => _messageController;

  SharedPreferences get sharedGet => _sharedPrefs;

  String get valueUserEmailGet => _valueUserEmail;

  FirebaseFirestore get firestoreGet => _firestore;

  List<DocumentSnapshot> get listMessageGet => _listMessage;

  @action
  void sharedPref(SharedPreferences sharedPrefs) {
    _sharedPrefs = sharedPrefs;
  }

  void listMessage(List<DocumentSnapshot> listMessage) {
    _listMessage = listMessage;
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
}
