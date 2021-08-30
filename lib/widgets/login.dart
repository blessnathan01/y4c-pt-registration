import 'package:flutter/material.dart';
import 'package:users_page/main.dart';
import 'package:users_page/pages/home.dart';
import 'package:users_page/services/routing.dart';
import 'package:users_page/pages/admin_challenges.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {
  final logInController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    logInController.dispose();
    super.dispose();
  }
  late String userName;
  late String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50),
          height: 600,
          child: SingleChildScrollView(
            child: Center(
              child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: logInController,
                    onFieldSubmitted: (String? value){ userName = value as String;},
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Username: '),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.only(top: 20, bottom: 60),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Password: '),
                  ),
                ),
                FlatButton(
                    color: Colors.blue[600],
                    onPressed: () {
                      if(logInController.text == 'admin'){
                      Navigator.pushReplacement(context, new MaterialPageRoute(
                          builder: (context) => AdminChallenges())
                      );
                      }else if (logInController.text == 'user'){
                        Navigator.pushReplacement(context, new MaterialPageRoute(
                            builder: (context) => userHomePage())
                        );
                      }
                      else{
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => Scaffold(
                              body: Center(
                                child: Text('Error')
                              )
                            ))
                        );
                      }

                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 120),
                      child: Text('LOG IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900)),
                    )),
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


