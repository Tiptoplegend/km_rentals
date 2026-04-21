import 'package:flutter/material.dart';

/// Owner shell / nav / cards — single source for earnings & home.
abstract final class OwnerThemeColors {
  static const shell = Color(0xFFF7F7F9);
  /// Slightly cooler tone for subtle screen gradients.
  static const shellDeep = Color(0xFFEEEFF3);
  static const dark = Color(0xFF1E1E1E);
  static const accent = Color(0xFFF5B754);
  static const muted = Color(0xFF8E8E93);
  static const cardSurface = Colors.white;
  /// Hairline borders on elevated surfaces.
  static const borderSubtle = Color(0xFFE8E9ED);
  /// Recessed chart / data well.
  static const chartWell = Color(0xFFF0F1F5);
  static const accentGlow = Color(0x33F5B754);
}
