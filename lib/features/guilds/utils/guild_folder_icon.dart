import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
