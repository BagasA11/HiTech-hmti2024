// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:healty_quizz/presentation/pages/quiz/model/question_model.dart';
// import 'package:healty_quizz/presentation/pages/quiz/test_page.dart';
// import 'package:healty_quizz/presentation/pages/quiz/widget/customcardquizz_widget.dart';

// import 'package:healty_quizz/themes/theme.dart';
// import 'package:http/http.dart' as myHttp;

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late QuestionModel questionModel;
//   TextEditingController usernameController = TextEditingController();
//   final String Url =
//       "https://script.googleusercontent.com/macros/echo?user_content_key=RcjKMKaINZ-dt9TW9nz2vQUxcT5misiR0E9IqXT_qnlXHCTktSglOT_yHTOeDMyBCZw4oDZEHKpXZQdDWUIz61cRvvhccldRm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnK14ioERKJ6foQExf1tpoc--qUW6Y-tC5Y-SpXokcZnoPObxCHdFVsr_KXoE8N0xa7tfMd2IMigE5pMmS0HU2nyQucmmppdS_w&lib=MBhYIpOyECp2ihwhpyqSqK-5ZvmFWs76M";

//   final String UrlFisika =
//       "https://script.google.com/macros/s/AKfycbzXOh6i9GWvY0DflXhgsLPQ92mGNLnHd0tRcvFyeo3r4zZakE0JdchS2PcSqkUt9er3HQ/exec";

//   void getAllDataBiologi(String username) async {
//     try {
//       var response = await myHttp.get(Uri.parse(Url));

//       questionModel = QuestionModel.fromJson(json.decode(response.body));
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return Test(
//           questionModel: questionModel,
//           username: username,
//         );
//       }));
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   void getAllDataFisika(String username) async {
//     try {
//       var response = await myHttp.get(Uri.parse(UrlFisika));

//       questionModel = QuestionModel.fromJson(json.decode(response.body));
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return Test(
//           questionModel: questionModel,
//           username: username,
//         );
//       }));
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text(
//                   "Quizz",
//                   style: title,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: usernameController,
//                   decoration: InputDecoration(
//                       hintText: "Masukan username",
//                       fillColor: Colors.white,
//                       filled: true),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomCard(
//                   onTap: () {
//                     getAllDataBiologi(usernameController.text);
//                   },
//                   imageUrl: "assets/logo.png",
//                   title: "Quiz Biologi",
//                   description:
//                       "jawab soal matematika berikut dengan durasi waktu 1 menit",
//                   color: Colors.yellow,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomCard(
//                   onTap: () {
//                     getAllDataFisika(usernameController.text);
//                   },
//                   imageUrl: "assets/register_image.png",
//                   title: "Quiz Fisika",
//                   description:
//                       "jawab soal fisika berikut dengan durasi waktu 1 menit",
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
