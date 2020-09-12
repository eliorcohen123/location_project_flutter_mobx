import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/mobx_register_email_firebase.dart';
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:locationprojectflutter/presentation/utils/utils_app.dart';
import 'package:locationprojectflutter/presentation/utils/validations.dart';
import 'package:locationprojectflutter/presentation/utils/responsive_screen.dart';
import 'package:locationprojectflutter/presentation/widgets/btn_firebase.dart';
import 'package:locationprojectflutter/presentation/widgets/tff_firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageRegisterEmailFirebase extends StatefulWidget {
  @override
  _PageRegisterEmailFirebaseState createState() =>
      _PageRegisterEmailFirebaseState();
}

class _PageRegisterEmailFirebaseState extends State<PageRegisterEmailFirebase> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _userEmail;
  SharedPreferences _sharedPrefs;
  MobXRegisterEmailFirebaseStore _mobX = MobXRegisterEmailFirebaseStore();

  @override
  void initState() {
    super.initState();

    _mobX.isSuccess(null);
    _mobX.isLoading(false);
    _mobX.textError('');

    _initGetSharedPrefs();
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
        return Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _title(),
                      UtilsApp.dividerHeight(context, 70),
                      _textFieldsData(),
                      UtilsApp.dividerHeight(context, 20),
                      _buttonRegister(),
                      UtilsApp.dividerHeight(context, 5),
                      _showErrors(),
                      _buttonToLogin(),
                      UtilsApp.dividerHeight(context, 20),
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
    return const Text(
      'Register',
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
            icon: const Icon(Icons.email),
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
            icon: const Icon(Icons.lock),
            hint: "Password",
            controller: _passwordController,
            textInputType: TextInputType.text,
            obSecure: true,
          ),
        ),
      ],
    );
  }

  Widget _buttonRegister() {
    return Padding(
      padding: EdgeInsets.only(
          left: ResponsiveScreen().widthMediaQuery(context, 20),
          right: ResponsiveScreen().widthMediaQuery(context, 20),
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BtnFirebase(
        text: 'Register',
        onTap: () => _checkClickBtnRegister(),
      ),
    );
  }

  void _checkClickBtnRegister() {
    if (_formKey.currentState.validate()) {
      if (Validations().validateEmail(_emailController.text) &&
          Validations().validatePassword(_passwordController.text)) {
        _mobX.isLoading(true);
        _mobX.textError('');

        _registerEmailFirebase();
      } else if (!Validations().validateEmail(_emailController.text)) {
        _mobX.isSuccess(false);
        _mobX.textError('Invalid Email');
      } else if (!Validations().validatePassword(_passwordController.text)) {
        _mobX.isSuccess(false);
        _mobX.textError('Password must be at least 8 characters');
      }
    }
  }

  Widget _showErrors() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        _mobX.isSuccessGet == null
            ? ''
            : _mobX.isSuccessGet ? '' : _mobX.textErrorGet,
        style: const TextStyle(
          color: Colors.redAccent,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buttonToLogin() {
    return GestureDetector(
      onTap: () {
        ShowerPages.pushPageSignInFirebase(context);
      },
      child: const Text(
        'Have an account? click here to login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _loading() {
    return _mobX.isLoadingGet == true
        ? const CircularProgressIndicator()
        : Container();
  }

  void _registerEmailFirebase() async {
    final FirebaseUser user = (await _auth
            .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
            .catchError(
      (error) {
        _mobX.isSuccess(false);
        _mobX.isLoading(false);
        _mobX.textError(error.message);
      },
    ))
        .user;
    if (user != null) {
      _mobX.isSuccess(true);
      _mobX.isLoading(false);
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
      ShowerPages.pushPageListMap(context);
    } else {
      _mobX.isSuccess(false);
      _mobX.isLoading(false);
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
