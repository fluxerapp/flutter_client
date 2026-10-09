import 'package:fluxer_app/material_ui.dart';

abstract final class PremiumStoreStyle {
  static const Color spaceTop = Color(0xFF080811);
  static const Color spaceMid = Color(0xFF0B0A14);
  static const Color spaceBottom = Color(0xFF0F0F1D);
  static const Color ink = Color(0xFFFFFFFF);
  static const Color inkMuted = Color(0xB8FFFFFF);
  static const Color inkSoft = Color(0xF2FFFFFF);
  static const Color inkFaint = Color(0x73FFFFFF);
  static const Color line = Color(0x14FFFFFF);
  static const Color accent = Color(0xFFB0ADFF);

  static const BorderRadius panelRadius = BorderRadius.all(Radius.circular(16));

  static const BoxDecoration panel = BoxDecoration(
    color: Color(0x800C0C18),
    border: Border.fromBorderSide(BorderSide(color: line)),
    borderRadius: panelRadius,
    boxShadow: [
      BoxShadow(
        color: Color(0xCC000000),
        blurRadius: 48,
        spreadRadius: -32,
        offset: Offset(0, 24),
      ),
    ],
  );
}
