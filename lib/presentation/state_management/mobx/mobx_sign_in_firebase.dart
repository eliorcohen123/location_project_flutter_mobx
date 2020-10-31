import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:locationprojectflutter/presentation/utils/validations.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mobx_sign_in_firebase.g.dart';

class MobXSignInFirebaseStore = _MobXSignInFirebase
    with _$MobXSignInFirebaseStore;

abstract class _MobXSignInFirebase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _fbLogin = FacebookLogin();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @observable
  SharedPreferences _sharedPrefs;
  @observable
  bool _isSuccess, _isLoading = false;
  @observable
  String _textError = '';

  GlobalKey<FormState> get formKeyGet => _formKey;

  TextEditingController get emailControllerGet => _emailController;

  TextEditingController get passwordControllerGet => _passwordController;

  SharedPreferences get sharedGet => _sharedPrefs;

  bool get isSuccessGet => _isSuccess;

  bool get isLoadingGet => _isLoading;

  String get textErrorGet => _textError;

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

  User _currentUser() {
    User currentUser = _auth.currentUser;
    return currentUser;
  }

  void checkClickBtnLogin(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (Validations().validateEmail(_emailController.text) &&
          Validations().validatePassword(_passwordController.text)) {
        isLoading(true);
        textError('');

        _loginEmailFirebase(context);
      } else if (!Validations().validateEmail(_emailController.text)) {
        isSuccess(false);
        textError('Invalid Email');
      } else if (!Validations().validatePassword(_passwordController.text)) {
        isSuccess(false);
        textError('Password must be at least 8 characters');
      }
    }
  }

  void checkUserLogin(BuildContext context) {
    _currentUser() != null
        ? ShowerPages.pushRemoveReplacementPageListMap(context)
        : null;
  }

  void _loginEmailFirebase(BuildContext context) async {
    final User user = (await _auth
            .signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
            .catchError(
      (error) {
        isSuccess(false);
        isLoading(false);
        textError(error.message);
      },
    ))
        .user;

    _addToFirebase(user, context);
  }

  void signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final User user = (await _auth.signInWithCredential(credential).catchError(
      (error) {
        isSuccess(false);
        isLoading(false);
        textError(error.message);
      },
    ))
        .user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    assert(user.uid == _currentUser().uid);

    _addToFirebase(user, context);
  }

  void facebookLogin(BuildContext context) async {
    final FacebookLoginResult facebookLoginResult =
        await _fbLogin.logIn(['email', 'public_profile']);
    FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
    final AuthCredential credential =
        FacebookAuthProvider.credential(facebookAccessToken.token);
    final User user = (await _auth.signInWithCredential(credential).catchError(
      (error) {
        isSuccess(false);
        isLoading(false);
        textError(error.message);
      },
    ))
        .user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    assert(user.uid == _currentUser().uid);

    _addToFirebase(user, context);
  }

  void _addToFirebase(User user, BuildContext context) async {
    if (user != null) {
      isSuccess(true);
      isLoading(false);
      textError('');

      final QuerySnapshot result = await _firestore
          .collection('users')
          .where('id', isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        _firestore.collection('users').doc(user.uid).set(
          {
            'nickname': user.displayName,
            'photoUrl': user.photoURL,
            'id': user.uid,
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
            'chattingWith': null
          },
        );

        await sharedGet.setString('id', user.uid);
        await sharedGet.setString('nickname', user.displayName);
        await sharedGet.setString('photoUrl', user.photoURL);
      } else {
        await sharedGet.setString('id', documents[0]['id']);
        await sharedGet.setString('nickname', documents[0]['nickname']);
        await sharedGet.setString('photoUrl', documents[0]['photoUrl']);
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
