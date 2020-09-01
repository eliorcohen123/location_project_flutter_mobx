import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locationprojectflutter/presentation/pages/phone_sms_auth.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/sign_in_firebase_mobx.dart';
import 'package:locationprojectflutter/presentation/utils/validations.dart';
import 'package:locationprojectflutter/presentation/pages/register_email_firebase.dart';
import 'package:locationprojectflutter/presentation/utils/responsive_screen.dart';
import 'package:locationprojectflutter/presentation/widgets/btn_firebase.dart';
import 'package:locationprojectflutter/presentation/widgets/tff_firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list_map.dart';

class SignInFirebase extends StatefulWidget {
  @override
  _SignInFirebaseState createState() => _SignInFirebaseState();
}

class _SignInFirebaseState extends State<SignInFirebase> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin _fbLogin = FacebookLogin();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userEmail;
  SharedPreferences _sharedPrefs;
  SignInFirebaseMobXStore _mobX = SignInFirebaseMobXStore();

  @override
  void initState() {
    super.initState();

    _mobX.success(null);
    _mobX.loading(false);
    _mobX.isLoggedIn(false);
    _mobX.textError('');

    _initGetSharedPrefs();
    _checkUserLogin();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return _mobX.isLoggedInGet
            ? ListMap()
            : Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.blueGrey,
                body: Form(
                  key: _formKey,
                  child: Container(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _title(),
                            SizedBox(
                              height: ResponsiveScreen()
                                  .heightMediaQuery(context, 70),
                            ),
                            _textFieldsData(),
                            SizedBox(
                              height: ResponsiveScreen()
                                  .heightMediaQuery(context, 20),
                            ),
                            _buttonLogin(),
                            SizedBox(
                              height: ResponsiveScreen()
                                  .heightMediaQuery(context, 5),
                            ),
                            _showErrors(),
                            _buttonToRegister(),
                            SizedBox(
                              height: ResponsiveScreen()
                                  .heightMediaQuery(context, 20),
                            ),
                            _loginFacebookGmailSms(),
                            SizedBox(
                              height: ResponsiveScreen()
                                  .heightMediaQuery(context, 20),
                            ),
                            _loading(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget _title() {
    return Text(
      'Login',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.greenAccent,
        fontSize: 40,
      ),
    );
  }

  Widget _textFieldsData() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: ResponsiveScreen().heightMediaQuery(context, 20),
          ),
          child: TFFFirebase(
            key: Key('emailLogin'),
            icon: Icon(Icons.email),
            hint: "Email",
            controller: _emailController,
            textInputType: TextInputType.emailAddress,
            obSecure: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: ResponsiveScreen().heightMediaQuery(context, 20),
          ),
          child: TFFFirebase(
            key: Key('passwordLogin'),
            icon: Icon(Icons.lock),
            hint: "Password",
            controller: _passwordController,
            textInputType: TextInputType.text,
            obSecure: true,
          ),
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return Padding(
      padding: EdgeInsets.only(
          left: ResponsiveScreen().widthMediaQuery(context, 20),
          right: ResponsiveScreen().widthMediaQuery(context, 20),
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BtnFirebase(
        text: 'Login',
        onTap: () => _checkClickBtnLogin(),
      ),
    );
  }

  void _checkClickBtnLogin() {
    if (_formKey.currentState.validate()) {
      if (Validations().validateEmail(_emailController.text) &&
          Validations().validatePassword(_passwordController.text)) {
        _mobX.loading(true);
        _mobX.textError('');

        _loginEmailFirebase();
      } else if (!Validations().validateEmail(_emailController.text)) {
        _mobX.success(false);
        _mobX.textError('Invalid Email');
      } else if (!Validations().validatePassword(_passwordController.text)) {
        _mobX.success(false);
        _mobX.textError('Password must be at least 8 characters');
      }
    }
  }

  Widget _showErrors() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        _mobX.successGet == null
            ? ''
            : _mobX.successGet ? '' : _mobX.textErrorGet,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttonToRegister() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterEmailFirebase(),
          ),
        );
      },
      child: Text(
        'Don' + "'" + 't Have an account? click here to register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _loginFacebookGmailSms() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          child: MaterialButton(
            shape: CircleBorder(),
            child: Image.asset('assets/facebook_icon.jpg'),
            color: Colors.white,
            onPressed: () {
              _facebookLogin();
              _mobX.loading(true);
              _mobX.textError('');
            },
          ),
        ),
        SizedBox(
          width: ResponsiveScreen().widthMediaQuery(context, 20),
        ),
        Container(
          width: 60,
          height: 60,
          child: MaterialButton(
            shape: CircleBorder(),
            child: Image.asset('assets/google_icon.png'),
            color: Colors.white,
            onPressed: () {
              _signInWithGoogle();
              _mobX.loading(true);
              _mobX.textError('');
            },
          ),
        ),
        SizedBox(
          width: ResponsiveScreen().widthMediaQuery(context, 20),
        ),
        Container(
          width: 60,
          height: 60,
          child: MaterialButton(
            shape: CircleBorder(),
            child: Image.asset('assets/phone_icon.jpg'),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneSMSAuth(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _loading() {
    return _mobX.loadingGet == true ? CircularProgressIndicator() : Container();
  }

  void _checkUserLogin() {
    _auth
        .currentUser()
        .then((user) => user != null ? _mobX.isLoggedIn(true) : null);
  }

  void _loginEmailFirebase() async {
    final FirebaseUser user = (await _auth
            .signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
            .catchError(
      (error) {
        _mobX.success(false);
        _mobX.loading(false);
        _mobX.textError(error.message);
      },
    ))
        .user;
    _addToFirebase(user);
  }

  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential).catchError(
      (error) {
        _mobX.success(false);
        _mobX.loading(false);
        _mobX.textError(error.message);
      },
    ))
            .user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    _addToFirebase(user);
  }

  void _facebookLogin() async {
    final FacebookLoginResult facebookLoginResult =
        await _fbLogin.logIn(['email', 'public_profile']);
    FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
    final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: facebookAccessToken.token,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential).catchError(
      (error) {
        _mobX.success(false);
        _mobX.loading(false);
        _mobX.textError(error.message);
      },
    ))
            .user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    _addToFirebase(user);
  }

  void _addToFirebase(FirebaseUser user) async {
    if (user != null) {
      _mobX.success(true);
      _mobX.loading(false);
      _mobX.textError('');
      final QuerySnapshot result = await _firestore
          .collection('users')
          .where('id', isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        _firestore.collection('users').document(user.uid).setData(
          {
            'nickname': user.displayName,
            'photoUrl': user.photoUrl,
            'id': user.uid,
            'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
            'chattingWith': null
          },
        );
        await _sharedPrefs.setString('id', user.uid);
        await _sharedPrefs.setString('nickname', user.displayName);
        await _sharedPrefs.setString('photoUrl', user.photoUrl);
      } else {
        await _sharedPrefs.setString('id', documents[0]['id']);
        await _sharedPrefs.setString('nickname', documents[0]['nickname']);
        await _sharedPrefs.setString('aboutMe', documents[0]['aboutMe']);
        await _sharedPrefs.setString('photoUrl', documents[0]['photoUrl']);
      }
      _userEmail = user.email;
      print(_userEmail);
      _addUserEmail(_userEmail);
      _addIdEmail(user.uid);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListMap(),
        ),
      );
    } else {
      _mobX.success(false);
      _mobX.loading(false);
    }
  }

  void _initGetSharedPrefs() {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          _sharedPrefs = prefs;
        });
      },
    );
  }

  void _addUserEmail(String value) async {
    _sharedPrefs.setString('userEmail', value);
  }

  void _addIdEmail(String value) async {
    _sharedPrefs.setString('userIdEmail', value);
  }
}
