import 'package:flutter/material.dart';
import 'package:users_page/services/ApiIntegration.dart';
import 'package:users_page/services/users.dart';
import 'package:users_page/widgets/login.dart';
import '../pages/admin_challenges.dart';
import '../pages/home.dart';
import '../pages/admin_users.dart';

class TopBar extends StatelessWidget {
  TopBar({
    Key? key,
  }) : super(key: key);
  Api userData = Api();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: ListView(
        children: [
          Container(
            height: 100,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Y4C PT Registration',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Challenges',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            leading:
                Icon(Icons.report_problem_outlined, color: Colors.blueAccent),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => AdminChallenges()));
            },
          ),
          ListTile(
            title: Text(
              'Users',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            leading:
                Icon(Icons.verified_user_outlined, color: Colors.blueAccent),
            onTap: () async {
              // await userData.getAllUsers();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => adminUserPage()));
            },
          ),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            leading: Icon(Icons.logout_outlined, color: Colors.blueAccent),
            onTap: () {
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      )),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blue[600],
        title: Text(
          'Y4C PT',
          style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
        ));
  }
}
