// import 'package:flutter/material.dart';
// import '../services/challenges.dart';

// class UserChallenge extends StatelessWidget {
//   late Challenges Achallange;
//   UserChallenge({required this.Achallange});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//       width: double.infinity,
//       height: double.infinity,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(5, 0, 3, 10),
//                 child: Text(
//                   Achallange.challengeCategory,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//               Container(
//                 child: Image.asset('assets/${Achallange.image}',
//                     fit: BoxFit.cover),
//                 width: double.maxFinite,
//                 height: 180,
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 12, 10, 15),
//                 child: Text(
//                   Achallange.challengeDescription,
//                   style: TextStyle(
//                     fontSize: 14.0,
//                     letterSpacing: .9,
//                   ),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//               Center(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: TextButton(
//                       onPressed: () {},
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                             Colors.orange[500]), //orange
//                       ),
//                       child: Container(
//                         width: 300,
//                         height: 40,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                           child: TextButton(
//                             onPressed: () => showDialog(
//                                 context: context,
//                                 builder: (context) => joinSuccess()),
//                             child: Text(
//                               'JOIN CHALLENGE',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.0),
//                             ),
//                           ),
//                         ),
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class joinSuccess extends StatelessWidget {
//   const joinSuccess({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Successful Joined'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: const <Widget>[
//             Text('Are you sure you want to join this challenge?'),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: const Text('YES'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: const Text('NO'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }
