import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/quiz/model/question_model.dart';
import 'package:healty_quizz/presentation/pages/quiz/result_page.dart';
import 'package:healty_quizz/presentation/pages/quiz/widget/option_widget.dart';

class Test extends StatefulWidget {
  final QuestionModel questionModel;
  final String id;
  final String username;
  final String score;
  final String level;
  final String email;
  final String password;
  const Test(
      {super.key,
      required this.questionModel,
      required this.id,
      required this.username,
      required this.score,
      required this.level,
      required this.email,
      required this.password});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _controller = CountDownController();
  int index = 0;
  int result = 0;
  @override
  Widget build(BuildContext context) {
    int jumlahSoal = widget.questionModel.data.length - 1;
    void navigate(String optionChar) {
      setState(() {
        if (optionChar == (widget.questionModel.data[index].correctOption)) {
          result++;
        }
        index++;
        if (index == (widget.questionModel.data.length - 1)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultPage(
              result: result,
              score: widget.score,
              id: widget.id,
              username: widget.username,
              email: widget.email,
              level: widget.level,
              password: widget.password,
            );
          }));
          print("full ");
          print(widget.questionModel.data.length);
        }
      });
      print(index);
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
                              password: widget.password,
                              email: widget.email,
                              level: widget.level,
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
                      widget.questionModel.data[index].question,
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
                          optionDetail: widget.questionModel.data[index].optionA
                              .toString(),
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
                          optionDetail: widget.questionModel.data[index].optionB
                              .toString(),
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
                          optionDetail: widget.questionModel.data[index].optionC
                              .toString(),
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
                          optionDetail: widget.questionModel.data[index].optionD
                              .toString(),
                          color: Colors.pink),
                    ),
                  ],
                ),
              ))),
    );
  }
}
