import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/profil_page.dart';
import 'package:healty_quizz/presentation/pages/quizlist_page.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/create_quiz.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/main.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/profile.dart';
import 'package:healty_quizz/presentation/pages/user/leaderboard_user_page.dart';
import 'package:healty_quizz/presentation/pages/user/quiz_user_page.dart';
import 'package:healty_quizz/themes/theme.dart';
import 'package:healty_quizz/widget/quiz_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isvisibleSaldo = false;

  void togleVisibility() {
    setState(() {
      _isvisibleSaldo = !_isvisibleSaldo;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeMain(),
      CreateQuiz(),
      ProfilePage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Buat Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pustaka',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
