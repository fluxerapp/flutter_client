import 'package:fluxer_app/material_ui.dart';

enum PremiumStoreStyle {
  dark(
    spaceTop: Color(0xFF080811),
    spaceMid: Color(0xFF0B0A14),
    spaceBottom: Color(0xFF0F0F1D),
    ink: Color(0xFFFFFFFF),
    inkMuted: Color(0xB8FFFFFF),
    inkSoft: Color(0xF2FFFFFF),
    inkFaint: Color(0x73FFFFFF),
    line: Color(0x14FFFFFF),
    accent: Color(0xFFB0ADFF),
    wave: Color(0xFFFFFFFF),
    panelFill: Color(0x800C0C18),
    panelShadow: Color(0xCC000000),
  ),
  light(
    spaceTop: Color(0xFFF9F9FD),
    spaceMid: Color(0xFFF2F2FB),
    spaceBottom: Color(0xFFE9E9F7),
    ink: Color(0xFF121122),
    inkMuted: Color(0xB8121122),
    inkSoft: Color(0xF2121122),
    inkFaint: Color(0x73121122),
    line: Color(0x14121122),
    accent: Color(0xFF4641D9),
    wave: Color(0xFF4641D9),
    panelFill: Color(0x80FFFFFF),
    panelShadow: Color(0x2E121122),
  );

  const PremiumStoreStyle({
    required this.spaceTop,
    required this.spaceMid,
    required this.spaceBottom,
    required this.ink,
    required this.inkMuted,
    required this.inkSoft,
    required this.inkFaint,
    required this.line,
    required this.accent,
    required this.wave,
    required this.panelFill,
    required this.panelShadow,
  });

  static PremiumStoreStyle of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  final Color spaceTop;
  final Color spaceMid;
  final Color spaceBottom;
  final Color ink;
  final Color inkMuted;
  final Color inkSoft;
  final Color inkFaint;
  final Color line;
  final Color accent;
  final Color wave;
  final Color panelFill;
  final Color panelShadow;

  static const BorderRadius panelRadius = BorderRadius.all(Radius.circular(16));

  BoxDecoration get panel => BoxDecoration(
    color: panelFill,
    border: Border.fromBorderSide(BorderSide(color: line)),
    borderRadius: panelRadius,
    boxShadow: [
      BoxShadow(
        color: panelShadow,
        blurRadius: 48,
        spreadRadius: -32,
        offset: const Offset(0, 24),
      ),
    ],
  );
}
