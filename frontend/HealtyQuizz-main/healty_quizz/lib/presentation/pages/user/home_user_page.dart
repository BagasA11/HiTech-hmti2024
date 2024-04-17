import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/user/leaderboard_user_page.dart';
import 'package:healty_quizz/presentation/pages/profil_page.dart';
import 'package:healty_quizz/presentation/pages/quizlist_page.dart';

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

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffD2F6C5),
      appBar: AppBar(
        backgroundColor: Color(0xff28DF99),
        title: Text(
          "Welcome",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 30, left: 40, top: 20),
          child: ListView(
            children: [
              Container(
                height: screenWidth.height / 3.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff00BF63)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 30, right: 25, left: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/guest.png"),
                                  radius: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Username",
                                          style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.8,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, ProfilPage.routeName);
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Color.fromARGB(
                                                255, 250, 250, 250),
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Email",
                                      style: GoogleFonts.openSans(
                                          fontSize: 11.4,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/logo.png",
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    togleVisibility();
                                  },
                                  child: Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xffA6A6A6),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        _isvisibleSaldo ? '' : "Rp. 10000",
                                        style: GoogleFonts.openSans(
                                            fontSize: 11.4,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffA6A6A6),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "Member",
                                      style: GoogleFonts.openSans(
                                          fontSize: 11.4, color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 40,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xffA6A6A6),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xff00BF63),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Show All",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                padding: EdgeInsets.symmetric(horizontal: 20),
                childAspectRatio: 4 / 2,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LeaderboardPage.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      color: Color(0xffF6F7D4),
                      child: Column(
                        children: [
                          Icon(
                            Icons.leaderboard,
                            size: 30,
                            color: Color(0xff00BF63),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Leaderboard",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, QuizList.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      color: Color(0xffF6F7D4),
                      child: Column(
                        children: [
                          Icon(
                            Icons.chat,
                            size: 30,
                            color: Color(0xff00BF63),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Quiz",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      color: Color(0xffF6F7D4),
                      child: Column(
                        children: [
                          Icon(
                            Icons.money,
                            size: 30,
                            color: Color(0xff00BF63),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Top up",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      color: Color(0xffF6F7D4),
                      child: Column(
                        children: [
                          Icon(
                            Icons.money,
                            size: 30,
                            color: Color(0xff00BF63),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Purchase Quiz",
                            style: GoogleFonts.poppins(
                                fontSize: 10, fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Member",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                     
                    },
                    child: Text(
                      "Show All",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {},
                tileColor: Color(0xff00BF63),
                leading: CircleAvatar(
                  child: Image.asset("assets/guest.png"),
                ),
                title: Text(
                  "Username1",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "Email",
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                onTap: () {},
                tileColor: Color(0xff00BF63),
                leading: CircleAvatar(
                  child: Image.asset("assets/guest.png"),
                ),
                title: Text(
                  "Username2",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "Email",
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
