import 'package:dawak_3lyna/layout/cubit/Home.dart';
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



  

