import 'package:flutter/material.dart';
import '../services/challenges.dart';
import '../models/challengeCard.dart';
import '../widgets/TopBar.dart';

class AdminChallenges extends StatefulWidget {
  const AdminChallenges({Key? key}) : super(key: key);

  @override
  _AdminChallengesState createState() => _AdminChallengesState();
}

class _AdminChallengesState extends State<AdminChallenges> {
  void addchallenge(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'ADD CHALLENGE',
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                    )),
                Container(
                  width: 320,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                ),
                Container(
                  width: 320,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Category'),
                  ),
                ),
                Container(
                  width: 320,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 40),
                  child: RaisedButton(
                      color: Colors.blue[600],
                      onPressed: () {},
                      child: Container(
                          width: 250,
                          height: 50,
                          child: Center(
                              child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: Colors.white),
                          )))),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: TopAppBar()),
        drawer: TopBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(7, 20, 7, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'CHALLENGES',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: challenges.length,
                        itemBuilder: (context, index) {
                          return challengeCard(challenge: challenges[index]);
                        })),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => addchallenge(context),
        ),
      ),
    );
  }
}
