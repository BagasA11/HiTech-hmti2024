import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/user/home_user_page.dart';
import 'package:healty_quizz/presentation/pages/login_page.dart';
import 'package:healty_quizz/themes/theme.dart';
import 'package:http/http.dart' as http;

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
  bool visibility = true;

  Future<void> _register() async {
    String Url =
        "http://192.168.67.214/belajar/HiTech-hmti2024/frontend/HealtyQuizz-main/healty_quizz/lib/data/register.php";
    final response = await http.post(Uri.parse(Url), body: {
      "username": _username.text,
      "password": _password.text,
      "email": _email.text
    });

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    }
  }

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
      // appBar: AppBar(
      //   backgroundColor: Color(0xff28DF99),
      //   title: Text(
      //     "Register",
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
        height: screenWidth.height,
        child: Flex(
          direction: Axis.vertical,
          children: [
            // Container(
            //   width: screenWidth.width,
            //   height: screenWidth.height / 3,
            //   child: Image.asset(
            //     'assets/register_image.png',
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
            Spacer(
              flex: 1,
            ),
            Container(
                width: screenWidth.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Register",
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        "Daftarin diri kamu dan bersiap uji wawasan bersama temanmu",
                        style: GoogleFonts.poppins().copyWith(
                          color: greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                )),
            Spacer(
              flex: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _username,
                      decoration: InputDecoration(
                        hintText: 'masukkan nama pengguna',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: primaryColor,
                            child: Icon(
                              Icons.person,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'masukkan email',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: primaryColor,
                            child: Icon(
                              Icons.email,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _password,
                      obscureText: visibility,
                      decoration: InputDecoration(
                        hintText: 'masukkan password',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
                          icon: Icon(visibility
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: primaryColor,
                            child: Icon(
                              Icons.key,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, HomePage.routeName);
                _register();
              },
              child: Text(
                "SIGN UP",
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already registered?",
                  style: GoogleFonts.poppins(color: greyColor, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, LoginPage.routeName);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) {
                      return LoginPage();
                    }));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        color: primaryColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
