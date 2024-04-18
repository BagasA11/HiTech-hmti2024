import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healty_quizz/presentation/pages/user/quiz_user_page.dart';
import 'package:healty_quizz/themes/theme.dart';

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
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: Text(
          'Quizizz List',
          style: title,
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
                      style: text.copyWith(fontWeight: FontWeight.bold),
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
                          style: subText.copyWith(
                              color: blackColor, fontWeight: FontWeight.w400),
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
              style: preSubTitles.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            //list
            ListTile(
              tileColor: primaryColor,
              leading: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: keterangan,
                  ),
                ],
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, QuizPage.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: accentColor,
            ),
            ListTile(
              tileColor: primaryColor,
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: preSubTitles.copyWith(color: blackColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: keterangan,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: accentColor,
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: accentColor,
            ),
            ListTile(
              tileColor: primaryColor,
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: preSubTitles.copyWith(color: blackColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: keterangan,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: accentColor,
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: accentColor,
            ),
            ListTile(
              tileColor: primaryColor,
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: preSubTitles.copyWith(color: blackColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: keterangan,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: accentColor,
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: accentColor,
            ),
            ListTile(
              tileColor: primaryColor,
              leading: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.task,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Quizizz 1",
                style: preSubTitles.copyWith(color: blackColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Topic : Input Topic 2",
                    style: keterangan,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    _isvisibleQuiz ? Icons.lock : Icons.check,
                    size: 15,
                    color: accentColor,
                  )
                ],
              ),
              trailing: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: 40,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 10,
              color: accentColor,
            ),
          ],
        ),
      )),
    );
  }
}
