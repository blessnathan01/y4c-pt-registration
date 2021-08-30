import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_page/services/users.dart';

class userCard extends StatelessWidget {
 late Users user;

 userCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: (){
          print('Clicked');
          },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.Fname + " " + user.Lname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 2,),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500]
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

