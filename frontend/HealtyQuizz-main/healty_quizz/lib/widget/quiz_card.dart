import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/themes/theme.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Image.network("https://picsum.photos/200"),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.1, 0.9],
                colors: [
                  blackColor.withOpacity(0.8),
                  blackColor.withOpacity(0.0),
                  // whiteColor.withOpacity(0.4),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  "lorem ipsum dolor sit amet consectetur adipiscing elit",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
                SizedBox(
                  height: 2,),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.quiz, color: whiteColor, size: 10,),
                        SizedBox(width: 2,),
                        Text(
                          "10 soal",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.timer, color: whiteColor, size: 10,),
                        SizedBox(width: 2,),
                        Text(
                          "10 menit",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
