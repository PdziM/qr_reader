import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  final BuildContext context;
  ThemeMode themeMode = ThemeMode.system;
  ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  setThemeMode(ThemeMode value) {
    themeMode = value;
    notifyListeners();
  }

  MainState(this.context) {
    init();
  }

  init() {}
}
