import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/media/media_kit_player_lifecycle.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_sprite_sheet.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

void trimFluxerAppMemory(WidgetRef ref, {required bool aggressive}) {
  clearFluxerImageCache();
  EmojiSpriteSheet.release();
  unawaited(MediaKitPlayerLifecycleCoordinator.instance.pauseAll());
  if (!aggressive) {
    return;
  }
  clearMarkdownParseCaches();
  EmojiAssetCache.clearMemory();
  try {
    ref.read(chatViewModelProvider.notifier).releaseParkedWindows();
  } on Object catch (error, stackTrace) {
    talker.warning(
      '[Memory] Failed to release parked windows',
      error,
      stackTrace,
    );
  }
  unawaited(_shrinkDatabaseMemory(ref));
  talker.debug('[Memory] Trimmed app memory (aggressive: $aggressive)');
}

Future<void> _shrinkDatabaseMemory(WidgetRef ref) async {
  try {
    await ref
        .read(fluxerDatabaseProvider)
        .customStatement('PRAGMA shrink_memory;');
  } on Object catch (error, stackTrace) {
    talker.warning(
      '[Memory] Failed to shrink database memory',
      error,
      stackTrace,
    );
  }
}
