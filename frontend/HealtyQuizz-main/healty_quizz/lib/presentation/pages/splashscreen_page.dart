import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/login_page.dart';
import 'package:healty_quizz/presentation/pages/register_page.dart';
import 'package:healty_quizz/themes/theme.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: whiteColor,
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        //   title: Text(
        //     "Quizz App",
        //     style: GoogleFonts.poppins(
        //       fontSize: 20,
        //       color: Colors.white,
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: Container(
            width: screenWidth.width,
            child: Flex(
              // mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.vertical,
              children: [
                Spacer(
                  flex: 1,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/splashscreen.png',
                    height: screenWidth.height * 50 / 100,
                    width: screenWidth.width * 80 / 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                SizedBox(
                  width: screenWidth.width * 80 / 100,
                  child: Text(
                    "Quiz App",
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 20),
                  width: screenWidth.width * 80 / 100,
                  child: Text(
                    "Temukan keasyikan dalam petualangan belajar dengan aplikasi quiz kami. Mulailah hari ini dan uji pengetahuanmu bersama!",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: greyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(
                    //     context, RegisterPage.routeName);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth.width * 20 / 100)),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ));
  }
}
