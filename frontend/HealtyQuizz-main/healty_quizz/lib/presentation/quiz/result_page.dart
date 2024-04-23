import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  final int result;
  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
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
                "Hore !!! Nilai Kamu " + widget.result.toString() ,
                style: GoogleFonts.montserrat(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
