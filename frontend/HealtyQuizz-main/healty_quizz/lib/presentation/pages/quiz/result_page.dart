import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/user/home_page/main.dart';
import 'package:healty_quizz/presentation/pages/user/home_user_page.dart';
import 'package:http/http.dart' as http;

class ResultPage extends StatefulWidget {
  final String password;
  final String email;
  final String level;
  final String id;
  final String username;
  final int result;
  final String score;
  const ResultPage(
      {super.key,
      required this.result,
      required this.score,
      required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.level});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Future<void> _tambahskor(String score) async {
    String Url =
        "http://192.168.67.214/belajar/HiTech-hmti2024/frontend/HealtyQuizz-main/healty_quizz/lib/data/tambah_score.php";

    final response = await http
        .post(Uri.parse(Url), body: {"id": widget.id, "score": score});

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(
            id: widget.id,
            username: widget.username,
            password: widget.password,
            email: widget.email,
            level: widget.level,
            score: score);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    var score = int.parse(widget.score);
    var jumlah = widget.result + score;
    var jumlahNilai = jumlah.toString();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hore !!! Nilai Kamu " + widget.result.toString(),
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () => _tambahskor(jumlahNilai),
                  child: Text("kembali"))
            ],
          ),
        ),
      ),
    );
  }
}
