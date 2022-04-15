
import 'package:flutter/material.dart';

abstract class LocateStates {
  final Locale locale;

  LocateStates(this.locale);
}

class SelectedLocale extends LocateStates {
  SelectedLocale(Locale locale) : super(locale);
}

//class ChangePasswordShow extends AppStates{}
