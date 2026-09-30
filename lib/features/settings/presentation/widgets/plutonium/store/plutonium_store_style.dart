import 'package:fluxer_app/material_ui.dart';

abstract final class PlutoniumStoreStyle {
  static const Color spaceTop = Color(0xFF07061A);
  static const Color spaceMid = Color(0xFF0C0A28);
  static const Color spaceBottom = Color(0xFF110D35);
  static const Color ink = Color(0xFFFFFFFF);
  static const Color inkMuted = Color(0xB8FFFFFF);
  static const Color inkSoft = Color(0xF2FFFFFF);
  static const Color inkFaint = Color(0x73FFFFFF);
  static const Color line = Color(0x2EFFFFFF);
  static const Color accent = Color(0xFFC4C0FF);

  static const BorderRadius panelRadius = BorderRadius.all(Radius.circular(28));

  static const BoxDecoration panel = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xB3221E4C), Color(0x99181438)],
    ),
    border: Border.fromBorderSide(BorderSide(color: line)),
    borderRadius: panelRadius,
  );
}
