import 'package:flutter/material.dart';
import '../services/authorization.dart';
import '../widgets/registration.dart';
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
      home: Scaffold(body: Login()),
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
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130.0),
              child: AppBar(
                backgroundColor: Colors.blue[600],
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 0.0),
                          child: Text(
                            'Y4C PT',
                            style: TextStyle(
                                fontSize: 36.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        PopupMenuButton(
                          offset: Offset(0, 40),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                            PopupMenuItem(
                                height: 20,
                                value: Text('List 1'),
                                child: TextButton(
                                    onPressed: () async {
                                      await _auth.signOut();
                                      Navigator.of(context).pushReplacement(
                                          new MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    child: Text('Log Out'))),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorWeight: 5.0,
                  indicatorPadding: EdgeInsets.all(0.0),
                  tabs: [
                    Tab(
                        child: Text('Health',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.0))),
                    Tab(
                        child: Text('Education',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.0))),
                    Tab(
                        child: Text('Children',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.0))),
                    Tab(
                        child: Text('Youth',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.0))),
                    Tab(
                        child: Text('Women',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.0))),
                  ],
                ),
              ),
            ),
            body: TabBarView(
                children: List<Widget>.generate(
                    challenges.length,
                    (index) =>
                        new UserChallenge(Achallange: challenges[index])))));
  }
}
