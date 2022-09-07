import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/layout/layout_screen.dart';
import 'package:dawak_3lyna/modules/Dashboard/cubit/dashboard_cubit.dart';
import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/modules/on_boarding/on_boarding_screen.dart';
import 'package:dawak_3lyna/modules/patient/cubit/upload_cubit.dart';
import 'package:dawak_3lyna/shared/network/local/cache_helper.dart';
import 'package:dawak_3lyna/shared/styles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations/applocal.dart';

//SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //sharedPref = await SharedPreferences.getInstance();
  Widget widget;
  //MyBlocObserver();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  String uId = CacheHelper.getData(key: 'uId');

  // print(uId);

  if (onBoarding != null) {
    if (uId != null)
      widget = LayoutScreen();
    else
      widget = MainPageScreen();
  } else {
    widget = OnBoardingScreen();
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
        BlocProvider(
          create: (BuildContext context) => UploadCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DashboardCubit(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dawak 3lyna',
            theme: lightTheme,
            home: startWidget,
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: const [
              Locale("en", ""),
              Locale("ar", ""),
            ],
            locale: const Locale("ar", ""),
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale locale in supportLang) {
                  if (locale.languageCode == currentLang.languageCode) {
                    // mySharedPreferences.setString("lang",currentLang.languageCode) ;
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
          );
        },
      ),
    );
  }
}
