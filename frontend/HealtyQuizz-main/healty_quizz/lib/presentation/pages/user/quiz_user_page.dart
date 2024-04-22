import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  static const routeName = '/quiz-page';

  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool touch = false;
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
          child: Column(
        children: [
          Container(
            width: screenWidth.width,
            height: screenWidth.height / 3.5,
            child: Image.asset(
              'assets/register_image.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "PERTANYAAN",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.6),
          ),
          SizedBox(
            height: 30,
          ),
          OpsiJawaban(
            touch: touch,
          ),
          SizedBox(
            height: 10,
          ),
          OpsiJawaban(
            touch: touch,
          ),
          SizedBox(
            height: 10,
          ),
          OpsiJawaban(
            touch: touch,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Next",
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 19.1),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00BF63),
                padding: EdgeInsets.symmetric(horizontal: 50)),
          ),
        ],
      )),
    );
  }
}

class OpsiJawaban extends StatefulWidget {
  bool touch;
  OpsiJawaban({super.key, required this.touch});

  @override
  State<OpsiJawaban> createState() => _OpsiJawabanState();
}

class _OpsiJawabanState extends State<OpsiJawaban> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.touch = !widget.touch;
        });
      },
      child: Container(
        height: 80,
        width: 270,
        decoration: BoxDecoration(
            color: widget.touch ? Colors.amber : Colors.blue,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "JAWABAN 1",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
