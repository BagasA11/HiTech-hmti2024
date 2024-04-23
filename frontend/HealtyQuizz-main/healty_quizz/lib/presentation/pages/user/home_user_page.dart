import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/profil_page.dart';
import 'package:healty_quizz/presentation/pages/quizlist_page.dart';
import 'package:healty_quizz/presentation/pages/user/leaderboard_user_page.dart';
import 'package:healty_quizz/presentation/pages/user/quiz_user_page.dart';
import 'package:healty_quizz/themes/theme.dart';
import 'package:healty_quizz/widget/quiz_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  String username;

  HomePage({super.key, required this.username});

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

  Widget home(context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Container(
      width: screenWidth.width,
      // height: screenWidth.height * 0.2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth.width * 0.85,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hai, ${widget.username}",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Ayo mulai kuis kamu sekarang",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: greyColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfilPage.routeName);
                    },
                    child: SizedBox(
                      width: 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12, width: 2)),
                width: screenWidth.width * 0.85,
                // height: screenWidth.height * 0.1,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Cari kuis',
                      hintStyle: GoogleFonts.poppins().copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: greyColor),
                      prefixIcon: Icon(
                        Icons.search,
                        color: greyColor,
                      ),
                      border: InputBorder.none),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: screenWidth.width * 0.85,
              height: screenWidth.height * 0.15,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: primaryColor,
              ),
              // child:
              // child:
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              width: screenWidth.width * 0.85,
              child: Row(
                children: [
                  Text(
                    "Rekomendasi",
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth.width * 0.85,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                  QuizCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = 1;

    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add_sharp),
              label: 'Buat Kuis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Pustaka',
            ),
          ],
          currentIndex: index,
          selectedItemColor: primaryColor,
          onTap: (int index) {
            if (index == 0) {
              home(context);
            } else if (index == 1) {
              // Navigator.pushNamed(context, LeaderboardUserPage.routeName);
              Container();
            } else if (index == 2) {
              // Navigator.pushNamed(context, ProfilPage.routeName);
            }
          },
        ),
        body: SafeArea(child: home(context)));
  }
}
