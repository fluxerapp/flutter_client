import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_reaction_loader.g.dart';

const int kQuickReactionCount = 4;

const List<String> kDefaultQuickReactionNames = [
  'thumbsup',
  'ok_hand',
  'tada',
  'heart',
];

typedef ResolvedQuickReactions = ({
  String? userId,
  String channelId,
  String? guildId,
  List<QuickReactionItem> items,
});

@Riverpod(keepAlive: true)
class LastResolvedQuickReactions extends _$LastResolvedQuickReactions {
  @override
  ResolvedQuickReactions? build() => null;

  void remember({
    required String? userId,
    required String channelId,
    required String? guildId,
    required List<QuickReactionItem> items,
  }) {
    state = (
      userId: userId,
      channelId: channelId,
      guildId: guildId,
      items: items,
    );
  }
}

List<QuickReactionItem> quickReactionItemsFor(
  ResolvedQuickReactions? last, {
  required String? userId,
  required String channelId,
  required String? guildId,
}) {
  if (last == null || last.userId != userId) {
    return const <QuickReactionItem>[];
  }
  if (last.channelId == channelId && last.guildId == guildId) {
    return last.items;
  }
  return _withDefaults(
    last.items.where(
      (item) => switch (item) {
        UnicodeQuickReaction() => true,
        CustomQuickReaction(:final emoji) => emoji.guildId == guildId,
      },
    ),
  );
}

List<QuickReactionItem> _withDefaults(Iterable<QuickReactionItem> items) {
  final result = <QuickReactionItem>[];
  final seenSurrogates = <String>{};
  final seenCustomIds = <String>{};
  for (final item in items.followedBy(kQuickReactionDefaults)) {
    if (result.length >= kQuickReactionCount) {
      break;
    }
    final bool isNew = switch (item) {
      UnicodeQuickReaction(:final emoji) => seenSurrogates.add(emoji),
      CustomQuickReaction(:final emoji) => seenCustomIds.add(emoji.id),
    };
    if (isNew) {
      result.add(item);
    }
  }
  return result;
}

Future<List<QuickReactionItem>?> loadQuickReactionItems(
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
}) async {
  try {
    final db = ref.read(fluxerDatabaseProvider);
    final keysFuture = ref.read(rankedEmojiUsageKeysProvider.future);
    await EmojiRegistry.ensureLoaded();
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
  String? _requestedScope;

  Future<void> _load(String? guildId) async {
    final LastResolvedQuickReactions cache = ref.read(
      lastResolvedQuickReactionsProvider.notifier,
    );
    final String? userId = ref.read(currentUserIdProvider);
    final String channelId = widget.channelId;
    final List<QuickReactionItem>? items = await loadQuickReactionItems(
      ref,
      channelId: channelId,
      guildId: guildId,
    );
    if (items == null) {
      return;
    }
    cache.remember(
      userId: userId,
      channelId: channelId,
      guildId: guildId,
      items: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? guildId =
        widget.guildId ?? resolveGuildIdForChannel(ref, widget.channelId);
    ref.listen(rankedEmojiUsageKeysProvider, (_, _) {
      unawaited(_load(guildId));
    });
    final String scope = '${widget.channelId}:${guildId ?? ''}';
    if (scope != _requestedScope) {
      _requestedScope = scope;
      unawaited(_load(guildId));
    }
    return QuickReactionRow(
      items: quickReactionItemsFor(
        ref.watch(lastResolvedQuickReactionsProvider),
        userId: ref.watch(currentUserIdProvider),
        channelId: widget.channelId,
        guildId: guildId,
      ),
      onReaction: widget.onReaction,
      onAddMore: widget.onAddMore,
    );
  }
}
