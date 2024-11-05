import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool isDarkMode() {
    if (themeMode == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }

  void togglrTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    //todo Update UI
    notifyListeners();
  }
}
