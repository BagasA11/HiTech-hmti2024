import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
