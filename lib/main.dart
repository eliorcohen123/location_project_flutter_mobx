import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locationprojectflutter/core/services/location_service.dart';
import 'package:locationprojectflutter/presentation/pages/page_sign_in_firebase.dart';
import 'package:provider/provider.dart';
import 'package:locationprojectflutter/data/models/model_stream_location/user_location.dart';
//import 'package:locationprojectflutter/core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    //  setupLocator();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserLocation>(
          create: (context) => LocationService().locationStream,
        ),
      ],
      child: MaterialApp(
        home: PageSignInFirebase(),
      ),
    );
  }
}
