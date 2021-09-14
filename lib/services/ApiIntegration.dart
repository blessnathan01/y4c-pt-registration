import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:users_page/services/challenges.dart';
import 'package:users_page/services/users.dart';

class Api {
  Map data = {};
  var _USERS_URL = 'http://45.56.115.113/registration/api/pt/allStudent';
  var _CHALLENGES_URL = 'http://45.56.115.113/registration/api/pt/allChallenge';
  static List<AppUser> users = [];
  static String applicants = "0";
  Map adminInfo = {'reg_no': '2012-02-03456', 'password': 'MUSA'};

  Future getAllUsers() async {
    try {
      Response response = await post(Uri.parse(_USERS_URL), body: adminInfo);
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

  Future getChallenges() async {
    //Fetch challenges
    try {
      Response result = await post(Uri.parse(_CHALLENGES_URL));
      Map data = jsonDecode(result.body);
      if (data['success'] == 'Success') {
        List challengeData = data['challenges'];
        challenges = [];
        challengeData.forEach((element) {
          challenges.add(Challenges(
              challengeCategory: element['category'],
              image: element['images'],
              challengeDescription: element['description'],
              challengeName: element['name'],
              id: element['id']));
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
