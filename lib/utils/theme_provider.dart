import 'package:flutter/material.dart';

import '../core/constants/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = lightThemeData;

  setLightMode() {
    currentTheme = lightThemeData;
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = darkThemeData;
    notifyListeners();
  }
}
