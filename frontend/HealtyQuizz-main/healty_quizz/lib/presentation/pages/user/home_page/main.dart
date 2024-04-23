// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/profil_page.dart';
import 'package:healty_quizz/presentation/pages/quiz/model/question_model.dart';
import 'package:healty_quizz/presentation/pages/quiz/test_page.dart';
import 'package:healty_quizz/presentation/pages/splashscreen_page.dart';
import 'package:healty_quizz/themes/theme.dart';
import 'package:healty_quizz/widget/quiz_card.dart';
import 'package:http/http.dart' as http;

class HomeMain extends StatefulWidget {
  String id;
  String username;
  String score;

  HomeMain({
    Key? key,
    required this.id,
    required this.username,
    required this.score,
  }) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  late QuestionModel questionModel;

  Future<void> _registeradmin() async {
    String Url =
        "http://192.168.100.11/belajar/HiTech-hmti2024/frontend/HealtyQuizz-main/healty_quizz/lib/data/register_admin.php";
    final response = await http.post(Uri.parse(Url), body: {
      "username": widget.username,
      "id": widget.id,
    });

    if (response.statusCode == 200) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return LoginPage();
      // }));

      print("berhasil update admin");
    }
  }

  void _getAllDataBiologi(String username) async {
    final String Url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=RcjKMKaINZ-dt9TW9nz2vQUxcT5misiR0E9IqXT_qnlXHCTktSglOT_yHTOeDMyBCZw4oDZEHKpXZQdDWUIz61cRvvhccldRm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnK14ioERKJ6foQExf1tpoc--qUW6Y-tC5Y-SpXokcZnoPObxCHdFVsr_KXoE8N0xa7tfMd2IMigE5pMmS0HU2nyQucmmppdS_w&lib=MBhYIpOyECp2ihwhpyqSqK-5ZvmFWs76M";
    try {
      var response = await http.get(Uri.parse(Url));

      questionModel = QuestionModel.fromJson(json.decode(response.body));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Test(
          questionModel: questionModel,
          username: username,
          score: widget.score,
          id: widget.id,
        );
      }));
    } catch (e) {
      print(e.toString());
    }
  }

  void _getAllDataFisika(String username) async {
    final String UrlFisika =
        "https://script.google.com/macros/s/AKfycbzXOh6i9GWvY0DflXhgsLPQ92mGNLnHd0tRcvFyeo3r4zZakE0JdchS2PcSqkUt9er3HQ/exec";
    try {
      var response = await http.get(Uri.parse(UrlFisika));

      questionModel = QuestionModel.fromJson(json.decode(response.body));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Test(
          questionModel: questionModel,
          username: username,
          score: widget.score,
          id: widget.id,
        );
      }));
    } catch (e) {
      print(e.toString());
    }
  }

  Widget CatSection(screenWidth) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12, width: 2)),
        width: screenWidth.width * 0.2,
        // height: screenWidth.height * 0.1,
        child: Text(
          "Populer",
          style: GoogleFonts.poppins().copyWith(
              fontSize: 12, fontWeight: FontWeight.w500, color: blackColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/logo.png'),
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
                        borderRadius: BorderRadius.circular(100),
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
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: screenWidth.width * 0.85,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CatSection(screenWidth),
                        CatSection(screenWidth),
                        CatSection(screenWidth),
                        CatSection(screenWidth),
                        CatSection(screenWidth),
                        CatSection(screenWidth),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  clipBehavior: Clip.antiAlias,
                  child: InnerShadow(
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          blurRadius: 10,
                          offset: Offset(1, 2))
                    ],
                    child: Container(
                        // margin: EdgeInsets.only(top: 20, bottom: 15),
                        width: screenWidth.width * 0.85,
                        height: screenWidth.height * 0.15,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0x9958A399),
                              primaryColor,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset:
                                  Offset(1, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: screenWidth.width * 0.6,
                                    child: Text(
                                      "Daftarkan diri kamu sebagai pembuat kuis",
                                      style: GoogleFonts.poppins().copyWith(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _registeradmin();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      width: screenWidth.width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        "Daftar Sekarang",
                                        style: GoogleFonts.poppins().copyWith(
                                            color: primaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                        // child:
                        // child:
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: screenWidth.width * 0.85,
                  child: Row(
                    children: [
                      Text(
                        "Rekomendasi",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: blackColor),
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
                      QuizCard(
                        onTap: () {
                          _getAllDataBiologi(widget.username);
                        },
                        title: 'Quiz Biologi',
                        description: '5',
                        imageUrl: 'https://picsum.photos/200',
                      ),
                      QuizCard(
                          onTap: () {
                            _getAllDataFisika(widget.username);
                          },
                          imageUrl: "https://picsum.photos/300",
                          title: "Quiz Fisika",
                          description: "10"),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                      // QuizCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
