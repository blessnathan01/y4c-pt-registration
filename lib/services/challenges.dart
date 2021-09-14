import 'package:flutter/material.dart';

class Challenges {
  String challengeCategory;
  String challengeName;
  String challengeDescription;
  String image;
  String id;
  Challenges(
      {required this.challengeCategory,
      required this.image,
      required this.challengeDescription,
      required this.challengeName,
      required this.id});
}

String dummyDescription =
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
    'sed diamnonumy eirmod tempor invidunt ut labore et dolore '
    'magna aliquyamerat, sed diam voluptua. At vero eos et accusam'
    'sed diamnonumy eirmod tempor invidunt ut labore et dolore '
    'magna aliquyamerat, sed diam voluptua. At vero eos et accusam'
    'sed diamnonumy eirmod tempor invidunt ut labore et dolore '
    'magna aliquyamerat, sed diam voluptua. At vero eos et accusam'
    'sed diamnonumy eirmod tempor invidunt ut labore et dolore ';

List<Challenges> challenges = [
  Challenges(
      challengeName: 'Lack of proper nutrition',
      challengeCategory: 'Health',
      challengeDescription: dummyDescription,
      image: 'health.jpeg',
      id: '1'),
  Challenges(
      challengeDescription: dummyDescription,
      challengeCategory: 'Education',
      challengeName: 'Poor Life Skills',
      image: 'education.jpeg',
      id: '2'),
  Challenges(
      challengeName: "Drug Abuse",
      challengeCategory: 'Youth',
      challengeDescription: dummyDescription,
      image: 'youth.jpeg',
      id: '3'),
  Challenges(
      challengeDescription: dummyDescription,
      challengeCategory: 'Children',
      challengeName: 'High rate of DropOuts',
      image: 'children.jpeg',
      id: '4'),
  Challenges(
      challengeDescription: dummyDescription,
      challengeCategory: "Women",
      challengeName: 'Pregnant women lack ANC',
      image: 'women.jpeg',
      id: '5')
];
