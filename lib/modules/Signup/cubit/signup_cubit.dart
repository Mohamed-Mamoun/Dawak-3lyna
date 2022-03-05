import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // ************************************************************
  // Create user account And Save his data To Firestore
  Future signUp_User(
    String email,
    String password,
    String name,
    String gender,
    String number,
    String city,
  ) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              firestore.collection('users').doc(value.user.uid).set({
                'Id': value.user.uid,
                'Full_Name': name,
                'gender': gender,
                'Phone_Number': number,
                'City': city,
                'Email': email
              })
            });
    emit(Signup_User());
  }
}
