import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/page_sign_in_firebase.dart';
import 'data/models/model_stream_location/user_location.dart';
import 'core/services/location_service.dart';
// import 'core/services/service_locator.dart';

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
