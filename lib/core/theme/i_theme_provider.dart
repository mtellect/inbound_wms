import 'package:flutter/material.dart';

abstract class IThemeProvider extends ChangeNotifier {
  ThemeMode get themeMode;
  ThemeData get currentThemeLight;
  ThemeData get currentThemeDark;

  void setThemeMode(ThemeMode mode);
  void toggleTheme();
}
