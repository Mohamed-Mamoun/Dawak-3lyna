import 'package:dawak_3lyna/layout/Dashboard.dart';
import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/modules/on_boarding/on_boarding_screen.dart';
import 'package:dawak_3lyna/shared/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeCubit(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dawak 3lyna',
            theme: lightTheme,
            home: const MainPageScreen(),
          );
        },
      ),
    );
  }
}
