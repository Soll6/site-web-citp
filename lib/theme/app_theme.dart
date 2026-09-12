import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.surface,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      surfaceContainerHighest: AppColors.surfaceContainerHighest,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      inverseSurface: AppColors.inverseSurface,
      inversePrimary: AppColors.inversePrimary,
      surfaceTint: AppColors.surfaceTint,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLg,
      headlineLarge: AppTextStyles.headlineLg,
      headlineMedium: AppTextStyles.headlineMd,
      headlineSmall: AppTextStyles.headlineSm,
      titleMedium: AppTextStyles.titleMd,
      bodyLarge: AppTextStyles.bodyLg,
      bodyMedium: AppTextStyles.bodyMd,
      bodySmall: AppTextStyles.bodySm,
      labelMedium: AppTextStyles.labelMd,
      labelSmall: AppTextStyles.labelMono,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceContainerLowest,
      foregroundColor: AppColors.primary,
      elevation: 0,
      scrolledUnderElevation: 1,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0.3,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        textStyle: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600),
        elevation: 2,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.secondaryContainer,
        foregroundColor: AppColors.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        textStyle: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.outlineVariant, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceContainerLowest,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.cardBorder, width: 1),
      ),
      shadowColor: AppColors.primary.withValues(alpha: 0.08),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceContainerLowest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.outlineVariant, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xFFCBD5E1), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      labelStyle: AppTextStyles.titleMd,
      hintStyle: AppTextStyles.bodyMd.copyWith(color: AppColors.outline),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.outlineVariant, thickness: 1),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surfaceContainer,
      labelStyle: AppTextStyles.labelMd,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: const BorderSide(color: AppColors.outlineVariant),
    ),
  );
}
