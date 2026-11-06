import 'package:flutter/widgets.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

IconData guildFolderIconForName(String? icon) {
  return switch (icon) {
    'star' => PhosphorIconsFill.star,
    'heart' => PhosphorIconsFill.heart,
    'bookmark' => PhosphorIconsFill.bookmarkSimple,
    'game_controller' => PhosphorIconsFill.gameController,
    'shield' => PhosphorIconsFill.shield,
    'music_note' => PhosphorIconsFill.musicNote,
    _ => PhosphorIconsFill.folder,
  };
}
