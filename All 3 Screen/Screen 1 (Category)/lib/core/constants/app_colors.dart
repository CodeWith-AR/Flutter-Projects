import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Background gradient ────────────────────────────────────────────────────
  static const Color gradientTop    = Color(0xFFFFE4F0); // soft pink
  static const Color gradientBottom = Color(0xFFE8F0FF); // soft blue

  // ── Primary accents ────────────────────────────────────────────────────────
  static const Color pink           = Color(0xFFE91E8C); // Massage, Fitness, Lactation, Therapy
  static const Color teal           = Color(0xFF80CBC4); // Foot Spa, Baby Care
  static const Color greyBlue       = Color(0xFF9E9E9E); // Nutritionist, Home Care

  // ── Card backgrounds ───────────────────────────────────────────────────────
  static const Color cardWarm       = Color(0xFFFCF0F5); // pinkish rows
  static const Color cardCool       = Color(0xFFF0F4FF); // bluish rows

  // ── Search bar ─────────────────────────────────────────────────────────────
  static const Color searchBg       = Color(0xFFFFFFFF);
  static const Color searchHint     = Color(0xFFBDBDBD);
  static const Color searchIcon     = Color(0xFFE91E8C);

  // ── AppBar ─────────────────────────────────────────────────────────────────
  static const Color appBarTitle    = Color(0xFF1A1A2E);
  static const Color appBarIcon     = Color(0xFF1A1A2E);
  static const Color appBarLeaderBg = Color(0xFFF2F2F2);

  // ── Label text ─────────────────────────────────────────────────────────────
  static const Color labelText      = Color(0xFF5A5A7A);

  // ── Surface ────────────────────────────────────────────────────────────────
  static const Color surface        = Color(0xFFFFFFFF);

  // ── Shadows ────────────────────────────────────────────────────────────────
  static const Color shadowLight    = Color(0x14000000); // 8% opacity — search bar
}
