import 'package:flutter/material.dart';
import 'package:healty_quizz/themes/theme.dart';

class MakeQuiz extends StatefulWidget {
   static const routeName = '/make-quiz';
  const MakeQuiz({super.key});

  @override
  State<MakeQuiz> createState() => _MakeQuizState();
}

class _MakeQuizState extends State<MakeQuiz> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: Text(
          'Question Setting',
          style: title,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Text(
              "Add Quizizz",
              style: preSubTitles,
            ),
            SizedBox(
              height: 20,
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
                "Create Quizizz",
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
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
                      Icons.add,
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
            SizedBox(
              height: 20,
            ),
            Text(
              "Quizizz List",
              style: preSubTitles.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            //list
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
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Topic : Input Topic 2",
                style: keterangan,
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
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Topic : Input Topic 2",
                style: keterangan,
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
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Topic : Input Topic 2",
                style: keterangan,
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
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Topic : Input Topic 2",
                style: keterangan,
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
                style: preSubTitles.copyWith(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Topic : Input Topic 2",
                style: keterangan,
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