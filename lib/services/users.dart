import 'package:http/http.dart';
import 'dart:convert';

class AppUser {
  int Uid;
  String Fname;
  String Lname;
  String regNo;
  String email;

  AppUser(
      {required this.Uid,
      required this.Fname,
      required this.Lname,
      required this.email,
      required this.regNo});
}

Map data = {};

// trying to fetch data from the API
getUserData() async {
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
void printer(){
  print(data);
}

List<AppUser> users = [
  AppUser(
      Uid: data['student_details']['application_id'],
      Fname: data['student_details']['first_name'],
      Lname: data['student_details']['last_name'],
      email: data['student_details']['email'],
      regNo: data['student_details']['phone_no']),
  AppUser(
      Uid: data['student_details']['application_id'],
      Fname: data['student_details']['first_name'],
      Lname: data['student_details']['last_name'],
      email: data['student_details']['email'],
      regNo: data['student_details']['phone_no']),
  AppUser(
      Uid: data['student_details']['application_id'],
      Fname: data['student_details']['first_name'],
      Lname: data['student_details']['last_name'],
      email: data['student_details']['email'],
      regNo: data['student_details']['phone_no']),
  AppUser(
      Uid: data['student_details']['application_id'],
      Fname: data['student_details']['first_name'],
      Lname: data['student_details']['last_name'],
      email: data['student_details']['email'],
      regNo: data['student_details']['phone_no']),
  AppUser(
      Uid: data['student_details']['application_id'],
      Fname: data['student_details']['first_name'],
      Lname: data['student_details']['last_name'],
      email: data['student_details']['email'],
      regNo: data['student_details']['phone_no']),
  AppUser(
      Uid: data['student_details']['application_id'],
      Fname: data['student_details']['first_name'],
      Lname: data['student_details']['last_name'],
      email: data['student_details']['email'],
      regNo: data['student_details']['phone_no'])
];
