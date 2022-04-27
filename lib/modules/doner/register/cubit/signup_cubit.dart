import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  var formKey = GlobalKey<FormState>();

  var namecontroller = TextEditingController();
  var numbercontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  List lisItems = ['Khartoum', 'Omdourman', 'Bahri'];

  String valuechoose;

  // ************************************************************
  // // Function To change the value of DropDownButton
  void changeCity(dynamic newValue){
    valuechoose = newValue;
    emit(ChangeValue());
  }


  // ************************************************************
  // Create user account And Save his data To Database
  Future signUp_User(
    String email,
    String password,
    String name,
    String number,
    String city,
  ) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              firestore.collection('users').doc(value.user.uid).set({
                'Id': value.user.uid,
                'Full_Name': name,
                'Phone_Number': number,
                'City': city,
                'Email': email
              })
            });
    emit(Signup_User());
  }
}
