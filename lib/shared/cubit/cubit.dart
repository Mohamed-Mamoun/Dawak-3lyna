import 'package:dawak_3lyna/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  // Create object To use any wher .
  static AppCubit get(context) => BlocProvider.of(context);
  

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    isPassword = !isPassword;
    emit(ChangePasswordShow());
  }

 
}
