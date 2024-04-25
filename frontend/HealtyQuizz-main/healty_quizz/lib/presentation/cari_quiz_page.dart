// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CariQuiz extends StatefulWidget {
  String id;
  String username;
  String score;
  String email;
  String level;
  String password;
  CariQuiz({
    Key? key,
    required this.id,
    required this.username,
    required this.score,
    required this.email,
    required this.level,
    required this.password,
  }) : super(key: key);

  @override
  State<CariQuiz> createState() => _CariQuizState();
}

class _CariQuizState extends State<CariQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
