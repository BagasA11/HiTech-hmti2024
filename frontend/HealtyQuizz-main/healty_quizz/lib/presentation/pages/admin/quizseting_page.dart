import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSeting extends StatefulWidget {
  static const routeName = '/quizseting-page';
  const QuizSeting({super.key});

  @override
  State<QuizSeting> createState() => _QuizSetingState();
}

class _QuizSetingState extends State<QuizSeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD2F6C5),
      appBar: AppBar(
        backgroundColor: Color(0xff28DF99),
        centerTitle: true,
        title: Text(
          'Question Setting',
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
            Text(
              "Add Quizizz",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              height: 20,
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
                "Create Quizizz",
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
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
                      Icons.add,
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
            SizedBox(
              height: 20,
            ),
            Text(
              "Quizizz List",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            //list
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
              subtitle: Text(
                "Topic : Input Topic 2",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
              subtitle: Text(
                "Topic : Input Topic 2",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
              subtitle: Text(
                "Topic : Input Topic 2",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
              subtitle: Text(
                "Topic : Input Topic 2",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
              subtitle: Text(
                "Topic : Input Topic 2",
                style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
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
