import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_theme.dart';
import 'package:inbound_ms/core/theme/i_theme_provider.dart';

class AppThemeProvider extends ChangeNotifier implements IThemeProvider {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  ThemeMode get themeMode => _themeMode;

  @override
  ThemeData get currentThemeLight => AppTheme.appTheme(Brightness.light);

  @override
  ThemeData get currentThemeDark => AppTheme.appTheme(Brightness.dark);

  @override
  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  @override
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
