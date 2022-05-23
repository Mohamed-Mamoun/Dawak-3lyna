import 'dart:io';
import 'package:dawak_3lyna/modules/Dashboard/Doners%20Requests/Doners.dart';
import 'package:dawak_3lyna/modules/Dashboard/Patients%20Requests/Patients.dart';
import 'package:dawak_3lyna/modules/home/home_screen.dart';
import 'package:dawak_3lyna/modules/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/  request/request_screen.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static BuildContext get context => null;

  static HomeCubit get(context) => BlocProvider.of(context);

  final auth = FirebaseAuth.instance;


  List<Widget> screens = [
    HomeScreen(),
     const RequesrScreen(),
    const ProfileScreen()
  ];

  List<Widget> dashboard_screens = [
    const Donors(),
    const Patients(),
  ];

  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
