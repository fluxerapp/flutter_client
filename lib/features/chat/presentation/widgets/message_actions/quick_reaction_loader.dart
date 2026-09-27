import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

Future<List<QuickReactionItem>?> loadQuickReactionItems(
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
}) async {
  try {
    final db = ref.read(fluxerDatabaseProvider);
    final keysFuture = db.emojiUsageDao.getQuickReactionMixedKeys(12);
    final registryFuture = ref.read(emojiRegistryLoadedProvider.future);
    final keys = await keysFuture;
    await registryFuture;
    // Same-guild custom emoji, or global expressions plus external emoji.
    final hasGlobalEmojiAccess =
        ref.read(
          instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
        ) &&
        readChannelMessagePermissionsForComposer(
          ref,
          channelId,
        ).canUseExternalEmojis;

    final resolved = <QuickReactionItem>[];
    final seenSurrogates = <String>{};
    final seenCustomIds = <String>{};

    for (final key in keys) {
      if (resolved.length >= 4) {
        break;
      }
      if (key.startsWith('unicode:')) {
        final suffix = key.substring('unicode:'.length);
        if (suffix.isEmpty) {
          continue;
        }
        final entry =
            EmojiRegistry.entryByName(suffix) ??
            EmojiRegistry.entryBySurrogates(suffix);
        final surrogates = entry?.surrogates ?? suffix;
        if (!seenSurrogates.add(surrogates)) {
          continue;
        }
        resolved.add(UnicodeQuickReaction(surrogates));
        continue;
      }
      if (key.startsWith('custom:')) {
        final lastColon = key.lastIndexOf(':');
        if (lastColon < 'custom:'.length - 1) {
          continue;
        }
        final emojiId = key.substring(lastColon + 1);
        if (emojiId.isEmpty || !seenCustomIds.add(emojiId)) {
          continue;
        }
        final row = await db.guildEmojiDao.getById(emojiId);
        if (row == null || !(hasGlobalEmojiAccess || row.guildId == guildId)) {
          continue;
        }
        resolved.add(CustomQuickReaction(GuildEmojiEntry.fromRow(row)));
      }
    }

    for (final fallback in kQuickReactionDefaults) {
      if (resolved.length >= 4) {
        break;
      }
      if (fallback is UnicodeQuickReaction &&
          !seenSurrogates.add(fallback.emoji)) {
        continue;
      }
      resolved.add(fallback);
    }

    return resolved.take(4).toList();
  } on Object catch (e, st) {
    talker.error('Failed to load quick reaction items', e, st);
    return null;
  }
}

class MessageQuickReactionRow extends ConsumerStatefulWidget {
  const MessageQuickReactionRow({
    required this.channelId,
    required this.guildId,
    required this.onReaction,
    this.onAddMore,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final ValueChanged<QuickReactionItem> onReaction;
  final VoidCallback? onAddMore;

  @override
  ConsumerState<MessageQuickReactionRow> createState() =>
      _MessageQuickReactionRowState();
}

class _MessageQuickReactionRowState
    extends ConsumerState<MessageQuickReactionRow> {
  List<QuickReactionItem> _items = kQuickReactionDefaults;

  @override
  void initState() {
    super.initState();
    unawaited(_refreshItems());
  }

  Future<void> _refreshItems() async {
    final loaded = await loadQuickReactionItems(
      ref,
      channelId: widget.channelId,
      guildId: widget.guildId,
    );
    if (!mounted || loaded == null) {
      return;
    }
    setState(() => _items = loaded);
  }

  @override
  Widget build(BuildContext context) {
    return QuickReactionRow(
      items: _items,
      onReaction: widget.onReaction,
      onAddMore: widget.onAddMore,
    );
  }
}
