import 'package:bloc/bloc.dart';
import 'package:dawak_3lyna/modules/Patient/Home/Patient_Home.dart';
import 'package:dawak_3lyna/modules/Patient/New%20Request/newRequest.dart';
import 'package:dawak_3lyna/modules/Patient/Profile/Patient_Profile.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'HomeSate.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());
  List screens = [const Home(), const Profile(), NewRequest()];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 30, color: myColor), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle, size: 30, color: myColor),
        label: 'Profile'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.add, size: 40, color: myColor), label: 'New Request')
  ];

  int selectedindex = 0;
  
  setIndex(int index) {
    selectedindex = index;
    emit(NavState());
  }
}