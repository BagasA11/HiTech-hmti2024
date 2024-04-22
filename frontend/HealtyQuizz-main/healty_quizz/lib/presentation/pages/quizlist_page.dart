import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healty_quizz/presentation/pages/user/quiz_user_page.dart';

class QuizList extends StatefulWidget {
  static const routeName = '/quizlist-page';
  const QuizList({super.key});

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  bool _isvisibleQuiz = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2F6C5),
      appBar: AppBar(
        backgroundColor: Color(0xff28DF99),
        centerTitle: true,
        title: Text(
          'Quizizz List',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  child: Image(
                    image: AssetImage("assets/guest.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.8,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 122, 194, 28),
                          radius: 4,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Online",
                          style: GoogleFonts.openSans(
                              fontSize: 11.4,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Quizizz List",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              height: 30,
            ),
            //list
            ListTile(
              tileColor: Color(0xffD2F6C5),
              leading: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, QuizPage.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: Color(0xff00BF63),
            ),
            ListTile(
              tileColor: Color(0xffD2F6C5),
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: Color(0xff00BF63),
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: Color(0xff00BF63),
            ),
            ListTile(
              tileColor: Color(0xffD2F6C5),
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: Color(0xff00BF63),
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: Color(0xff00BF63),
            ),
            ListTile(
              tileColor: Color(0xffD2F6C5),
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: Color(0xff00BF63),
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: Color(0xff00BF63),
            ),
            ListTile(
              tileColor: Color(0xffD2F6C5),
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: Color(0xff00BF63),
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00BF63),
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: Color(0xff00BF63),
            )
          ],
        ),
      )),
    );
  }
}
