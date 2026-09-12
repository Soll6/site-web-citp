import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Display
  static TextStyle displayLg = GoogleFonts.plusJakartaSans(
    fontSize: 56,
    fontWeight: FontWeight.w800,
    height: 64 / 56,
    letterSpacing: -0.5,
    color: AppColors.onSurface,
  );

  static TextStyle displayLgMobile = GoogleFonts.plusJakartaSans(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 44 / 36,
    color: AppColors.onSurface,
  );

  // Headline
  static TextStyle headlineLg = GoogleFonts.plusJakartaSans(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 44 / 36,
    color: AppColors.primary,
  );

  static TextStyle headlineLgMobile = GoogleFonts.plusJakartaSans(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 36 / 28,
    color: AppColors.primary,
  );

  static TextStyle headlineMd = GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    color: AppColors.primary,
  );

  static TextStyle headlineSm = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    color: AppColors.primary,
  );

  static TextStyle titleMd = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    color: AppColors.primary,
  );

  // Body - Inter
  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle bodyMd = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 24 / 15,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle bodySm = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 20 / 13,
    color: AppColors.onSurfaceVariant,
  );

  // Label
  static TextStyle labelMd = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.3,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle labelMono = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 16 / 11,
    letterSpacing: 1.2,
    color: AppColors.secondary,
  );

  static TextStyle labelMonoWhite = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 16 / 11,
    letterSpacing: 1.1,
    color: Colors.white,
  );
}
