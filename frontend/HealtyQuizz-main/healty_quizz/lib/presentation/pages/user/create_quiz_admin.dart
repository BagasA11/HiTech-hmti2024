import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateQuizAdmin extends StatefulWidget {
  const CreateQuizAdmin({super.key});

  @override
  State<CreateQuizAdmin> createState() => _CreateQuizAdminState();
}

class _CreateQuizAdminState extends State<CreateQuizAdmin> {
  TextEditingController question = TextEditingController();
  TextEditingController option_a = TextEditingController();
  TextEditingController option_b = TextEditingController();
  TextEditingController option_c = TextEditingController();
  TextEditingController option_d = TextEditingController();
  TextEditingController answear = TextEditingController();
  TextEditingController correct_option = TextEditingController();

  Future<void> simpan_quizz() async {
    String Url =
        "http://192.168.67.214/belajar/HiTech-hmti2024/frontend/HealtyQuizz-main/healty_quizz/lib/data/tambah_quiz.php";

    try {
      final response = await http.post(Uri.parse(Url), body: {
        "question": question.text,
        "option_a": option_a.text,
        "option_b": option_b.text,
        "option_c": option_c.text,
        "option_d": option_d.text,
        "answear": answear.text,
        "correct_option": correct_option.text
      });
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Input soal quiz berhasil"),
                content: Text("Ayo buat soal sebanyak mungkin"),
              );
            });
      }
    } catch (e) {}
  }

  void dispose() {
    super.dispose();
    question.dispose();
    option_a.dispose();
    option_b.dispose();
    option_c.dispose();
    option_d.dispose();
    answear.dispose();
    correct_option.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: question,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "masukan url api spreedsheet",
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: option_a,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelText: "sebutkan isian dari opsi a",
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: option_b,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelText: "sebutkan isian dari opsi b",
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: option_c,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelText: "sebutkan isian dari opsi c",
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: option_d,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelText: "sebutkan isian dari opsi d",
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: answear,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelText: "sebutkan isian dari jawaban yang benar",
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // TextField(
            //   controller: correct_option,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelText: "sebutkan opsi dari jawaban yang benar",
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // simpan_quizz();
                },
                child: Text('simpan'))
          ],
        ),
      ),
    )));
  }
}
