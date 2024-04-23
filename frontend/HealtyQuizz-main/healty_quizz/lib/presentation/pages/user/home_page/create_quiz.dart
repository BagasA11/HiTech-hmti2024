import 'package:flutter/material.dart';
import 'package:healty_quizz/themes/theme.dart';

class CreateQuiz extends StatelessWidget {
  const CreateQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return isUser(screenWidth);
  }

  Widget isAdmin(screenWidth) {
    return const Center(
      child: Text("Admin"),
    );
  }

  Widget isUser(screenWidth) {
    return Container(
      width: screenWidth.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: screenWidth.width * 0.5,
                  child: Image.asset('assets/no_admin_make_quiz.png')),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: screenWidth.width * 0.8,
            child: Text(
              "kamu kayaknya bukan admin deh, daftar dulu yuk biar bisa bikin kuis. Kembali ke halaman utama dan lakukan pendaftaran menjadi admin",
              style: TextStyle(
                  fontSize: 16, color: greyColor, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
                
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: whiteColor,
          //     ),
          //     child: Text(
          //       "Daftar Sekarang",
          //       style: TextStyle(
          //           color: primaryColor,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16),
          //     ))
        ],
      ),
    );
  }
}
