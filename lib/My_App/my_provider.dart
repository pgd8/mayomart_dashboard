import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
   String language = "en";
   ThemeMode appTheme = ThemeMode.light;

  void changeLanguage() {
    if (language == "en") {
      language = "ar";
    } else {
      language = "en";
    }
    print(language);
    notifyListeners();
  }
  void changeAppTheme(ThemeMode theme) {
    appTheme = theme;
    notifyListeners();
  }
}
