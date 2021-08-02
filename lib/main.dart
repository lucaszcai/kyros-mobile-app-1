import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kyros_app_mobile/screens/ChatScreen.dart';
import 'package:kyros_app_mobile/screens/contact_screen.dart';
import 'package:kyros_app_mobile/screens/assignments_screen.dart';
import 'package:kyros_app_mobile/screens/login_screen.dart';
import 'package:kyros_app_mobile/screens/notifications_screen.dart';
import 'package:kyros_app_mobile/screens/root_screen.dart';
import 'package:kyros_app_mobile/services/auth_service.dart';
import 'package:kyros_app_mobile/util/style_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kyros Mobile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //change appbar title here, or remove the appbar entirely
      // home: MyHomePage(title: 'Kyros Mobile App'),
      home: FutureBuilder(
        future: AuthService().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return RootScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

