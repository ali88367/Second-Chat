import 'package:flutter/material.dart';

/// AppColors
/// 
/// Centralized color palette for the entire application.
/// All colors are defined as static const Color values for consistency
/// and performance. Use these colors throughout the app instead of
/// hardcoding color values.
/// 
/// Color naming convention:
/// - Primary colors: primary, primaryLight, primaryDark
/// - Accent colors: accent, accentLight, accentDark
/// - Semantic colors: error, success, warning, info
/// - Grey scale: greyScale with variants (50, 100, 200, etc.)
/// - Background colors: background, surface, card
/// - Text colors: textPrimary, textSecondary, textTertiary
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary Colors
  static const Color primary = Color(0xFF6366F1); // Indigo-500
  static const Color primaryLight = Color(0xFF818CF8); // Indigo-400
  static const Color primaryDark = Color(0xFF4F46E5); // Indigo-600
  static const Color primaryContainer = Color(0xFFE0E7FF); // Indigo-100

  // Secondary Colors
  static const Color secondary = Color(0xFF8B5CF6); // Purple-500
  static const Color secondaryLight = Color(0xFFA78BFA); // Purple-400
  static const Color secondaryDark = Color(0xFF7C3AED); // Purple-600
  static const Color secondaryContainer = Color(0xFFEDE9FE); // Purple-100

  // Accent Colors
  static const Color accent = Color(0xFF06B6D4); // Cyan-500
  static const Color accentLight = Color(0xFF22D3EE); // Cyan-400
  static const Color accentDark = Color(0xFF0891B2); // Cyan-600

  // Semantic Colors
  static const Color error = Color(0xFFEF4444); // Red-500
  static const Color errorLight = Color(0xFFFEE2E2); // Red-100
  static const Color errorDark = Color(0xFFDC2626); // Red-600

  static const Color success = Color(0xFF10B981); // Green-500
  static const Color successLight = Color(0xFFD1FAE5); // Green-100
  static const Color successDark = Color(0xFF059669); // Green-600

  static const Color warning = Color(0xFFF59E0B); // Amber-500
  static const Color warningLight = Color(0xFFFEF3C7); // Amber-100
  static const Color warningDark = Color(0xFFD97706); // Amber-600

  static const Color info = Color(0xFF3B82F6); // Blue-500
  static const Color infoLight = Color(0xFFDBEAFE); // Blue-100
  static const Color infoDark = Color(0xFF2563EB); // Blue-600

  // Grey Scale
  static const Color greyScale50 = Color(0xFFF9FAFB);
  static const Color greyScale100 = Color(0xFFF3F4F6);
  static const Color greyScale200 = Color(0xFFE5E7EB);
  static const Color greyScale300 = Color(0xFFD1D5DB);
  static const Color greyScale400 = Color(0xFF9CA3AF);
  static const Color greyScale500 = Color(0xFF6B7280);
  static const Color greyScale600 = Color(0xFF4B5563);
  static const Color greyScale700 = Color(0xFF374151);
  static const Color greyScale800 = Color(0xFF1F2937);
  static const Color greyScale900 = Color(0xFF111827);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0F172A); // Slate-900
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E293B); // Slate-800
  static const Color card = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF334155); // Slate-700

  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // Grey-900
  static const Color textSecondary = Color(0xFF6B7280); // Grey-500
  static const Color textTertiary = Color(0xFF9CA3AF); // Grey-400
  static const Color textInverse = Color(0xFFFFFFFF);
  static const Color textDisabled = Color(0xFFD1D5DB); // Grey-300

  // Border Colors
  static const Color border = Color(0xFFE5E7EB); // Grey-200
  static const Color borderLight = Color(0xFFF3F4F6); // Grey-100
  static const Color borderDark = Color(0xFFD1D5DB); // Grey-300

  // Divider Colors
  static const Color divider = Color(0xFFE5E7EB); // Grey-200
  static const Color dividerDark = Color(0xFF374151); // Grey-700

  // Overlay Colors
  static const Color overlay = Color(0x80000000); // Black with 50% opacity
  static const Color overlayLight = Color(0x40000000); // Black with 25% opacity

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentDark],
  );
}

