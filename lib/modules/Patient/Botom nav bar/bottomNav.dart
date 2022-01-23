import 'package:dawak_3lyna/modules/Patient/Home/Patient_Home.dart';
import 'package:dawak_3lyna/modules/Patient/Profile/Patient_Profile.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedindex=0;
  List screens = [const Home(), const Profile()];
  List<Icon> items = [
    const Icon(Icons.home, size: 30, color: Colors.white),
    const Icon(Icons.account_circle, size: 30, color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedindex,
        items: items,
        height: 55,
        color: myColor,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        buttonBackgroundColor: myColor,
        backgroundColor: Colors.transparent,
        onTap: (index){
          setState(() {
            selectedindex = index;
          });
        },
      ),
      body: screens[selectedindex],
    );
  }
}
