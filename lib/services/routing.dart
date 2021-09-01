import 'package:flutter/material.dart';
import '../pages/home.dart';



class Routing{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) =>  Home());
      case '/s':
        return MaterialPageRoute(builder: (context) =>Scaffold(
          body: Center(
            child: Text('Here 1'),
          ),
        ));
      case '/a':
        return MaterialPageRoute(builder: (context) =>  Scaffold(
          body: Center(
            child: Text('Here 2'),
          ),
        ));
      default:
        return _errorRoute();
    }


  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}