import 'package:flutter/material.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        // height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 30, 2, 20),
                child: Text(
                    'EDUCATION CHALLENGE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    )
                ),
              ),
              Container(
                  child: Image.asset('assets/education.jpeg',
                      fit: BoxFit.cover),
                width: double.maxFinite,
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 12, 10, 15),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
                      'sed diamnonumy eirmod tempor invidunt ut labore et dolore '
                      'magna aliquyamerat, sed diam voluptua. At vero eos et accusam'
                      ' et justo duo doloreset ea rebum. Stet clita kasd gubergren, '
                      'no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem'
                      ' ipsum dolor sit amet, consetetur sadipscing elitr, sed diam '
                      'sed diamnonumy eirmod tempor invidunt ut labore et dolore '
                      'magna aliquyamerat, sed diam voluptua. At vero eos et accusam'
                      ' et justo duo doloreset ea rebum. Stet clita kasd gubergren, '
                      'no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem'
                      ' ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ',
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: .9,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextButton(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                  ),
                  child: Container(
                    width: 300,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                          'JOIN CHALLENGE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          )
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
