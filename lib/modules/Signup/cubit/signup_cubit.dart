import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final auth = FirebaseAuth.instance;

  Future signUp_User(String email, String password)async{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    emit(Signup_User());
  }
}
 