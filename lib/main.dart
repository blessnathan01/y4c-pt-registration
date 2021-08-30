import 'package:flutter/material.dart';
import 'package:users_page/pages/userChallange.dart';
import 'package:users_page/pages/health.dart';
import 'package:users_page/pages/education.dart';
import 'package:users_page/pages/children.dart';
import 'package:users_page/pages/youth.dart';
import 'package:users_page/pages/women.dart';
import 'package:users_page/pages/admin_challenges.dart';
import 'package:users_page/pages/admin_users.dart';
import 'package:users_page/services/challenges.dart';
import 'package:users_page/widgets/login.dart';
import 'package:users_page/widgets/registration.dart';
import 'package:users_page/pages/home.dart';
import 'package:users_page/services/routing.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily:'Raleway'
      ),
      home: Home(),
      routes: {
        '/a': (context) => userHomePage()
      },
    );
  }
}

