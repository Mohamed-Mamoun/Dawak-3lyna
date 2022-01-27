import 'package:dawak_3lyna/modules/Patient/Home/Patient_Home.dart';
import 'package:dawak_3lyna/modules/Patient/New%20Request/newRequest.dart';
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
  List screens = [const Home(), const Profile(), NewRequest()];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: const Icon(Icons.home, size: 30, color: myColor), label: 'Home'),
    BottomNavigationBarItem(icon: const Icon(Icons.account_circle, size: 30, color: myColor),label: 'Profile'),
    BottomNavigationBarItem(icon: const Icon(Icons.add, size: 40, color: myColor),label: 'New Request')
  ];
   
  @override
  Widget build(BuildContext context) {
    assert(screens.length == items.length);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedindex,
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
