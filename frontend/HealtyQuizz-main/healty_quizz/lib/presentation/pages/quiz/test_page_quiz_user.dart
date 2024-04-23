import 'package:flutter/material.dart';

class TestQuizUser extends StatefulWidget {
  final String id;
  final String username;
  final String score;
  TestQuizUser(
      {super.key,
      required this.id,
      required this.username,
      required this.score});

  @override
  State<TestQuizUser> createState() => _TestQuizUserState();
}

class _TestQuizUserState extends State<TestQuizUser> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
