import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────────────────────────
  static const Color primary        = Color(0xFF6C63FF); // purple — price, qty buttons, CTA
  static const Color primaryDark    = Color(0xFF4B44CC); // CTA gradient end

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static const Color background     = Color(0xFFFFFFFF); // page bg
  static const Color cardBg         = Color(0xFFF5F5F5); // cart item + summary card
  static const Color iconCircleBg   = Color(0xFFF0F0F0); // appbar icon circles

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary    = Color(0xFF1A1A1A); // names, totals
  static const Color textSecondary  = Color(0xFF9E9E9E); // brand, summary labels
  static const Color textPrice      = Color(0xFF6C63FF); // price in item card
  static const Color textWhite      = Color(0xFFFFFFFF);

  // ── Icons ─────────────────────────────────────────────────────────────────
  static const Color deleteIcon     = Color(0xFFEF5350); // trash icon — salmon red
  static const Color qtyIcon        = Color(0xFFFFFFFF); // +/- icon on purple circle

  // ── Divider ───────────────────────────────────────────────────────────────
  static const Color divider        = Color(0xFFE0E0E0);

  // ── Qty button ────────────────────────────────────────────────────────────
  static const Color qtyButtonBg    = Color(0xFF6C63FF);
}
