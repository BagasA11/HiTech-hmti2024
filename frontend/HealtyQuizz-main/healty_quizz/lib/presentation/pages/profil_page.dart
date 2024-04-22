import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/themes/theme.dart';

class ProfilPage extends StatelessWidget {
  static const routeName = '/profil-screen';
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            image: const DecorationImage(
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
                          "Username",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: blackColor),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Text(
                          "email@gmail.com",
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
                      color: accentColor,
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
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        const ProfileDetailInfo(
                          cat: 'Password',
                          value: '',
                        ),
                        const ProfileDetailInfo(
                          cat: 'Language',
                          value: '',
                          noValue: true,
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
                      color: accentColor,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        ProfileDetailInfo(
                          cat: 'About App',
                          value: '',
                        ),
                        ProfileDetailInfo(
                          cat: 'Terms',
                          value: '',
                        ),
                        ProfileDetailInfo(
                          cat: 'Privacy Policy',
                          value: '',
                        ),
                        ProfileDetailInfo(
                          cat: 'Share This App',
                          value: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailInfo extends StatelessWidget {
  const ProfileDetailInfo(
      {super.key, required this.cat, required this.value, this.noValue});
  final String cat;
  final String value;
  final bool? noValue;
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
              onPressed: () {},
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
