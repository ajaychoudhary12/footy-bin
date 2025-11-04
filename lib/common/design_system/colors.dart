import 'package:flutter/material.dart';

class AppColors {
  // 🌟 Brand / Accent Purples
  static const Color primary = Color(0xFF8C7CFF); // main accent purple
  static const Color primaryLight = Color(0xFFA99EFF); // lighter purple accent
  static const Color primaryDark = Color(0xFF6553CC); // darker accent
  static const Color appBar = Color(0xFF433E63); // app bar color

  // 🖤 Background / Surface
  static const Color background = Color(
    0xFF1E1B2E,
  ); // deep purple-grey background
  static const Color surface = Color(0xFF1F1E25); // card / panel surface
  static const Color card = Color(
    0xFF38344F,
  ); // slightly lighter surface for cards

  // 📝 Text Colors
  static const Color textPrimary = Color(
    0xFFE0E0E8,
  ); // off-white for high contrast
  static const Color textSecondary = Color(
    0xFFB0AED2,
  ); // muted light purple/grey
  static const Color textDisabled = Color(0xFF6A6780); // very muted

  // 🔧 Status & Accent Colors
  static const Color success = Color(0xFF46D786); // bright but balanced green
  static const Color warning = Color(0xFFF3C86C); // soft amber
  static const Color error = Color(0xFFE26A7C); // gentle red/pink

  // 🔲 Borders / Dividers
  static const Color border = Color(0xFF40405A); // subtle dark purple/grey
  static const Color divider = Color(
    0xFF48475F,
  ); // a little lighter than border

  // 🏧 Shadows & Elevated Surfaces (optional)
  static const Color shadow = Color(0xFF0A0917); // very dark for subtle shadows
}
