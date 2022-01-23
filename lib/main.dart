import 'package:dawak_3lyna/modules/Patient/Botom%20nav%20bar/bottomNav.dart';
import 'package:dawak_3lyna/modules/Patient/Home/Patient_Home.dart';
import 'package:dawak_3lyna/modules/Signup/Signup_Screen.dart';
import 'package:dawak_3lyna/modules/doner/doner_screen.dart';
import 'package:dawak_3lyna/modules/login/login_screen.dart';
import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/modules/on_boarding/on_boarding_screen.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dawak 3lyna',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home:  const OnBoardingScreen(),
    );
  }
}

