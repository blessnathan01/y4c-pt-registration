import 'package:flutter/material.dart';
import '../services/challenges.dart';

class challengeCard extends StatelessWidget {
  late Challenges challenge;

  challengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: () {
          print('Clicked');
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(challenge.challengeName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 10),
                Text('Category: ${challenge.challengeCategory}',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                Text(
                  challenge.challengeDescription,
                  style: TextStyle(fontSize: 13, letterSpacing: .3),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        backgroundImage: AssetImage('assets/user.png'),
                        radius: 20),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Stakeholders',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                            fontWeight: FontWeight.w900))
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
