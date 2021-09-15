import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:users_page/pages/admin_challenges.dart';
import 'package:users_page/pages/home.dart';
import 'package:users_page/services/ApiIntegration.dart';

class Auth {
  var username = '';
  var data;
  Api api = Api();

  void LoginMySql(BuildContext context, String regNo, String password,
      Function logInSuccess, Function notRegistered, Function conError) async {
    // var url = "http://45.56.115.113/registration/api/pt/checkLogin";
    try {
      Response response = await post(
          Uri.parse('http://45.56.115.113/registration/api/pt/checkLogin'),
          body: {
            "reg_no": regNo,
            "password": password,
          });

      data = jsonDecode(response.body);
      print(data);
      if (data['is_admin'] == 1) {
        await api.getAllUsers();
        await api.getChallenges();
        username = data['first_name'] + ' ' + data['last_name'];
        showSimpleNotification(
            Text(
              'You have successfully logged in as $username',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            background: Colors.blue[600]);
        await Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => AdminChallenges()));
        logInSuccess();
      } else if (data['status'] == 'success') {
        await api.getChallenges();
        username = data['student_details']['first_name'] +
            ' ' +
            data['student_details']['last_name'];
        showSimpleNotification(
            Text(
              'You have successfully logged in as $username',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            background: Colors.blue[600]);
        await Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => userHomePage()));
        logInSuccess();
      } else {
        notRegistered();
      }
    } catch (e) {
      print(e.toString());
      conError();
    }
  }
}
