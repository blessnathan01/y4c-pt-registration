import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:users_page/services/users.dart';

class Api {
  Map data = {};
  static List<AppUser> users = [];
  static String applicants = "0";

// trying to fetch data from the API
  Future getUserData() async {
    Map logInInfo = {'reg_no': '2019-08-09878', 'password': 'USER'};

    try {
      Response response = await post(
        Uri.parse('http://45.56.115.113/registration/api/pt/checkLogin'),
        body: logInInfo,
      );
      Map data = jsonDecode(response.body);
      if (data != null) {
        AppUser user = AppUser(
            Uid: data['student_details']['application_id'],
            Fname: data['student_details']['first_name'],
            Lname: data['student_details']['last_name'],
            email: data['student_details']['email'],
            regNo: data['student_details']['phone_no']);
        print(data['student_details']);
        print(user);
        return user;
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Log in failed');
      print(e);
      return null;
    }
    print(data);
  }

  void printer() {
    print(data);
  }

  Future getAllUsers() async {
    Map adminInfo = {'reg_no': '2012-02-03456', 'password': 'MUSA'};

    try {
      Response response = await post(
          Uri.parse('http://45.56.115.113/registration/api/pt/allStudent'),
          body: adminInfo);
      Map userList = jsonDecode(response.body);
      List userData = userList['students'];
      if (users.isEmpty) {
        userData.forEach((element) {
          users.add(AppUser(
              Uid: element['application_id'],
              Fname: element['first_name'],
              Lname: element['last_name'],
              email: element['email'],
              regNo: element['phone_no']));
          applicants = users.length.toString();
        });
      } else {
        users = [];
        userData.forEach((element) {
          users.add(AppUser(
              Uid: element['application_id'],
              Fname: element['first_name'],
              Lname: element['last_name'],
              email: element['email'],
              regNo: element['phone_no']));
          applicants = users.length.toString();
        });
      }
      print(userData);
      print(users);
    } catch (e) {
      print(e.toString());
    }
  }
}
