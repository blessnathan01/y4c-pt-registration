import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:users_page/pages/userProfile.dart';
import 'package:users_page/widgets/login.dart';
import '../pages/home.dart';

final dummy = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        home: Login(),
        routes: {'/a': (context) => userHomePage()},
      ),
    );
  }
}
