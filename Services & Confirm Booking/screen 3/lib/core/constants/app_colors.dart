import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Background gradient (Lighter) ──────────────────────────────────────────
  static const Color gradientTop    = Color(0xFFFFF9FB); // extra light soft pink
  static const Color gradientBottom = Color(0xFFFFFFFF); // pure white

  // ── AppBar ─────────────────────────────────────────────────────────────────
  static const Color appBarTitle    = Color(0xFF1A1A1A);
  static const Color appBarIcon     = Color(0xFF1A1A1A);
  static const Color appBarLeadBg   = Color(0xFFF2F2F2); // grey circle

  // ── Card ──────────────────────────────────────────────────────────────────
  static const Color cardBg         = Color(0xFFFFFFFF);
  static const Color shadowColor    = Color(0x14000000); // 8% black — card shadow

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary    = Color(0xFF1A1A1A);
  static const Color textMeta       = Color(0xFF9E9E9E); // AED, duration

  // ── Home visit chip ───────────────────────────────────────────────────────
  static const Color chipGreen      = Color(0xFF4CAF50);
  static const Color chipGreenBg    = Color(0xFFF1FBF1); // very light green tint

  // ── Transparent ───────────────────────────────────────────────────────────
  static const Color transparent    = Colors.transparent;
}
