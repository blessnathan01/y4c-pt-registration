import 'package:flutter/material.dart';

class Challenges {
  String challengeCategory;
  String challengeName;
  String challengeDescription;
  String info;
  int id;
  Challenges(
      {required this.challengeCategory,
      required this.info,
      required this.challengeDescription,
      required this.challengeName,
      required this.id});
}

List<Challenges> challenges = [];
