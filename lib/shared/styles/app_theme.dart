import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  // primarySwatch: myColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: 'Jannah',
      fontSize: 20.0,
      //sfontWeight: FontWeight.bold,
    ),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //backgroundColor: myColor,
      ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: myColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Jannah',
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: myColor,
  //scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    //backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      //statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: myColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.redAccent,
    unselectedItemColor: Colors.grey,
    //backgroundColor: HexColor('333739'),
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Jannah',
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
