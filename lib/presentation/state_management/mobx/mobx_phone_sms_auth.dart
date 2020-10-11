import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mobx_phone_sms_auth.g.dart';

class MobXPhoneSMSAuthStore = _MobXPhoneSMSAuth with _$MobXPhoneSMSAuthStore;

abstract class _MobXPhoneSMSAuth with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final GlobalKey<FormState> _formKeyPhone = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeySms = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _smsController1 = TextEditingController();
  final TextEditingController _smsController2 = TextEditingController();
  final TextEditingController _smsController3 = TextEditingController();
  final TextEditingController _smsController4 = TextEditingController();
  final TextEditingController _smsController5 = TextEditingController();
  final TextEditingController _smsController6 = TextEditingController();
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();
  final FocusNode _focus4 = FocusNode();
  final FocusNode _focus5 = FocusNode();
  final FocusNode _focus6 = FocusNode();
  @observable
  bool _isSuccess, _isLoading = false;
  @observable
  String _textError = '', _textOk = '', _verificationId;
  @observable
  SharedPreferences _sharedPrefs;

  GlobalKey<FormState> get formKeyPhoneGet => _formKeyPhone;

  GlobalKey<FormState> get formKeySmsGet => _formKeySms;

  TextEditingController get phoneControllerGet => _phoneController;

  TextEditingController get smsController1Get => _smsController1;

  TextEditingController get smsController2Get => _smsController2;

  TextEditingController get smsController3Get => _smsController3;

  TextEditingController get smsController4Get => _smsController4;

  TextEditingController get smsController5Get => _smsController5;

  TextEditingController get smsController6Get => _smsController6;

  FocusNode get focus1Get => _focus1;

  FocusNode get focus2Get => _focus2;

  FocusNode get focus3Get => _focus3;

  FocusNode get focus4Get => _focus4;

  FocusNode get focus5Get => _focus5;

  FocusNode get focus6Get => _focus6;

  bool get isSuccessGet => _isSuccess;

  bool get isLoadingGet => _isLoading;

  String get textErrorGet => _textError;

  String get textOkGet => _textOk;

  String get verificationIdGet => _verificationId;

  SharedPreferences get sharedGet => _sharedPrefs;

  @action
  void sharedPref(SharedPreferences sharedPrefs) {
    _sharedPrefs = sharedPrefs;
  }

  @action
  void isSuccess(bool isSuccess) {
    _isSuccess = isSuccess;
  }

  @action
  void isLoading(bool isLoading) {
    _isLoading = isLoading;
  }

  @action
  void textError(String textError) {
    _textError = textError;
  }

  @action
  void textOk(String textOk) {
    _textOk = textOk;
  }

  @action
  void sVerificationId(String verificationId) {
    _verificationId = verificationId;
  }

  void verifyPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential).catchError(
        (error) {
          isSuccess(false);
          isLoading(false);
          textError(error.message);
        },
      );
      textOk('Received phone auth credential: $phoneAuthCredential');
      isSuccess(false);
      isLoading(false);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      textError(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      isSuccess(false);
      isLoading(false);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      textOk('Please check your phone for the verification code.');
      sVerificationId(verificationId);
      isSuccess(false);
      isLoading(false);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      sVerificationId(verificationId);
      isSuccess(false);
      isLoading(false);
    };

    await _auth
        .verifyPhoneNumber(
      phoneNumber: '+972' + _phoneController.text,
      timeout: const Duration(seconds: 120),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    )
        .catchError(
      (error) {
        isSuccess(false);
        isLoading(false);
        textError(error.message);
      },
    );
  }

  void signInWithPhoneNumber(BuildContext context) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationIdGet,
      smsCode: _smsController1.text +
          _smsController2.text +
          _smsController3.text +
          _smsController4.text +
          _smsController5.text +
          _smsController6.text,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential).catchError(
      (error) {
        isSuccess(false);
        isLoading(false);
        textError(error.message);
      },
    ))
            .user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    _addToFirebase(user, context);
  }

  void _addToFirebase(FirebaseUser user, BuildContext context) async {
    if (user != null) {
      isSuccess(true);
      isLoading(false);
      textError('');
      textOk('');

      final QuerySnapshot result = await _firestore
          .collection('users')
          .where('id', isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        _firestore.collection('users').document(user.uid).setData({
          'nickname': user.displayName,
          'photoUrl': user.photoUrl,
          'id': user.uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          'chattingWith': null
        });

        await sharedGet.setString('id', user.uid);
        await sharedGet.setString('nickname', user.displayName);
        await sharedGet.setString('photoUrl', user.photoUrl);
      } else {
        await sharedGet.setString('id', documents[0]['id']);
        await sharedGet.setString('nickname', documents[0]['nickname']);
        await sharedGet.setString('photoUrl', documents[0]['photoUrl']);
        await sharedGet.setString('aboutMe', documents[0]['aboutMe']);
      }

      print(user.email);
      _addUserEmail(user.email);
      _addIdEmail(user.uid);
      ShowerPages.pushRemoveReplacementPageListMap(context);
    } else {
      isSuccess(false);
      isLoading(false);
    }
  }

  void initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        sharedPref(prefs);
      },
    );
  }

  void _addUserEmail(String value) async {
    sharedGet.setString('userEmail', value);
  }

  void _addIdEmail(String value) async {
    sharedGet.setString('userIdEmail', value);
  }
}
