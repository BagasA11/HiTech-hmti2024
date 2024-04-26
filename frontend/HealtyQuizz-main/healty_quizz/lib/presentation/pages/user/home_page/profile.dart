import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/login_page.dart';
import 'package:healty_quizz/themes/theme.dart';

class ProfilePage extends StatefulWidget {
  final String id;
  final String username;
  final String password;
  final String email;
  final String level;
  final String score;
  const ProfilePage(
      {super.key,
      required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.level,
      required this.score});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/guest.png")),
                            border: Border.all(
                              color: Colors.black87, // Warna border
                              width: 1.0, // Lebar border
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.username,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          widget.email,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: greyColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: primaryColor,
                      child: Row(
                        children: [
                          Text(
                            "General Settings",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        ProfileDetailInfo(
                          cat: 'Password',
                          value: '',
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Password"),
                                    content: Text(widget.password),
                                  );
                                });
                          },
                        ),
                        ProfileDetailInfo(
                          cat: 'Status',
                          value: '',
                          noValue: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Status"),
                                    content: Text(widget.level),
                                  );
                                });
                          },
                        ),
                        ProfileDetailInfo(
                          cat: 'Score',
                          value: '',
                          noValue: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Score"),
                                    content: Text(widget.score),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: primaryColor,
                      child: Row(
                        children: [
                          Text(
                            "General Settings",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        ProfileDetailInfo(
                          cat: 'About App',
                          value: '',
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("About"),
                                    content: Text(
                                        "Curiousiz adalah sebuah aplikasi yang dibangun dapat memenuhi semua keresahan guru dalam meyelenggarakan ulangan secara online"),
                                  );
                                });
                          },
                        ),
                        ProfileDetailInfo(
                          cat: 'Terms',
                          value: '',
                          onTap: () {},
                        ),
                        ProfileDetailInfo(
                          cat: 'Privacy Policy',
                          value: '',
                          onTap: () {},
                        ),
                        ProfileDetailInfo(
                          cat: 'Share This App',
                          value: '',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}

class ProfileDetailInfo extends StatelessWidget {
  final String cat;
  final String value;
  final bool? noValue;
  final VoidCallback onTap;
  ProfileDetailInfo(
      {super.key,
      required this.cat,
      required this.value,
      this.noValue,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                cat,
                style: TextStyle(color: blackColor, fontSize: 12),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                value,
                style: TextStyle(
                    color: noValue == true ? Colors.grey : Colors.black),
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class QuestionBorderMark extends StatelessWidget {
  const QuestionBorderMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: const Icon(
        size: 13,
        Icons.question_mark_sharp,
      ),
    );
  }
}
