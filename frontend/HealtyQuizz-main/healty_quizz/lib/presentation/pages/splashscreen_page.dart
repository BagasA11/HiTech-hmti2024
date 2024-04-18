import 'package:flutter/material.dart';
import 'package:healty_quizz/presentation/pages/register_page.dart';
import 'package:healty_quizz/themes/theme.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text("Welcome", style: title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: screenWidth.width,
                height: screenWidth.height / 2.5,
                child: Image.asset(
                  'assets/gambar_splash_screen.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 60,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome",
                style: heading.copyWith(color: accentColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text("HealtyQuiz", style: text.copyWith(color: accentColor)),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterPage.routeName);
                },
                child: Text(
                  "Get Started",
                  style: subHeading.copyWith(color: blackColor),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    padding: EdgeInsets.symmetric(horizontal: 50)),
              ),
            ],
          ),
        ));
  }
}
