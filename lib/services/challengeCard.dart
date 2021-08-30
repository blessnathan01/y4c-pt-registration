import 'package:flutter/material.dart';
import 'package:users_page/services/challenges.dart';


class challengeCard extends StatelessWidget {
  late Challenges challenge;

  challengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: (){print('Clicked');},
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15.0,15,20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  challenge.challengeName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  )
                ),

                SizedBox(height: 10),
                Text(
                    'Category: ${challenge.challengeCategory}',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w900
                    )
                ),
                SizedBox(height: 10),
                Text(
                  challenge.challengeDescription,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   IconButton(
                     icon: Icon(Icons.edit),
                   iconSize: 25,
                   color: Colors.blueAccent,
                     splashColor: Colors.blueAccent,
                     onPressed: (){},
                   ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      iconSize: 25,
                      color: Colors.redAccent,
                      splashColor: Colors.redAccent,
                      onPressed: (){},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

