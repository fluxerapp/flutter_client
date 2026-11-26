import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/material_ui.dart';

typedef VoiceGridCardBuilder =
    Widget Function(VoiceGridTile tile, VoiceGridCardSlot slot);

class VoiceGridCardSlot {
  const VoiceGridCardSlot({
    this.isFocusMain = false,
    this.edgeToEdge = false,
    this.size = Size.zero,
  }) : isFilmstrip = false,
       fillContainer = true,
       desktopPresentation = null;

  const VoiceGridCardSlot.filmstrip()
    : isFocusMain = false,
      isFilmstrip = true,
      fillContainer = false,
      edgeToEdge = false,
      size = Size.zero,
      desktopPresentation = null;

  const VoiceGridCardSlot.desktop(
    VoiceDesktopTilePresentation presentation, {
    this.size = Size.zero,
  }) : isFocusMain = presentation == VoiceDesktopTilePresentation.focusMain,
       isFilmstrip =
           presentation == VoiceDesktopTilePresentation.focusSecondary,
       fillContainer = true,
       edgeToEdge = false,
       desktopPresentation = presentation;

  final bool isFocusMain;
  final bool isFilmstrip;
  final bool fillContainer;
  final bool edgeToEdge;
  final Size size;
  final VoiceDesktopTilePresentation? desktopPresentation;

  bool get isDesktop => desktopPresentation != null;
}
