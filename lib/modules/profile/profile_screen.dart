import 'package:dawak_3lyna/shared/components/Size_Config.dart';
import 'package:dawak_3lyna/shared/components/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      padding:  EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
      ),
      child: Column(
        children: [
           SizedBox(
            height: getProportionateScreenHeight(150),
          ),
          ProfileMenu(
            text: "My Account",
            icon: Icons.person_outline,
            press: () => {
              // navigatTo(
              //   context,
              //   EditProfileScreen(),
              // ),
            },
          ),
          ProfileMenu(
            text: "About Us",
            icon: Icons.info_outline,
            press: () {
              // navigatTo(
              //   context,
              //    AboutUsScreen(),
              // );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout_outlined,
            press: () {
               singOut(context);
            },
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key key,
    @required this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  IconData icon;
  final VoidCallback press;

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(10),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          //  primary: kPrimaryColor,
          padding:  EdgeInsets.all(getProportionateScreenWidth(10)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            IconButton(
              onPressed: press,
              icon: Icon(icon),
            ),
             SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Expanded(
              child: Text(text),
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
