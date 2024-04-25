import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healty_quizz/presentation/pages/register_page.dart';
import 'package:healty_quizz/presentation/pages/user/home_user_page.dart';
import 'package:healty_quizz/themes/theme.dart';
import 'package:http/http.dart' as http;

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
  String message = '';
  bool visible = true;

  Future<List> _login() async {
    String Url =
        "http://192.168.67.214/belajar/HiTech-hmti2024/frontend/HealtyQuizz-main/healty_quizz/lib/data/login.php";
    final response = await http.post(Uri.parse(Url),
        body: {"username": _username.text, "password": _password.text});

    var datauser = json.decode(response.body);

    if (response.statusCode == 200) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage(
          id: datauser[0]['id'],
          username: datauser[0]['username'],
          password: datauser[0]['password'],
          email: datauser[0]['email'],
          level: datauser[0]['level'],
          score: datauser[0]['score'],
        );
      }));
    }
    return datauser;
  }

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
                    Text("Login",
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Masuk lagi dan mulai keseruan dengan teman kalian",
                        style: GoogleFonts.poppins().copyWith(
                          color: greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                )),
            // Spacer(
            //   flex: 1,
            // ),
            SizedBox(
              height: 20,
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
                      controller: _password,
                      obscureText: visible,
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
                              visible = !visible;
                            });
                          },
                          icon: Icon(visible
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
                  SizedBox(
                    height: 20,
                  ),
                  // SizedBox(
                  //   height: 40,
                  //   child: TextField(
                  //     controller: _verifypassword,
                  //     decoration: InputDecoration(
                  //       hintText: 'verifikasi password',
                  //       hintStyle: GoogleFonts.poppins(
                  //         fontSize: 12,
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(40),
                  //         borderSide: BorderSide(
                  //           color: primaryColor,
                  //         ),
                  //       ),
                  //       isDense: true,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(40),
                  //         borderSide: BorderSide(
                  //           color: primaryColor,
                  //         ),
                  //       ),
                  //       icon: ClipRRect(
                  //         borderRadius: BorderRadius.circular(40),
                  //         child: Container(
                  //           width: 40,
                  //           height: 40,
                  //           color: primaryColor,
                  //           child: Icon(
                  //             Icons.key,
                  //             color: whiteColor,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, HomePage.routeName);
                _login();
              },
              child: Text(
                "SIGN IN",
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
                  "not registered yet?",
                  style: GoogleFonts.poppins(color: greyColor, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, RegisterPage.routeName);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: Text(
                    "Register",
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
