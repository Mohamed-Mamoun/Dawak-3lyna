part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class Signup_User extends SignupState {}

class ChangeValue extends SignupState {}
