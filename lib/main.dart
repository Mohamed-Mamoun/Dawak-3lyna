import 'package:dawak_3lyna/layout/Dashboard.dart';
import 'package:dawak_3lyna/layout/cubit/cubit.dart';
<<<<<<< HEAD
import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/modules/on_boarding/on_boarding_screen.dart';
=======
import 'package:dawak_3lyna/layout/layout_screen.dart';
import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/shared/bolc_observer.dart';
import 'package:dawak_3lyna/shared/components/constants.dart';
import 'package:dawak_3lyna/shared/network/local/cache_helper.dart';
>>>>>>> 1992d12f4eb0e913c380dbcfec97547afae4032c
import 'package:dawak_3lyna/shared/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Widget widget;

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  print(uId);

  if (uId != null) {
    widget = LayoutScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key key, this.startWidget}) : super(key: key);

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
<<<<<<< HEAD
            home: const MainPageScreen(),
=======
            home: startWidget,
>>>>>>> 1992d12f4eb0e913c380dbcfec97547afae4032c
          );
        },
      ),
    );
  }
}
