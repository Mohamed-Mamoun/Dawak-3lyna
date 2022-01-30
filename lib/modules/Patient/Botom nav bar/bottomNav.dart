import 'package:dawak_3lyna/layout/cubit/home_cubit_cubit.dart';
import 'package:dawak_3lyna/modules/Patient/Home/Patient_Home.dart';
import 'package:dawak_3lyna/modules/Patient/New%20Request/newRequest.dart';
import 'package:dawak_3lyna/modules/Patient/Profile/Patient_Profile.dart';
import 'package:dawak_3lyna/shared/cubit/cubit.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NavBar extends StatelessWidget {
  const NavBar({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubitCubit(),
      child: BlocConsumer<HomeCubitCubit,HomeCubitState>
      (
         listener:  (context,state ){},
        builder: (context,state ){
          HomeCubitCubit cubit = BlocProvider.of(context);
          return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: cubit.items,
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.selectedindex,
          onTap: (index) {
           cubit.setIndex(index);
          },
        ),
        body: cubit.screens[cubit.selectedindex],
      );
        }
      )
      );
        }

  }


/*
Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
        ),
        body: screens[selectedindex],
      ),)
  */
  

