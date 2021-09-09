import 'package:flutter/material.dart';
import 'package:users_page/models/challengeCard.dart';
import 'package:users_page/pages/userProfile.dart';
import '../services/authorization.dart';
import '../widgets/login.dart';
import '../services/challenges.dart';
import '../pages/userChallange.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

class userHomePage extends StatefulWidget {
  const userHomePage({Key? key}) : super(key: key);

  @override
  _userHomePageState createState() => _userHomePageState();
}

class _userHomePageState extends State<userHomePage> {
  //Firebase authorization service
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0), child: userAppBar()),
      body: SingleChildScrollView(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: challenges.length,
            itemBuilder: (context, index) {
              return challengeCard(challenge: challenges[index]);
            }),
      ),
    );
  }

  @override
  void dispose() {
    print("Disposing second route");
    super.dispose();
  }
}

class userAppBar extends StatelessWidget {
  const userAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[600],
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  'Y4C PT',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              PopupMenuButton(
                offset: Offset(-20, 60),
                iconSize: 28,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                      height: 20,
                      value: Text('List 1'),
                      child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => userProfile()));
                          },
                          child: Text('Profile'))),
                  PopupMenuItem(
                      height: 20,
                      value: Text('List 1'),
                      child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).pushAndRemoveUntil(
                                new MaterialPageRoute(
                                    builder: (context) => Login()),
                                (route) => false);
                          },
                          child: Text('Log Out'))),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
