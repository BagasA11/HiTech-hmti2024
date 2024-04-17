import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/user/home_user_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _verifypassword = TextEditingController();

  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
    _verifypassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffD2F6C5),
      appBar: AppBar(
        backgroundColor: Color(0xff28DF99),
        title: Text(
          "Login",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth.width,
              height: screenWidth.height / 3,
              child: Image.asset(
                'assets/register_image.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 60,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in to continue",
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 30, left: 30),
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: Color(0xff00BF63),
                      ),
                    ),
                    icon: Image.asset(
                      "assets/username_textfield.png",
                      height: 35,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: Color(0xff00BF63),
                      ),
                    ),
                    icon: Image.asset(
                      "assets/email_textfield.png",
                      height: 35,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: _verifypassword,
                  decoration: InputDecoration(
                    hintText: 'Verify Password',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: Color(0xff00BF63),
                      ),
                    ),
                    icon: Image.asset(
                      "assets/password_textfield.png",
                      height: 35,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              child: Text(
                "LOGIN",
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00BF63),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
