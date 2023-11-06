
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLocale = "en";


  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;

    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }


  String splashBackground() {
    return isDark()
        ? "assets/images/splash _dark.png"
        : "assets/images/splash_light.png";
  }


  changeLanguage(String newLanguage) {
    if (currentLocale == newLanguage) return;
    currentLocale = newLanguage;

    notifyListeners();
  }




}