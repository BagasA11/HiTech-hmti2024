// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/profil_page.dart';
import 'package:healty_quizz/presentation/pages/quizlist_page.dart';
import 'package:healty_quizz/presentation/pages/user/create_quiz_admin.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/create_quiz.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/main.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/profile.dart';
import 'package:healty_quizz/presentation/pages/user/leaderboard_user_page.dart';
import 'package:healty_quizz/presentation/pages/user/quiz_user_page.dart';
import 'package:healty_quizz/themes/theme.dart';
import 'package:healty_quizz/widget/quiz_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  String id;
  String username;
  String password;
  String email;
  String level;
  String score;

  HomePage({
    Key? key,
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.level,
    required this.score,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isvisibleSaldo = false;
  var halaman;

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
    if (widget.level == 'member') {
      setState(() {
        halaman = CreateQuiz();
      });
    } else {
      setState(() {
        halaman = CreateQuizAdmin();
      });
    }

    List<Widget> _widgetOptions = <Widget>[
      HomeMain(
        id: widget.id,
        username: widget.username,
        score: widget.score,
        password: widget.password,
        email: widget.email,
        level: widget.level,
      ),
      halaman,
      ProfilePage(
        id: widget.id,
        username: widget.username,
        password: widget.password,
        email: widget.email,
        level: widget.level,
        score: widget.score,
      ),
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
