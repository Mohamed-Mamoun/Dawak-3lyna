import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return WillPopScope(
          onWillPop: () async {
            showToast(text: 'SignOut', state: ToastStates.ERROR);
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
              // actions: [
              //   cubit.currentIndex == 2
              //       ? IconButton(
              //           onPressed: () async {
              //             await cubit.auth.signOut();
              //             navigatTo(context, const MainPageScreen());
              //           },
              //           icon: const Icon(
              //             Icons.exit_to_app,
              //             color: Colors.red,
              //             size: 35,
              //           ))
              //       : Text(
              //           cubit.titles[cubit.currentIndex],
              //         ),
              // ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (int index) {
                cubit.changeBottom(index);
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.apps,
                  ),
                  label: 'Request',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
