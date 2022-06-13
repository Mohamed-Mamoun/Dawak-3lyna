import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/localizations/applocal.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
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
              // title: Text(
              //   cubit.titles[cubit.currentIndex],
              // ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (int index) {
                cubit.changeBottom(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                  ),
                  label: '${getLang(context, 'Home')}',
                ),
                 BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.apps,
                  ),
                  label: '${getLang(context, 'Request')}',
                ),
                 BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.person_rounded,
                  ),
                  label: '${getLang(context, 'Profile')}',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
