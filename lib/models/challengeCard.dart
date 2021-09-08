import 'package:flutter/material.dart';
import '../services/challenges.dart';

class challengeCard extends StatelessWidget {
  late Challenges challenge;

  challengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/download.jpeg'),
                  radius: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      challenge.challengeName,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      challenge.challengeName,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              challenge.challengeDescription,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(
              height: 8,
            ),
            Text('${challenges.length.toString()} Participants'),
            TextButton(
              onPressed: null,
              child: Text('Join Challenge'),
            )
          ]),
        ));
  }
}
