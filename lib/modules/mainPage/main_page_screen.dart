import 'package:dawak_3lyna/modules/doner/login/login_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              const Text(
                'Chooes Type',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              defaultButton(
                width: 200,
                function: () {
                  navigatAndFinish(
                    context,
                    LoginScreen(),
                  );
                },
                text: 'patient',
              ),
              const SizedBox(
                height: 20.0,
              ),
              defaultButton(
                width: 200,
                function: () {
                  navigatAndFinish(
                    context,
                    LoginScreen(),
                  );
                },
                text: 'doner',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
