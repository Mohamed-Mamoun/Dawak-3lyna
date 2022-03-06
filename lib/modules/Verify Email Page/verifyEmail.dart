import 'dart:async';
import 'package:dawak_3lyna/modules/doner/doner_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/modules/Patient/Botom%20nav%20bar/bottomNav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canresent = false;
  Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser.emailVerified;

    if (!isEmailVerified) {
      sendVerification();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailverified(),
      );
    }
  }

  @override
  void dispose() {
    if (isEmailVerified = true) timer?.cancel();
    super.dispose();
  }

  Future sendVerification() async {
    await FirebaseAuth.instance.currentUser.sendEmailVerification();
    setState(() {
      canresent = false;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      canresent = true;
    });
  }

  Future checkEmailverified() async {
    await FirebaseAuth.instance.currentUser.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? DonerScreen()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Verify Email'),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 250, horizontal: 11),
            child: Column(
              children: [
                const Text(
                  'A verification email has been sent to your email',
                  style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultButton(
                    radius: 8,
                    text: 'Resent Email',
                    function: () => canresent ? sendVerification() : null)
              ],
            ),
          ),
        );
}
