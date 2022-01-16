import 'package:dawak_3lyna/modules/login/login_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(),
      body: SafeArea(
              child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/06/medical-logo.jpg'),
                radius: 70,
              ),
              SizedBox(
                height: 70.0,
              ),
              Text(
                'Chooes Type',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
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
                text: 'Donor',
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                width: 200,
                function: () {},
                text: 'patient',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
