import 'package:flutter/material.dart';

// F1 Theme Color Palette
class F1Colors {
  // Primary F1 Colors
  static const Color f1Red = Color(0xFFD90429); // Ferrari Red
  static const Color f1Blue = Color(0xFF0066CC); // Mercedes Blue
  static const Color f1Yellow = Color(0xFFFFD600); // Pirelli Yellow
  static const Color f1Orange = Color(0xFFFF6700); // McLaren Orange
  static const Color f1Green = Color(0xFF00D4AA); // Aston Martin Green
  static const Color f1Purple = Color(0xFF6B46C1); // Alpine Purple

  // Team Colors
  static const Color ferrariRed = Color(0xFFDC0000);
  static const Color mercedesSilver = Color(0xFF6CD3BF);
  static const Color redBullBlue = Color(0xFF1E41FF);
  static const Color mclarenOrange = Color(0xFFFF8700);
  static const Color astonMartinGreen = Color(0xFF006F62);
  static const Color alpineBlue = Color(0xFF0090FF);
  static const Color williamsBlue = Color(0xFF005AFF);
  static const Color haasRed = Color(0xFFFFFFFF); // White with red accents
  static const Color alphaTauriBlue = Color(0xFF2B4562);
  static const Color alfaRomeoRed = Color(0xFF9B0000);

  // Background Colors
  static const Color darkBackground = Color(0xFF0A0A0A); // Deep black
  static const Color cardBackground = Color(0xFF1A1A1A); // Dark grey
  static const Color surfaceBackground = Color(0xFF2A2A2A); // Medium grey

  // Text Colors
  static const Color primaryText = Color(0xFFFFFFFF); // White
  static const Color secondaryText = Color(0xFFB0B0B0); // Light grey
  static const Color accentText = Color(0xFFFFD600); // Yellow for highlights

  // Status Colors
  static const Color success = Color(0xFF00D4AA); // Green for success
  static const Color warning = Color(0xFFFFD600); // Yellow for warnings
  static const Color error = Color(0xFFD90429); // Red for errors
  static const Color info = Color(0xFF0066CC); // Blue for info
}

final ThemeData f1Theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  // Color Scheme
  colorScheme: const ColorScheme.dark(
    primary: F1Colors.f1Red,
    onPrimary: Colors.white,
    secondary: F1Colors.f1Yellow,
    onSecondary: Colors.black,
    tertiary: F1Colors.f1Blue,
    onTertiary: Colors.white,
    background: F1Colors.darkBackground,
    onBackground: F1Colors.primaryText,
    surface: F1Colors.cardBackground,
    onSurface: F1Colors.primaryText,
    error: F1Colors.error,
    onError: Colors.white,
    outline: F1Colors.f1Yellow,
    outlineVariant: F1Colors.secondaryText,
  ),

  // Scaffold
  scaffoldBackgroundColor: F1Colors.darkBackground,

  // App Bar
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    iconTheme: IconThemeData(color: F1Colors.f1Yellow),
  ),

  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 56,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    displayMedium: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    displaySmall: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    headlineLarge: TextStyle(
      color: F1Colors.f1Red,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
    ),
    headlineMedium: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    ),
    bodyLarge: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 18,
      fontFamily: 'Inter',
    ),
    bodyMedium: TextStyle(
      color: F1Colors.secondaryText,
      fontSize: 16,
      fontFamily: 'Inter',
    ),
    labelLarge: TextStyle(
      color: F1Colors.primaryText,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Inter',
    ),
  ),

  // Button Themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: F1Colors.f1Red,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: F1Colors.f1Yellow,
      side: const BorderSide(color: F1Colors.f1Yellow, width: 2),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: F1Colors.f1Yellow,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
    ),
  ),

  // Card Theme
  cardTheme: CardTheme(
    color: F1Colors.cardBackground,
    elevation: 8,
    shadowColor: F1Colors.f1Red.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: F1Colors.surfaceBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: F1Colors.secondaryText),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: F1Colors.secondaryText),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: F1Colors.f1Yellow, width: 2),
    ),
    labelStyle: const TextStyle(color: F1Colors.secondaryText),
    hintStyle: const TextStyle(color: F1Colors.secondaryText),
  ),

  // Icon Theme
  iconTheme: const IconThemeData(
    color: F1Colors.f1Yellow,
    size: 24,
  ),

  // Divider Theme
  dividerTheme: const DividerThemeData(
    color: F1Colors.secondaryText,
    thickness: 1,
    space: 1,
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: F1Colors.cardBackground,
    selectedItemColor: F1Colors.f1Yellow,
    unselectedItemColor: F1Colors.secondaryText,
    type: BottomNavigationBarType.fixed,
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: F1Colors.f1Red,
    foregroundColor: Colors.white,
    elevation: 8,
  ),

  // Chip Theme
  chipTheme: ChipThemeData(
    backgroundColor: F1Colors.surfaceBackground,
    selectedColor: F1Colors.f1Red,
    labelStyle: const TextStyle(color: F1Colors.primaryText),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),

  // Progress Indicator Theme
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: F1Colors.f1Yellow,
    linearTrackColor: F1Colors.surfaceBackground,
  ),

  // Switch Theme
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return F1Colors.f1Yellow;
      }
      return F1Colors.secondaryText;
    }),
    trackColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return F1Colors.f1Yellow.withOpacity(0.5);
      }
      return F1Colors.surfaceBackground;
    }),
  ),

  // Slider Theme
  sliderTheme: SliderThemeData(
    activeTrackColor: F1Colors.f1Yellow,
    inactiveTrackColor: F1Colors.surfaceBackground,
    thumbColor: F1Colors.f1Yellow,
    overlayColor: F1Colors.f1Yellow.withOpacity(0.2),
  ),
);

// Extension for easy access to F1 colors
extension F1ThemeExtension on BuildContext {
  ColorScheme get f1Colors => Theme.of(this).colorScheme;
  TextTheme get f1Text => Theme.of(this).textTheme;
}
