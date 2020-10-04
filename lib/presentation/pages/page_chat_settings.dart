import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locationprojectflutter/core/constants/constants_colors.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/mobx_chat_settings.dart';
import 'package:locationprojectflutter/presentation/utils/responsive_screen.dart';
import 'package:locationprojectflutter/presentation/utils/shower_pages.dart';
import 'package:locationprojectflutter/presentation/widgets/widget_app_bar_total.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageChatSettings extends StatefulWidget {
  @override
  _PageChatSettingsState createState() => _PageChatSettingsState();
}

class _PageChatSettingsState extends State<PageChatSettings> {
  final Firestore _firestore = Firestore.instance;
  final FocusNode _focusNodeNickname = FocusNode();
  final FocusNode _focusNodeAboutMe = FocusNode();
  var _document;
  TextEditingController _controllerNickname, _controllerAboutMe;
  String _id = '';
  SharedPreferences _sharedPrefs;
  MobXChatSettingsStore _mobX = MobXChatSettingsStore();

  @override
  void initState() {
    super.initState();

    _initControllerTextEditing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBarTotal(),
      body: Stack(
        children: <Widget>[
          _mainBody(),
          _loading(),
        ],
      ),
    );
  }

  Widget _mainBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _circleAvatar(),
          _textFieldsData(),
          _buttonUpdate(),
        ],
      ),
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveScreen().widthMediaQuery(context, 15)),
    );
  }

  Widget _circleAvatar() {
    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            _mobX.avatarImageFileGet == null
                ? _mobX.photoUrlGet != null
                ? Material(
              child: CachedNetworkImage(
                placeholder: (context, url) => Container(
                  child: CircularProgressIndicator(
                    strokeWidth: ResponsiveScreen()
                        .widthMediaQuery(context, 2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ConstantsColors.ORANGE,
                    ),
                  ),
                  width:
                  ResponsiveScreen().widthMediaQuery(context, 90),
                  height: ResponsiveScreen()
                      .heightMediaQuery(context, 50),
                  padding: EdgeInsets.all(ResponsiveScreen()
                      .widthMediaQuery(context, 20)),
                ),
                imageUrl: _mobX.photoUrlGet != null
                    ? _mobX.photoUrlGet
                    : '',
                width:
                ResponsiveScreen().widthMediaQuery(context, 90),
                height:
                ResponsiveScreen().widthMediaQuery(context, 90),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(45.0),
              ),
              clipBehavior: Clip.hardEdge,
            )
                : Icon(
              Icons.account_circle,
              size: 90.0,
              color: ConstantsColors.DARK_GRAY,
            )
                : Material(
              child: Image.file(
                _mobX.avatarImageFileGet,
                width: ResponsiveScreen().widthMediaQuery(context, 90),
                height: ResponsiveScreen().widthMediaQuery(context, 90),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(45.0),
              ),
              clipBehavior: Clip.hardEdge,
            ),
            IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: ConstantsColors.DARK_BLUE.withOpacity(0.5),
              ),
              onPressed: () => _newTaskModalBottomSheet(context),
              padding: const EdgeInsets.all(30.0),
              splashColor: Colors.transparent,
              highlightColor: ConstantsColors.DARK_BLUE,
              iconSize: 30.0,
            ),
          ],
        ),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(ResponsiveScreen().widthMediaQuery(context, 20)),
    );
  }

  Widget _textFieldsData() {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            'Nickname',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: ConstantsColors.DARK_BLUE,
            ),
          ),
          margin: EdgeInsets.only(
            left: ResponsiveScreen().widthMediaQuery(context, 10),
            bottom: ResponsiveScreen().heightMediaQuery(context, 5),
            top: ResponsiveScreen().heightMediaQuery(context, 10),
          ),
        ),
        Container(
          child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: ConstantsColors.DARK_BLUE,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cool Man',
                contentPadding: EdgeInsets.all(
                    ResponsiveScreen().widthMediaQuery(context, 5)),
                hintStyle: TextStyle(color: ConstantsColors.DARK_GRAY),
              ),
              controller: _controllerNickname,
              onChanged: (value) {
                _mobX.nickname(value);
              },
              focusNode: _focusNodeNickname,
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: ResponsiveScreen().widthMediaQuery(context, 30)),
        ),
        Container(
          child: Text(
            'About Me',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: ConstantsColors.DARK_BLUE,
            ),
          ),
          margin: EdgeInsets.only(
            left: ResponsiveScreen().widthMediaQuery(context, 10),
            top: ResponsiveScreen().heightMediaQuery(context, 30),
            bottom: ResponsiveScreen().heightMediaQuery(context, 5),
          ),
        ),
        Container(
          child: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: ConstantsColors.DARK_BLUE,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Fun, like travel and play PES...',
                contentPadding: EdgeInsets.all(
                    ResponsiveScreen().widthMediaQuery(context, 5)),
                hintStyle: TextStyle(color: ConstantsColors.DARK_GRAY),
              ),
              controller: _controllerAboutMe,
              onChanged: (value) {
                _mobX.aboutMe(value);
              },
              focusNode: _focusNodeAboutMe,
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: ResponsiveScreen().widthMediaQuery(context, 30)),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _buttonUpdate() {
    return Container(
      child: FlatButton(
        onPressed: _handleUpdateData,
        child: const Text(
          'UPDATE',
          style: TextStyle(fontSize: 16.0),
        ),
        color: ConstantsColors.DARK_BLUE,
        highlightColor: ConstantsColors.GRAY2,
        splashColor: Colors.transparent,
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveScreen().widthMediaQuery(context, 30),
          vertical: ResponsiveScreen().heightMediaQuery(context, 10),
        ),
      ),
      margin: EdgeInsets.symmetric(
          vertical: ResponsiveScreen().heightMediaQuery(context, 50)),
    );
  }

  Widget _loading() {
    return Positioned(
      child: _mobX.isLoadingGet
          ? Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              ConstantsColors.ORANGE,
            ),
          ),
        ),
        color: Colors.white.withOpacity(0.8),
      )
          : Container(),
    );
  }

  void _getImage(bool take) async {
    File image;
    if (take) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      image = await ShowerPages.pushPageSimpleImageCrop(context, image);

      _mobX.avatarImageFile(image);
      _mobX.isLoading(true);

      Navigator.pop(context, false);

      _uploadFile();
    }
  }

  void _uploadFile() async {
    StorageReference reference = FirebaseStorage.instance.ref().child(_id);
    StorageUploadTask uploadTask = reference.putFile(_mobX.avatarImageFileGet);
    StorageTaskSnapshot storageTaskSnapshot;
    uploadTask.onComplete.then(
      (value) {
        if (value.error == null) {
          storageTaskSnapshot = value;
          storageTaskSnapshot.ref.getDownloadURL().then(
            (downloadUrl) {
              _mobX.photoUrl(downloadUrl);
              _firestore.collection('users').document(_id).updateData(
                {
                  'nickname': _mobX.nicknameGet,
                  'aboutMe': _mobX.aboutMeGet,
                  'photoUrl': _mobX.photoUrlGet,
                },
              ).then(
                (data) {
                  _mobX.isLoading(false);

                  Fluttertoast.showToast(
                    msg: "Upload success",
                  );
                },
              ).catchError(
                (err) {
                  _mobX.isLoading(false);

                  Fluttertoast.showToast(
                    msg: err.toString(),
                  );
                },
              );
            },
            onError: (err) {
              _mobX.isLoading(false);

              Fluttertoast.showToast(
                msg: 'This file is not an image',
              );
            },
          );
        } else {
          _mobX.isLoading(false);

          Fluttertoast.showToast(
            msg: 'This file is not an image',
          );
        }
      },
      onError: (err) {
        _mobX.isLoading(false);

        Fluttertoast.showToast(
          msg: err.toString(),
        );
      },
    );
  }

  void _handleUpdateData() {
    _focusNodeNickname.unfocus();
    _focusNodeAboutMe.unfocus();

    _mobX.isLoading(true);

    _firestore.collection('users').document(_id).updateData(
      {
        'nickname': _mobX.nicknameGet,
        'aboutMe': _mobX.aboutMeGet,
        'photoUrl': _mobX.photoUrlGet,
      },
    ).then(
      (data) {
        _mobX.isLoading(false);

        Fluttertoast.showToast(
          msg: "Update Success",
        );
      },
    ).catchError(
      (err) {
        _mobX.isLoading(false);

        Fluttertoast.showToast(
          msg: err.toString(),
        );
      },
    );
  }

  void _newTaskModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            Navigator.pop(context, false);

            return Future.value(false);
          },
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                child: Wrap(
                  children: [
                    ListTile(
                      title: Center(
                        child: const Text('Take A Picture'),
                      ),
                      onTap: () => _getImage(true),
                    ),
                    ListTile(
                      title: const Center(
                        child: Text('Open A Gallery'),
                      ),
                      onTap: () => _getImage(false),
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

  void _initControllerTextEditing() async {
    SharedPreferences.getInstance().then(
      (prefs) {
        setState(() {
          _sharedPrefs = prefs;
        });
        _id = _sharedPrefs.getString('id') ?? '';
        _mobX.nickname(_sharedPrefs.getString('nickname') ?? '');
        _mobX.aboutMe(_sharedPrefs.getString('aboutMe') ?? '');
        _mobX.photoUrl(_sharedPrefs.getString('photoUrl') ?? '');
      },
    ).then(
      (value) => {
        _document = _firestore.collection('users').document(_id),
        _document.get().then(
          (document) {
            if (document.exists) {
              _mobX.nickname(document['nickname']);
              _mobX.aboutMe(document['aboutMe']);
              _mobX.photoUrl(document['photoUrl']);
            }
          },
        ).then((value) => {
              _controllerNickname =
                  TextEditingController(text: _mobX.nicknameGet),
              _controllerAboutMe =
                  TextEditingController(text: _mobX.aboutMeGet),
            }),
      },
    );
  }
}
