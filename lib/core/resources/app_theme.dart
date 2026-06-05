import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // 1. Base Theme: Shared foundational styles
  static ThemeData _baseTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final textTheme = isDark
        ? GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
            bodyColor: AppColors.textPrimaryDark,
            displayColor: AppColors.textPrimaryDark,
          )
        : GoogleFonts.interTextTheme(ThemeData.light().textTheme).apply(
            bodyColor: AppColors.textPrimaryLight,
            displayColor: AppColors.textPrimaryLight,
          );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      textTheme: textTheme,
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
      cardTheme: CardThemeData(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        selectedIconTheme: const IconThemeData(color: AppColors.primary),
        selectedLabelTextStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
        unselectedIconTheme: IconThemeData(color: isDark ? Colors.grey[400] : Colors.grey[600]),
        unselectedLabelTextStyle: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
      ),
    );
  }

  // 2. Web Theme: Adjustments specifically for desktop/web browsers
  static ThemeData webTheme(Brightness brightness) {
    final base = _baseTheme(brightness);
    return base.copyWith(
      visualDensity: VisualDensity.compact, // Compact density for mouse clicks
    );
  }

  // 3. App Theme: Adjustments specifically for mobile devices
  static ThemeData appTheme(Brightness brightness) {
    final base = _baseTheme(brightness);
    return base.copyWith(
      visualDensity: VisualDensity.standard, // Standard density for touch targets
    );
  }
}
