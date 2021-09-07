import 'package:flutter/material.dart';
import 'package:users_page/services/users.dart';
import '../services/authorization.dart';
import '../widgets/loading.dart';
import '../pages/home.dart';
import '../pages/admin_challenges.dart';
import 'package:overlay_support/overlay_support.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  //global key for Register Key
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool loading = false;
  String error = '';

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
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter your Email'
                                        : null,
                                    onChanged: (val) =>
                                        setState(() => email = val),
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Email '),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.only(top: 20, bottom: 60),
                                  child: TextFormField(
                                    validator: (val) => val!.length < 6
                                        ? 'Password should be more than 6 characters long'
                                        : null,
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
                                dynamic api = await getUserData();
                                print(api);
                                if (email.trim() == 'admin@y4c.com') {
                                  setState(() => admin = true);
                                  Navigator.pushReplacement(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              AdminChallenges()));
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() => loading = true);
                                    print(email);
                                    print(password);
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email.trim(), password.trim());
                                    print(result);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Could not sign in. Please try again';
                                        loading = false;
                                      });
                                    } else {
                                      print('$email Signed In Successfully!');
                                      setState(() => showSimpleNotification(
                                          Text(
                                            'You have successfully logged in as $email',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          background: Colors.blue[600]));
                                      Navigator.pushReplacement(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  userHomePage()));
                                                  
                                    }
                                  }
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
                              )),
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
