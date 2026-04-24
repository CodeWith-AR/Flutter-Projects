import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────────────────────────
  static const Color primary       = Color(0xFFE91E8C); // pink-magenta — active states
  static const Color primaryLight  = Color(0xFFFCE4F3); // light pink tint

  // ── Background ────────────────────────────────────────────────────────────
  static const Color scaffold      = Color(0xFFFFFFFF);
   // static const Color gradientTop   = Color(0xFFFFE4F0); // soft pink
    // static const Color gradientBottom= Color(0xFFF8F4F8); // near-white lavender
  static const Color gradientTop    = Color(0xFFFFF5F9); // lighter soft pink
  static const Color gradientBottom = Color(0xFFFAFAFA); // off-white


  // ── Surface / cards ───────────────────────────────────────────────────────
  static const Color surface       = Color(0xFFFFFFFF);
  static const Color cardBorder    = Color(0xFFE8E8E8);

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color textWhite     = Color(0xFFFFFFFF);

  // ── Tab bar ───────────────────────────────────────────────────────────────
  static const Color tabActive     = Color(0xFF1A1A1A);
  static const Color tabInactive   = Color(0xFF9E9E9E);
  static const Color tabIndicator  = Color(0xFFE91E8C);

  // ── Date selector ─────────────────────────────────────────────────────────
  static const Color dateActiveBg  = Color(0xFFE91E8C);
  static const Color dateActiveText= Color(0xFFFFFFFF);
  static const Color dateInactiveText = Color(0xFF1A1A1A);

  // ── Time slot ─────────────────────────────────────────────────────────────
  static const Color timeActiveBg  = Color(0xFFE91E8C);
  static const Color timeActiveText= Color(0xFFFFFFFF);
  static const Color timeBorder    = Color(0xFF1A1A1A);
  static const Color timeText      = Color(0xFF1A1A1A);

  // ── Home visit chip ───────────────────────────────────────────────────────
  static const Color chipGreen     = Color(0xFF4CAF50);
  static const Color chipGreenBg   = Color(0xFFF1FBF1);

  // ── Location edit icon ────────────────────────────────────────────────────
  static const Color editIcon      = Color(0xFFE91E8C);

  // ── Divider / border ──────────────────────────────────────────────────────
  static const Color divider       = Color(0xFFEEEEEE);
  static const Color borderDark    = Color(0xFF1A1A1A); // Cancel button border

  // ── AppBar icons ──────────────────────────────────────────────────────────
  static const Color appBarIcon    = Color(0xFF1A1A1A);
  static const Color appBarLeadBg  = Color(0xFFFFFFFF); // no circle for logo

  // ── Shadow ────────────────────────────────────────────────────────────────
  static const Color shadowColor   = Color(0x12000000);
}
