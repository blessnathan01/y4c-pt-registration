import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import '../pages/home.dart';
final dummy=0;

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
        // debugShowCheckedModeBanner: false,
       theme: ThemeData(fontFamily: 'Raleway'),
        home: Home(),
        routes: {'/a': (context) => userHomePage()},
      ),
    );
  }
}
