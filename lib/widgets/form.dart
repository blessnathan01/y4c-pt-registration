import 'package:flutter/material.dart';

class Form1 extends StatefulWidget {
  final formkey = GlobalKey<Form1State>();

  @override
  Form1State createState() => Form1State(formkey);
}

class Form1State extends State<Form1> {
  var email1 = TextEditingController();
  var formkey;
  Form1State(formkey);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Container(
            width: 300,
            padding: EdgeInsets.only(left: 5, bottom: 20),
            child: TextFormField(
              controller: email1,
              autovalidateMode: AutovalidateMode.always,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'First Name:'),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.only(left: 5, bottom: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Last Name:'),
            ),
          ),
          Container(
              width: 300,
              padding: EdgeInsets.only(left: 5, bottom: 20),
              child: TextField(
                  decoration: InputDecoration(labelText: 'Registration No:'))),
          Container(
            width: 300,
            padding: EdgeInsets.only(left: 5, bottom: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Email:'),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.only(left: 5, bottom: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Password:'),
              obscureText: true,
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.only(left: 5, bottom: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Confirm Password:'),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}

/*class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
}*/
