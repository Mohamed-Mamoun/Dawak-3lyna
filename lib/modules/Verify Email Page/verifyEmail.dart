import 'dart:async';
import 'package:dawak_3lyna/modules/Patient/Botom%20nav%20bar/bottomNav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  var currentUser = FirebaseAuth.instance.currentUser;
  bool isEmailVerified = false;
  Timer timer;

  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = currentUser.emailVerified;

    if (!isEmailVerified) {
      sendVerification();
      var timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailverified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerification() async {
    await currentUser.sendEmailVerification();
  }

  Future checkEmailverified() async {
    await currentUser.reload();
    setState(() {
      isEmailVerified = currentUser.emailVerified;
    });
    if (isEmailVerified) timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? NavBar
        : Scaffold(
            appBar: AppBar(
              title: const Text('Verify Email'),
            ),
          );
  }
}
