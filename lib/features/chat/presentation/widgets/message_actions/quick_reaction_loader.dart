import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

const int kQuickReactionCount = 4;

const List<String> kDefaultQuickReactionNames = [
  'thumbsup',
  'ok_hand',
  'tada',
  'heart',
];

Future<List<QuickReactionItem>?> loadQuickReactionItems(
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
}) async {
  try {
    final db = ref.read(fluxerDatabaseProvider);
    final keysFuture = ref.read(rankedEmojiUsageKeysProvider.future);
    await ref.read(emojiRegistryLoadedProvider.future);
    final keys = await keysFuture;
    final hasGlobalEmojiAccess =
        ref.read(
          instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
        ) &&
        readChannelMessagePermissionsForComposer(
          ref,
          channelId,
        ).canUseExternalEmojis;
    return await resolveQuickReactionItems(
      rankedUsageKeys: keys,
      loadCustomEmoji: (emojiId) async {
        final row = await db.guildEmojiDao.getById(emojiId);
        return row == null ? null : GuildEmojiEntry.fromRow(row);
      },
      canUseCustomEmoji: (emoji) =>
          hasGlobalEmojiAccess || emoji.guildId == guildId,
    );
  } on Object catch (e, st) {
    talker.error('Failed to load quick reaction items', e, st);
    return null;
  }
}

Future<List<QuickReactionItem>> resolveQuickReactionItems({
  required List<String> rankedUsageKeys,
  required Future<GuildEmojiEntry?> Function(String emojiId) loadCustomEmoji,
  required bool Function(GuildEmojiEntry emoji) canUseCustomEmoji,
  int count = kQuickReactionCount,
}) async {
  final result = <QuickReactionItem>[];
  final seenKeys = <String>{};

  Future<void> add(String key) async {
    if (result.length >= count || seenKeys.contains(key)) {
      return;
    }
    final QuickReactionItem? item = await _resolveUsageKey(
      key,
      loadCustomEmoji: loadCustomEmoji,
      canUseCustomEmoji: canUseCustomEmoji,
    );
    if (item == null) {
      return;
    }
    seenKeys.add(key);
    result.add(item);
  }

  for (final key in rankedUsageKeys) {
    await add(key);
    if (result.length >= count) {
      return result;
    }
  }
  final int needed = count - result.length;
  for (final name in kDefaultQuickReactionNames.take(needed)) {
    await add('$kUnicodeEmojiUsageKeyPrefix$name');
  }
  return result;
}

Future<QuickReactionItem?> _resolveUsageKey(
  String key, {
  required Future<GuildEmojiEntry?> Function(String emojiId) loadCustomEmoji,
  required bool Function(GuildEmojiEntry emoji) canUseCustomEmoji,
}) async {
  if (key.startsWith(kUnicodeEmojiUsageKeyPrefix)) {
    final String name = key.substring(kUnicodeEmojiUsageKeyPrefix.length);
    final EmojiEntry? entry =
        EmojiRegistry.entryByName(name) ??
        EmojiRegistry.entryBySurrogates(name);
    return entry == null ? null : UnicodeQuickReaction(entry.surrogates);
  }
  if (key.startsWith(kCustomEmojiUsageKeyPrefix)) {
    final int lastColon = key.lastIndexOf(':');
    if (lastColon < kCustomEmojiUsageKeyPrefix.length) {
      return null;
    }
    final String emojiId = key.substring(lastColon + 1);
    if (emojiId.isEmpty) {
      return null;
    }
    final GuildEmojiEntry? emoji = await loadCustomEmoji(emojiId);
    if (emoji == null || !canUseCustomEmoji(emoji)) {
      return null;
    }
    return CustomQuickReaction(emoji);
  }
  return null;
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
  List<QuickReactionItem> _items = const <QuickReactionItem>[];
  String? _lastLoadedGuildKey;

  @override
  void initState() {
    super.initState();
    unawaited(_refreshItems());
  }

  @override
  void didUpdateWidget(MessageQuickReactionRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.guildId != widget.guildId) {
      _lastLoadedGuildKey = null;
      unawaited(_refreshItems());
    }
  }

  String? _resolvedGuildId() {
    return widget.guildId ?? resolveGuildIdForChannel(ref, widget.channelId);
  }

  String _guildLoadKey(String? guildId) =>
      '${widget.channelId}:${guildId ?? ''}';

  Future<void> _refreshItems() async {
    final String? guildId = _resolvedGuildId();
    final String loadKey = _guildLoadKey(guildId);
    _lastLoadedGuildKey = loadKey;
    final loaded = await loadQuickReactionItems(
      ref,
      channelId: widget.channelId,
      guildId: guildId,
    );
    if (!mounted ||
        loaded == null ||
        _guildLoadKey(_resolvedGuildId()) != loadKey) {
      return;
    }
    setState(() => _items = loaded);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(rankedEmojiUsageKeysProvider, (_, _) {
      _lastLoadedGuildKey = null;
      unawaited(_refreshItems());
    });
    final String loadKey = _guildLoadKey(_resolvedGuildId());
    if (loadKey != _lastLoadedGuildKey) {
      unawaited(_refreshItems());
    }
    return QuickReactionRow(
      items: _items,
      onReaction: widget.onReaction,
      onAddMore: widget.onAddMore,
    );
  }
}
