import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors/app_colors.dart';

/// AppTypography
/// 
/// Centralized typography system for the entire application.
/// All text styles use Google Fonts and ScreenUtil for responsive sizing.
/// Font sizes are defined using .sp (scaled pixels) for proper scaling
/// across different screen sizes.
/// 
/// Typography hierarchy:
/// - h1 to h6: Headings (largest to smallest)
/// - bodyLarge, bodyMedium, bodySmall: Body text variants
/// - caption: Small supporting text
/// - button: Button text styles
/// - overline: Small uppercase labels
class AppTypography {
  AppTypography._(); // Private constructor to prevent instantiation

  // Font Family
  static String get fontFamily => GoogleFonts.inter().fontFamily ?? 'Inter';

  // Headings
  static TextStyle get h1 => GoogleFonts.inter(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        height: 1.2,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      );

  static TextStyle get h2 => GoogleFonts.inter(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        height: 1.3,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      );

  static TextStyle get h3 => GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.3,
        color: AppColors.textPrimary,
      );

  static TextStyle get h4 => GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: -0.2,
        color: AppColors.textPrimary,
      );

  static TextStyle get h5 => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 0,
        color: AppColors.textPrimary,
      );

  static TextStyle get h6 => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0,
        color: AppColors.textPrimary,
      );

  // Body Text
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        letterSpacing: 0,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        letterSpacing: 0,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        height: 1.5,
        letterSpacing: 0.1,
        color: AppColors.textPrimary,
      );

  // Caption
  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        height: 1.4,
        letterSpacing: 0.2,
        color: AppColors.textSecondary,
      );

  static TextStyle get captionSmall => GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        height: 1.4,
        letterSpacing: 0.3,
        color: AppColors.textSecondary,
      );

  // Button Text
  static TextStyle get buttonLarge => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0.5,
        color: AppColors.textInverse,
      );

  static TextStyle get buttonMedium => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0.5,
        color: AppColors.textInverse,
      );

  static TextStyle get buttonSmall => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0.5,
        color: AppColors.textInverse,
      );

  // Overline
  static TextStyle get overline => GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 1.5,
        color: AppColors.textSecondary,
      );

  // Label
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.1,
        color: AppColors.textPrimary,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.2,
        color: AppColors.textPrimary,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.3,
        color: AppColors.textPrimary,
      );

  // Helper methods for text styles with custom colors
  static TextStyle h1WithColor(Color color) => h1.copyWith(color: color);
  static TextStyle h2WithColor(Color color) => h2.copyWith(color: color);
  static TextStyle h3WithColor(Color color) => h3.copyWith(color: color);
  static TextStyle h4WithColor(Color color) => h4.copyWith(color: color);
  static TextStyle h5WithColor(Color color) => h5.copyWith(color: color);
  static TextStyle h6WithColor(Color color) => h6.copyWith(color: color);

  static TextStyle bodyLargeWithColor(Color color) =>
      bodyLarge.copyWith(color: color);
  static TextStyle bodyMediumWithColor(Color color) =>
      bodyMedium.copyWith(color: color);
  static TextStyle bodySmallWithColor(Color color) =>
      bodySmall.copyWith(color: color);

  static TextStyle captionWithColor(Color color) =>
      caption.copyWith(color: color);
}

