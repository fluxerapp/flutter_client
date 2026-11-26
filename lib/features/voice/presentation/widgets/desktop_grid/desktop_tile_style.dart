import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/material_ui.dart';

const double kVoiceDesktopTileRadius = 12;
const double kVoiceDesktopMembersRowTileRadius = 8;
const double kVoiceDesktopTileHudInset = 6;
const double kVoiceDesktopTileHudCompactInset = 5;
const double kVoiceDesktopTileCompactWidth = 280;
const double kVoiceDesktopTileSpeakingWidth = 3.5;
const double kVoiceDesktopTilePlaceholderTint = 0.4;

const Color kVoiceDesktopTileVideoSurface = Color(0xFF0D0D0F);
const Color kVoiceDesktopTileSurface = Color(0xFF151517);
const Color kVoiceDesktopTileStreamSurface = Color(0xFF242427);
const Color kVoiceDesktopTileMutedText = Color(0xB8FFFFFF);
const Color kVoiceDesktopTileOverlay = Color(0xC7000000);

double voiceDesktopTileRadius(VoiceDesktopTilePresentation presentation) {
  return switch (presentation) {
    VoiceDesktopTilePresentation.grid => kVoiceDesktopTileRadius,
    VoiceDesktopTilePresentation.focusMain => 0,
    VoiceDesktopTilePresentation.focusSecondary =>
      kVoiceDesktopMembersRowTileRadius,
  };
}

Color voiceDesktopTilePlaceholderColor(Color accent) {
  return Color.lerp(
    kVoiceDesktopTileSurface,
    accent,
    kVoiceDesktopTilePlaceholderTint,
  )!;
}

TextStyle voiceDesktopTileTextStyle(
  BuildContext context, {
  required double fontSize,
  FontWeight fontWeight = FontWeight.w500,
  Color color = Colors.white,
}) {
  return context.textStyles.smallText.copyWith(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 1.2,
  );
}
