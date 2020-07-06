import 'package:flutter/material.dart';
import 'package:locationprojectflutter/core/services/location_service.dart';
import 'package:locationprojectflutter/presentation/pages/sign_in_firebase.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/favorites_places_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/chat_screen_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/custom_map_list_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/home_chat_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/list_map_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/live_chat_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/map_list_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/phone_sms_auth_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/register_email_firebase_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/settings_app_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/settings_chat_provider.dart';
import 'package:locationprojectflutter/presentation/state_management/mobx/sign_in_firebase_provider.dart';
import 'package:provider/provider.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
//import 'package:locationprojectflutter/core/services/service_locator.dart';

void main() {
//  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserLocation>(
          create: (context) => LocationService().locationStream,
        ),
        ChangeNotifierProvider<FavoritesPlacesProvider>(
          create: (context) => FavoritesPlacesProvider(),
        ),
        ChangeNotifierProvider<CustomMapListProvider>(
          create: (context) => CustomMapListProvider(),
        ),
        ChangeNotifierProvider<HomeChatProvider>(
          create: (context) => HomeChatProvider(),
        ),
        ChangeNotifierProvider<ListMapProvider>(
          create: (context) => ListMapProvider(),
        ),
        ChangeNotifierProvider<LiveChatProvider>(
          create: (context) => LiveChatProvider(),
        ),
        ChangeNotifierProvider<MapListProvider>(
          create: (context) => MapListProvider(),
        ),
        ChangeNotifierProvider<PhoneSMSAuthProvider>(
          create: (context) => PhoneSMSAuthProvider(),
        ),
        ChangeNotifierProvider<RegisterEmailFirebaseProvider>(
          create: (context) => RegisterEmailFirebaseProvider(),
        ),
        ChangeNotifierProvider<SettingsAppProvider>(
          create: (context) => SettingsAppProvider(),
        ),
        ChangeNotifierProvider<SettingsChatProvider>(
          create: (context) => SettingsChatProvider(),
        ),
        ChangeNotifierProvider<SignInFirebaseProvider>(
          create: (context) => SignInFirebaseProvider(),
        ),
      ],
      child: MaterialApp(
        home: SignInFirebase(),
      ),
    );
  }
}
