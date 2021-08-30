import 'package:flutter/material.dart';


SingingCharacter? _character = SingingCharacter.male;

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

enum SingingCharacter { male, female }

class _GenderState extends State<Gender> {
  var dropdownvalue = 'CS';
  var dropdownvalue2 = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.only(bottom: 3, left: 5),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                width: 150,
                padding: EdgeInsets.all(0),
                child: ListTile(
                  title: const Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  leading: Radio<SingingCharacter>(
                      groupValue: _character,
                      value: SingingCharacter.male,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      }),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: ListTile(
                  title: Text(
                    'Female',
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: Radio<SingingCharacter>(
                      groupValue: _character,
                      value: SingingCharacter.female,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      }),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: 55,
            ),
            child: Row(
              children: [
                Text('Year of Study:'),
                Container(
                  width: 70,
                  child: DropdownButton(
                    value: dropdownvalue2,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 14,
                    elevation: 5,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newvalue1) {
                      setState(() {
                        dropdownvalue2 = newvalue1!;
                      });
                    },
                    items: <String>['1', '2', '3', '4']
                        .map<DropdownMenuItem<String>>((String value1) {
                      return DropdownMenuItem<String>(
                          value: value1,
                          child: Container(
                              padding: EdgeInsets.only(left: 20, right: 15),
                              child: Text(value1)));
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 55,
            ),
            child: Row(
              children: [
                Text('Programme:'),
                Container(
                  width: 100,
                  padding: EdgeInsets.only(left: 10),
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    ),
                    iconSize: 14,
                    elevation: 15,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newvalue2) {
                      setState(() {
                        dropdownvalue = newvalue2!;
                      });
                    },
                    items: <String>[
                      'CS',
                      'CEIT',
                      'BIT',
                      'ETE',
                      'TELECOM',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(),
                            ),
                          ));
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
