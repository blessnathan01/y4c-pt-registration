import 'package:flutter/material.dart';
import 'package:users_page/services/challenges.dart';
import 'package:users_page/services/challengeCard.dart';
import 'package:users_page/widgets/TopBar.dart';

class AdminChallenges extends StatefulWidget {
  const AdminChallenges({Key? key}) : super(key: key);

  @override
  _AdminChallengesState createState() => _AdminChallengesState();
}

class _AdminChallengesState extends State<AdminChallenges> {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: TopAppBar()
          ),
          drawer: TopBar(),
          body: SingleChildScrollView(
            child: Container(

              padding: EdgeInsets.fromLTRB(7, 20, 7, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      'CHALLENGES',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),
                    textAlign: TextAlign.center,
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      itemCount: challenges.length,
                        itemBuilder: (context,index){
                        return challengeCard(challenge: challenges[index]);
                        }
                    )
                    ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
