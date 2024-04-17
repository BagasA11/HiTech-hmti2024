import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/user/home_user_page.dart';
import 'package:healty_quizz/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register-page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void dispose() {
    super.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffD2F6C5),
      appBar: AppBar(
        backgroundColor: Color(0xff28DF99),
        title: Text(
          "Register",
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
                  "Already registered?",
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
                    hintText: 'username',
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
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'email',
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
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'password',
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
                "SIGN UP",
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
