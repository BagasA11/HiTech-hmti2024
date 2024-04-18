import 'package:flutter/material.dart';
import 'package:healty_quizz/presentation/makequiz_page.dart';
import 'package:healty_quizz/presentation/pages/home_user_page.dart';
import 'package:healty_quizz/presentation/pages/leaderboard_user_page.dart';
import 'package:healty_quizz/presentation/pages/login_page.dart';
import 'package:healty_quizz/presentation/pages/profil_page.dart';
import 'package:healty_quizz/presentation/pages/quizlist_page.dart';
import 'package:healty_quizz/presentation/pages/quizseting_page.dart';

import 'package:healty_quizz/presentation/pages/register_page.dart';
import 'package:healty_quizz/presentation/pages/splashscreen_page.dart';
import 'package:healty_quizz/presentation/pages/quiz_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        RegisterPage.routeName: (context) => RegisterPage(),
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        ProfilPage.routeName: (context) => ProfilPage(),
        LeaderboardPage.routeName: (context) => LeaderboardPage(),
        QuizList.routeName: (context) => QuizList(),
        QuizSeting.routeName: (context) => QuizSeting(),
        QuizPage.routeName: (context) => QuizPage(),
        MakeQuiz.routeName:(context) => MakeQuiz()
      },
    );
  }
}
