import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/themes/theme.dart';

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
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text(
          "Welcome",
          style: title,
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
            style:
                title.copyWith(color: blackColor, fontWeight: FontWeight.bold),
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
              style: subHeading.copyWith(color: blackColor),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
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
            style: preSubTitles,
          ),
        ),
      ),
    );
  }
}
