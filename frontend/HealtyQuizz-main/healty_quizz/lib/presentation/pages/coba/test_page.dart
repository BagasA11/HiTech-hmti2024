import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/coba/model/question_model.dart';
import 'package:healty_quizz/presentation/pages/coba/result_page.dart';

class Test extends StatefulWidget {
  final QuestionModel questionModel;
  final String username;
  const Test({super.key, required this.questionModel, required this.username});

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
        if (index == (widget.questionModel.data.length-1)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultPage(
              result: result,
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
                        Text(
                            ' ${index + 1} / ${jumlahSoal.toString()}'),
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
                        duration: 60,
                        text: 'detik',
                        onComplete: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResultPage(
                              result: result,
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

class OptionWidget extends StatelessWidget {
  final String optionChar;
  final String optionDetail;
  final Color color;

  OptionWidget(
      {super.key,
      required this.optionChar,
      required this.optionDetail,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              optionChar,
              style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                optionDetail,
                textAlign: TextAlign.left,
                style:
                    GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
