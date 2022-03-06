import 'package:dawak_3lyna/modules/on_boarding/on_boarding_screen.dart';
import 'package:dawak_3lyna/shared/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Bloc.observer = MyBlocObserver();
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
<<<<<<< HEAD
      theme:lightTheme,
      home: const OnBoardingScreen(),
=======
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home:  const OnBoardingScreen(),
>>>>>>> eb4509c5888b3086af05fa999ff46856e29b4714
    );
  }
}
