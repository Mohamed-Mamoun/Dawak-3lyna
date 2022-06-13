import 'package:dawak_3lyna/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<LocateStates> {
  LocaleCubit() : super(SelectedLocale(Locale('en')));

  void toArabic() => emit(SelectedLocale(Locale('ar')));

  void toEnglish() => emit(SelectedLocale(Locale('en')));

  // Create object To use any wher .
  static LocaleCubit get(context) => BlocProvider.of(context);
}
