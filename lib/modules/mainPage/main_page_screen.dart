import 'package:dawak_3lyna/layout/Dashboard.dart';
import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/modules/patient/new_request_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/06/medical-logo.jpg'),
                  radius: 70,
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Text(
                  "${getLang(context, "choses")}",
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  width: 200,
                  function: () async {
                    await FirebaseAuth.instance.signInAnonymously();
                    navigatTo(
                      context,
                      const NewRequest(),
                    );
                  },
                  text: "${getLang(context, "Patient")}",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  width: 200,
                  function: () {
                    navigatTo(
                      context,
                      LoginScreen(),
                    );
                  },
                  text: "${getLang(context, "donation")}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
