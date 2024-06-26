import 'package:dawak_3lyna/layout/cubit/cubit.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard_Layout extends StatelessWidget {
  const Dashboard_Layout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return WillPopScope(
          onWillPop: () async {
            showToast(
              text: 'SignOut',
              state: ToastStates.ERROR,
            );
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
               'Dashboard',
              style: Theme.of(context).textTheme.bodyText1,
              ),
             
            ),
            body: cubit.dashboardScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (int index) {
                cubit.changeBottom(index);
              },
              
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                 const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Doners',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.apps,
                  ),
                  label: 'Patients',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
