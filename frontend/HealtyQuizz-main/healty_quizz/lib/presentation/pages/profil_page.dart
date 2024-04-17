import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilPage extends StatelessWidget {
  static const routeName = '/profil-screen';
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2F6C5),
      appBar: AppBar(
        backgroundColor: Color(0xff28DF99),
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
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Email",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xffF6F7D4),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "General Settings",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ProfileDetailInfo(
                    cat: 'Password',
                    value: '',
                  ),
                  const ProfileDetailInfo(
                    cat: 'Language',
                    value: '',
                    noValue: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xffF6F7D4),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "General Settings",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ProfileDetailInfo(
                    cat: 'About App',
                    value: '',
                  ),
                  const ProfileDetailInfo(
                    cat: 'Terms',
                    value: '',
                  ),
                  const ProfileDetailInfo(
                    cat: 'Privacy Policy',
                    value: '',
                  ),
                  const ProfileDetailInfo(
                    cat: 'Share This App',
                    value: '',
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
