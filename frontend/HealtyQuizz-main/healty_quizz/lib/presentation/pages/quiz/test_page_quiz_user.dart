import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/quiz/result_page.dart';
import 'package:healty_quizz/presentation/pages/quiz/widget/option_widget.dart';

class TestQuizUser extends StatefulWidget {
  final List question;
  final String id;
  final String username;
  final String score;
  final String password;
  final String email;
  final String level;
  TestQuizUser(
      {super.key,
      required this.id,
      required this.username,
      required this.score,
      required this.question,
      required this.password,
      required this.email,
      required this.level});

  @override
  State<TestQuizUser> createState() => _TestQuizUserState();
}

class _TestQuizUserState extends State<TestQuizUser> {
  final _controller = CountDownController();
  int index = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    int jumlahSoal = widget.question.length - 1;
    print(widget.question[0]["answear"]);

    void navigate(String optionChar) {
      setState(() {
        if (optionChar == (widget.question[index]["correct_option"])) {
          result++;
        }
        index++;
        if (index == (widget.question.length - 1)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultPage(
              result: result,
              score: widget.score,
              id: widget.id,
              username: widget.username,
              password: widget.password,
              email: widget.email,
              level: widget.level,
            );
          }));
          print("full ");
        }
      });
      print(index);
      print("nilai mu adalah $result");
    }

    return Scaffold(
      backgroundColor: Colors.purple[400],
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' ${index + 1} / ${jumlahSoal.toString()}'),
                        Text(widget.username)
                      ],
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: CountDownProgressIndicator(
                        valueColor: Colors.red,
                        backgroundColor: Colors.white,
                        controller: _controller,
                        initialPosition: 0,
                        duration: 120,
                        text: 'detik',
                        onComplete: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultPage(
                              result: result,
                              score: widget.score,
                              id: widget.id,
                              username: widget.username,
                              level: widget.level,
                              password: widget.password,
                              email: widget.email,
                            );
                          })).then((value) {
                            setState(() {});
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      widget.question[index]["question"],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        navigate("a");
                      },
                      child: OptionWidget(
                          optionChar: "A",
                          optionDetail:
                              widget.question[index]["option_a"].toString(),
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate("b");
                      },
                      child: OptionWidget(
                          optionChar: "B",
                          optionDetail:
                              widget.question[index]["option_b"].toString(),
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate("c");
                      },
                      child: OptionWidget(
                          optionChar: "C",
                          optionDetail:
                              widget.question[index]["option_c"].toString(),
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate("d");
                      },
                      child: OptionWidget(
                          optionChar: "D",
                          optionDetail:
                              widget.question[index]["option_d"].toString(),
                          color: Colors.pink),
                    ),
                  ],
                ),
              ))),
    );
  }
}
