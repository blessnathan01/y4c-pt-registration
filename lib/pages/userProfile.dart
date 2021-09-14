import 'package:flutter/material.dart';
import 'package:users_page/pages/home.dart';
import 'package:users_page/services/challenges.dart';
import 'package:users_page/widgets/login.dart';

class userProfile extends StatefulWidget {
  const userProfile({Key? key}) : super(key: key);

  @override
  _userProfileState createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  bool checkState = false;
  double progress = 0.0;
  int percent = 0;

  Map<String, bool> requirements = {
    'Requirement 1': false,
    'Requirement 2': false,
    'Requirement 3': false,
    'Requirement 4': false,
    'Requirement 5': false,
  };

  var selected = [];

  getSelected() {
    requirements.forEach((key, value) {
      if (value) {
        selected.add(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: userAppBar(),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage('assets/user.png'),
                              radius: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Challenge Name',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text('Stakeholders',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Dummy DescriptionDummy DescriptionDummy DescriptionDummy DescriptionDummy Description'
                        'Dummy DescriptionDummy DescriptionDummy DescriptionDummy Description'
                        'Dummy DescriptionDummy DescriptionDummy Description',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.blue[50]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Participants',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Noel kapungu',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('TestUser')
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Noel kapungu',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('TestUser')
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Noel kapungu',
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('TestUser')
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              'Progress',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.blue[200],
                                  strokeWidth: 30,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                  value: progress),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              percent.toString() + "%",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Column(children: [
                        Text('Requirements',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 20,
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: requirements.keys.map((String key) {
                            return new CheckboxListTile(
                                title: new Text(key),
                                value: requirements[key],
                                shape: CircleBorder(),
                                activeColor: Colors.blue,
                                checkColor: Colors.white,
                                selectedTileColor: Colors.blue,
                                onChanged: (val) {
                                  setState(() {
                                    if (val == true && progress <= 1) {
                                      progress += 1 / requirements.length;
                                    } else if (val == false) {
                                      progress -= 1 / requirements.length;
                                    }
                                    percent = (progress * 100).round();
                                    requirements[key] = val!;
                                  });
                                });
                          }).toList(),
                        ),
                        //       Container(
                        //         padding: EdgeInsets.all(0),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.stretch,
                        //           children: [
                        //             Card(
                        //                 child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Text('Requirement 1',
                        //                       style: TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.w700)),
                        //                   Checkbox(
                        //                       shape: CircleBorder(),
                        //                       activeColor: Colors.blue,
                        //                       checkColor: Colors.white,
                        //                       fillColor: MaterialStateProperty.all(
                        //                           Colors.blue),
                        //                       value: this.checkState,
                        //                       onChanged: (val) {
                        //                         setState(() {
                        //                           if (progress <= 1) {
                        //                             progress += 1;
                        //                             percent = progress * 100;
                        //                           }
                        //                           this.checkState = val!;
                        //                         });
                        //                       })
                        //                 ],
                        //               ),
                        //             )),
                        //             Card(
                        //                 child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Text('Requirement 2',
                        //                       style: TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.w700)),
                        //                   Checkbox(
                        //                       shape: CircleBorder(),
                        //                       activeColor: Colors.blue,
                        //                       checkColor: Colors.white,
                        //                       fillColor: MaterialStateProperty.all(
                        //                           Colors.blue),
                        //                       value: this.checkState,
                        //                       onChanged: (val) {
                        //                         setState(() {
                        //                           this.checkState = val!;
                        //                         });
                        //                       })
                        //                 ],
                        //               ),
                        //             )),
                        //             Card(
                        //                 child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Text('Requirement 3',
                        //                       style: TextStyle(
                        //                           fontSize: 14,
                        //                           fontWeight: FontWeight.w700)),
                        //                   Checkbox(
                        //                       shape: CircleBorder(),
                        //                       activeColor: Colors.blue,
                        //                       checkColor: Colors.white,
                        //                       fillColor: MaterialStateProperty.all(
                        //                           Colors.blue),
                        //                       value: this.checkState,
                        //                       onChanged: (val) {
                        //                         setState(() {
                        //                           this.checkState = val!;
                        //                         });
                        //                       })
                        //                 ],
                        //               ),
                        //             )),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ])),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red[600]),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'CHANGE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ]))));
  }
}

// class DynamicCheckBox extends StatefulWidget {
//   @override
//   _DynamicCheckBoxState createState() => _DynamicCheckBoxState();
// }

// class _DynamicCheckBoxState extends State<DynamicCheckBox> {
 

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       children: requirements.keys.map((String key) {
//         return new CheckboxListTile(
//             title: new Text(key),
//             value: requirements[key],
//             shape: CircleBorder(),
//             activeColor: Colors.blue,
//             checkColor: Colors.white,
//             selectedTileColor: Colors.blue,
//             onChanged: (val) {
//               setState(() {
//                 requirements[key] = val!;
//               });
//             });
//       }).toList(),
//     );
//   }
// }
