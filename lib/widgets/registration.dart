import 'package:flutter/material.dart';
import '../services/authorization.dart';
import '../widgets/loading.dart';
import './malefemalelist.dart';
import '../widgets/form.dart';
import '../pages/home.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //Firebase authorization service
  final AuthService _auth = AuthService();

  //global key for Register Key
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fName = '';
  String lName = '';
  String regNo = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(left: 5, bottom: 20),
                              child: TextFormField(
                                onChanged: (val) => setState(() => fName = val),
                                validator: (val) => val!.isEmpty
                                    ? 'Enter your First Name'
                                    : null,
                                decoration:
                                    InputDecoration(labelText: 'First Name:'),
                              ),
                            ),
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(left: 5, bottom: 20),
                              child: TextFormField(
                                onChanged: (val) => setState(() => lName = val),
                                validator: (val) => val!.isEmpty
                                    ? 'Enter your last Name'
                                    : null,
                                decoration:
                                    InputDecoration(labelText: 'Last Name:'),
                              ),
                            ),
                            Container(
                                width: 300,
                                padding: EdgeInsets.only(left: 5, bottom: 20),
                                child: TextFormField(
                                    onChanged: (val) =>
                                        setState(() => regNo = val),
                                    validator: (val) => val!.isEmpty
                                        ? 'Enter your Registration Number'
                                        : null,
                                    decoration: InputDecoration(
                                        labelText: 'Registration No:'))),
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(left: 5, bottom: 20),
                              child: TextFormField(
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter your Email' : null,
                                onChanged: (val) => setState(() => email = val),
                                decoration:
                                    InputDecoration(labelText: 'Email:'),
                              ),
                            ),
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(left: 5, bottom: 20),
                              child: TextFormField(
                                validator: (val) => val!.length < 6
                                    ? 'Password should be more than 6 characters long'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => password = val),
                                decoration:
                                    InputDecoration(labelText: 'Password:'),
                                obscureText: true,
                              ),
                            ),
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(left: 5, bottom: 20),
                              child: TextFormField(
                                validator: (val) => val != password
                                    ? 'Passwords should match'
                                    : null,
                                decoration: InputDecoration(
                                    labelText: 'Confirm Password:'),
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //     width: 300,
                    //     padding: EdgeInsets.only(left: 5, bottom: 10),
                    //     child: Text('Gender')),
                    // Gender(),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: RaisedButton(
                        color: Colors.blue[600],
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            print(fName);
                            print(lName);
                            print(email);
                            print(password);
                            print(regNo);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = 'Please enter a valid email';
                                loading = false;
                              });
                            } else {
                              print('$fName $email Registered Successfully!');
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => userHomePage()));
                            }
                            error = '';
                          }
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
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
