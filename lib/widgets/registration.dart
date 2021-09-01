import 'package:flutter/material.dart';
import './malefemalelist.dart';
import '../widgets/form.dart';
import '../pages/home.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/picture1.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'PT REGISTRATION',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Form1(),
              Container(
                  width: 300,
                  padding: EdgeInsets.only(left: 5, bottom: 10),
                  child: Text('Gender')),
              Gender(),
              Container(
                padding: EdgeInsets.all(30),
                child: RaisedButton(
                  color: Colors.blue[600],
                  onPressed: () {
                    Navigator.pushReplacement(context, new MaterialPageRoute(
                        builder: (context) => userHomePage())
                    );
                  },
                  child: Container(
                      width: 200,
                      height: 45,
                      child: Center(
                          child: Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
