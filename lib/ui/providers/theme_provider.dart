import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
   ThemeMode themeMode=ThemeMode.dark;
   bool get isLightMode =>themeMode==ThemeMode.light;
  void changeMode(ThemeMode newThemeMode){
    themeMode=newThemeMode;
    notifyListeners();
  }

}