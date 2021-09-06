import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/authorization.dart';
import '../widgets/loading.dart';
import '../pages/home.dart';
import '../pages/admin_challenges.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future LoginMySql(BuildContext context) async {
    // var url = "http://45.56.115.113/registration/api/pt/checkLogin";
    try {
      Response response = await post(
          Uri.parse('http://45.56.115.113/registration/api/pt/checkLogin'),
          body: {
            "reg_no": regno.toString(),
            "password": password,
          });

      data = jsonDecode(response.body);
      print(data);

      if (data['status'] == 'success') {
        setState(() {
          loading = false;
          accepted = false;
        });

        username = data['student_details']['first_name'] +
            ' ' +
            data['student_details']['last_name'];

        showSimpleNotification(
            Text(
              'You have successfully logged in as $username',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            background: Colors.blue[600]);

        Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => userHomePage()));
      } else {
        setState(() {
          accepted = true;
          loading = false;
          error = 'Enter correct Reg No & password';
        });
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        loading = false;
        error = 'Enter correct Reg No & password';
      });
    }
  }

  final AuthService _auth = AuthService();
  //global key for Register Key
  final _formKey = GlobalKey<FormState>();
  String regno = '';
  String password = '';
  bool loading = false;
  String error = '';
  bool accepted = false;
  var username = '';
  var data;

  bool admin = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
                padding: EdgeInsets.only(top: 50),
                height: 600,
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                              child: Image.asset(
                            'assets/picture1.png',
                            width: 150,
                            height: 150,
                          )),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'PT LOG IN',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty || val.length < 11
                                            ? 'Enter your Reg.No'
                                            : null,
                                    onChanged: (val) =>
                                        setState(() => regno = val),
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Registration No:'),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.only(top: 20, bottom: 60),
                                  child: TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty ? '*Password' : null,
                                    onChanged: (val) =>
                                        setState(() => password = val),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Password: '),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          FlatButton(
                            color: Colors.blue[600],
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                print(regno);
                                print(password);
                                accepted = false;
                              } else {
                                accepted = true;
                              }

                              if (accepted) {
                                setState(() {
                                  error = 'Enter correct Reg No & Password';
                                  loading = false;
                                });
                              } else {
                                LoginMySql(context);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 120),
                              child: Text('LOG IN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w900)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          )
                          // Container(
                          //   padding: EdgeInsets.only(
                          //     left: 120,
                          //     top: 20,
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       Text('Not a member?'),
                          //       FlatButton(
                          //         onPressed: () {},
                          //         child: Container(
                          //           padding: EdgeInsets.symmetric(horizontal: 0),
                          //           child: Text(
                          //             'Create Account',
                          //             style: TextStyle(fontWeight: FontWeight.bold),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.only(left: 170, top: 90),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //         Icons.copyright_outlined,
                          //         size: 20,
                          //       ),
                          //       Text(
                          //         '2021',
                          //         style: TextStyle(fontWeight: FontWeight.bold),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ]),
                  ),
                )),
          );
  }
}
