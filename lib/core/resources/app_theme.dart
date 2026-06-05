import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // 1. Base Theme: Shared foundational styles
  static ThemeData _baseTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              surface: AppColors.surfaceDark,
              error: AppColors.error,
            )
          : const ColorScheme.light(
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              surface: AppColors.surfaceLight,
              error: AppColors.error,
            ),
      scaffoldBackgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        foregroundColor: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        elevation: 0,
        centerTitle: false,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // 2. Web Theme: Adjustments specifically for desktop/web browsers
  static ThemeData webTheme(Brightness brightness) {
    final base = _baseTheme(brightness);
    return base.copyWith(
      visualDensity: VisualDensity.compact, // Compact density for mouse clicks
      // Add more specific web overrides here if needed
    );
  }

  // 3. App Theme: Adjustments specifically for mobile devices
  static ThemeData appTheme(Brightness brightness) {
    final base = _baseTheme(brightness);
    return base.copyWith(
      visualDensity: VisualDensity.standard, // Standard density for touch targets
      // Add more specific app overrides here if needed
    );
  }
}
