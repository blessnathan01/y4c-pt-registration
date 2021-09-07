import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:users_page/services/users.dart';
import '../services/authorization.dart';
import '../widgets/loading.dart';
import '../pages/home.dart';
import '../pages/admin_challenges.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Auth login = Auth();

  void logInSuccess() {
    setState(() {
      loading = false;
    });
  }


  void notRegistered() {
    setState(() {
      loading = false;
      error = 'Enter correct Reg No & password';
    });
  }



  void conError() {
    setState(() {
      loading = false;
      error = 'Failed to Log In.Please try again.';
    });

  }

  //global key for Register Key
  final _formKey = GlobalKey<FormState>();
  String regno = '';
  String password = '';
  bool loading = false;
  String error = '';
  var username = '';
  var data;
  var controller = new MaskedTextController(mask: '0000-00-00000');
  bool admin = false;
  bool _isHidden = true;

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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
                                    controller: controller,
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
                                    obscureText: _isHidden,
                                    decoration: InputDecoration(
                                        suffix: IconButton(
                                          icon: Icon(
                                            Icons.visibility,
                                            size: 20,
                                          ),
                                          onPressed: () => setState(() {
                                            _isHidden = !_isHidden;
                                          }),
                                        ),
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
                                login.LoginMySql(context, regno, password,
                                    logInSuccess, notRegistered, conError);
                              } else {
                                setState(() {
                                  loading = false;
                                });
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
