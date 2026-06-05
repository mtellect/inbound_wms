import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  // Dynamically returns web or app theme based on platform
  ThemeData get currentThemeLight => kIsWeb ? AppTheme.webTheme(Brightness.light) : AppTheme.appTheme(Brightness.light);
  ThemeData get currentThemeDark => kIsWeb ? AppTheme.webTheme(Brightness.dark) : AppTheme.appTheme(Brightness.dark);

  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
