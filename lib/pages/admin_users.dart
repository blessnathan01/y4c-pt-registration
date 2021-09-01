import 'package:flutter/material.dart';
import '../widgets/TopBar.dart';
import '../services/users.dart';
import '../services/userCard.dart';

class adminUserPage extends StatelessWidget {

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

            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text(
                    'USERS REPORT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "40",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            )
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Applicants',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500]
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                              "5",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                              )
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Challenges',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500]
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Text(
                    'USERS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 0),
                    child: Column(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: users.length,
                            itemBuilder: (context,index){
                              return userCard(user: users[index]);
                            }
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
