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



// List<AppUser> users = [
//   AppUser(
//       Uid: data['student_details']['application_id'],
//       Fname: data['student_details']['first_name'],
//       Lname: data['student_details']['last_name'],
//       email: data['student_details']['email'],
//       regNo: data['student_details']['phone_no']),
//   AppUser(
//       Uid: data['student_details']['application_id'],
//       Fname: data['student_details']['first_name'],
//       Lname: data['student_details']['last_name'],
//       email: data['student_details']['email'],
//       regNo: data['student_details']['phone_no']),
//   AppUser(
//       Uid: data['student_details']['application_id'],
//       Fname: data['student_details']['first_name'],
//       Lname: data['student_details']['last_name'],
//       email: data['student_details']['email'],
//       regNo: data['student_details']['phone_no']),
//   AppUser(
//       Uid: data['student_details']['application_id'],
//       Fname: data['student_details']['first_name'],
//       Lname: data['student_details']['last_name'],
//       email: data['student_details']['email'],
//       regNo: data['student_details']['phone_no']),
//   AppUser(
//       Uid: data['student_details']['application_id'],
//       Fname: data['student_details']['first_name'],
//       Lname: data['student_details']['last_name'],
//       email: data['student_details']['email'],
//       regNo: data['student_details']['phone_no']),
//   AppUser(
//       Uid: data['student_details']['application_id'],
//       Fname: data['student_details']['first_name'],
//       Lname: data['student_details']['last_name'],
//       email: data['student_details']['email'],
//       regNo: data['student_details']['phone_no'])
// ];
