import 'package:http/http.dart';
import 'dart:convert';

class AppUser {
  String? Uid;
  String? Fname;
  String? Lname;
  String? Uname;
  String? email;

  AppUser(
      {required this.Uid,
      required this.Fname,
      required this.Lname,
      required this.email,
      required this.Uname});
}

// trying to fetch data from the API
// getUserData() async {
//   Response response =
//       await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//   Map data = jsonDecode(response.body);
//   List<dynamic> userList = [];
//   data.entries.forEach((e) => userList.add(Users(
//       Uid: data['id'],
//       Fname: data['name'],
//       Lname: data['username'],
//       email: data['email'],
//       Uname: data['username'])));
//   return userList;
// }
// List<dynamic> users = getUserData() as List;

List<AppUser> users = [
  AppUser(
      Uid: '1',
      Fname: 'Godson',
      Lname: 'Ezekiel',
      email: 'godson@y4c.com',
      Uname: 'gezekiel'),
  AppUser(
      Uid: '2',
      Fname: 'Lisa',
      Lname: 'Jocktan',
      email: 'lisa@y4c.com',
      Uname: 'ljocktan'),
  AppUser(
      Uid: '3',
      Fname: 'Tony',
      Lname: 'Rite',
      email: 'tony@y4c.com',
      Uname: 'trite'),
  AppUser(
      Uid: '4',
      Fname: 'Eliza',
      Lname: 'Rweikiza',
      email: 'eliza@y4c.com',
      Uname: 'Erweikiza'),
  AppUser(
      Uid: '5',
      Fname: 'Harun',
      Lname: 'Kimaro',
      email: 'harun@y4c.com',
      Uname: 'Hkimaro'),
  AppUser(
      Uid: '6',
      Fname: 'Imani',
      Lname: 'Majenda',
      email: 'imani@y4c.com',
      Uname: 'Imajenda')
];
