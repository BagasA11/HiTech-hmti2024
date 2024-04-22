import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardPage extends StatelessWidget {
  static const routeName = '/leaderboard-screen';
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffD2F6C5),
        appBar: AppBar(
          backgroundColor: Color(0xff28DF99),
          centerTitle: true,
          title: Text(
            'Leaderboard',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.leaderboard,
                          size: 100,
                          color: Color(0xff00BF63),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
              SizedBox(
                height: 10,
              ),
              Leaderboard(
                  width: screenWidth.width / 1.8,
                  width2: screenWidth.width / 3),
            ],
          ),
        )));
  }
}

class Leaderboard extends StatelessWidget {
  final double width;
  final double width2;

  Leaderboard({super.key, required this.width, required this.width2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xff00BF63),
              borderRadius: BorderRadius.circular(30)),
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              "Nama User Leaderboard 1 ",
              style: GoogleFonts.poppins(
                  fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffF6F7D4),
              borderRadius: BorderRadius.circular(30)),
          width: width2,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Score : A+")
                ],
              )),
        )
      ],
    );
  }
}
