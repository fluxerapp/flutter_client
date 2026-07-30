import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/emoji_picker_rendering_policy.dart';

Future<void> prefetchEmojiPickerCustomEmojis({
  required BuildContext context,
  required List<GuildEmojiEntry> emojis,
  required bool prefetchAnimated,
  bool Function()? isCancelled,
  int limit = kEmojiPickerPrecacheLimit,
  int concurrency = kEmojiPickerPrecacheConcurrency,
  int requestSize = kCustomEmojiPickerFetchSize,
}) async {
  if (emojis.isEmpty || !context.mounted) {
    return;
  }
  final List<GuildEmojiEntry> targets = emojis
      .take(limit)
      .toList(growable: false);
  var nextIndex = 0;
  Future<void> prefetchUrl(String url, String cacheKey) async {
    if (!context.mounted || (isCancelled?.call() ?? false)) {
      return;
    }
    try {
      await precacheImage(
        CachedNetworkImageProvider(url, cacheKey: cacheKey),
        context,
      );
    } on Object {
      return;
    }
  }

  Future<void> worker() async {
    while (nextIndex < targets.length) {
      if (isCancelled?.call() ?? false) {
        return;
      }
      final GuildEmojiEntry emoji = targets[nextIndex++];
      final String staticUrl = FluxerMediaUrl.customEmoji(
        id: emoji.id,
        size: requestSize,
      );
      final String staticKey = 'emoji_${emoji.id}_s_$requestSize';
      await prefetchUrl(staticUrl, staticKey);
      if (!prefetchAnimated || !emoji.animated) {
        continue;
      }
      final String animatedUrl = FluxerMediaUrl.customEmoji(
        id: emoji.id,
        animated: true,
        size: requestSize,
      );
      final String animatedKey = 'emoji_${emoji.id}_a_$requestSize';
      await prefetchUrl(animatedUrl, animatedKey);
    }
  }

  final int workerCount = concurrency.clamp(1, targets.length);
  await Future.wait(List<Future<void>>.generate(workerCount, (_) => worker()));
}

List<GuildEmojiEntry> emojiPickerPrefetchTargets({
  required List<GuildEmojiEntry> allGuildEmojis,
  required String? activeGuildId,
  required List<GuildEmojiEntry> favoriteCustomEmojis,
  required List<GuildEmojiEntry> frecentCustomEmojis,
}) {
  final List<GuildEmojiEntry> targets = <GuildEmojiEntry>[];
  final Set<String> seenIds = <String>{};
  void addEmojis(Iterable<GuildEmojiEntry> emojis) {
    for (final GuildEmojiEntry emoji in emojis) {
      if (seenIds.add(emoji.id)) {
        targets.add(emoji);
      }
    }
  }

  if (activeGuildId != null) {
    addEmojis(
      allGuildEmojis.where(
        (GuildEmojiEntry emoji) => emoji.guildId == activeGuildId,
      ),
    );
  }
  addEmojis(favoriteCustomEmojis);
  addEmojis(frecentCustomEmojis);
  if (targets.isEmpty) {
    addEmojis(allGuildEmojis);
  }
  return targets;
}

Future<void> prefetchEmojiPickerForGuildContext({
  required BuildContext context,
  required List<GuildEmojiEntry> allGuildEmojis,
  required String? activeGuildId,
  required List<GuildEmojiEntry> favoriteCustomEmojis,
  required List<GuildEmojiEntry> frecentCustomEmojis,
  required bool isMobile,
  bool Function()? isCancelled,
}) {
  return prefetchEmojiPickerCustomEmojis(
    context: context,
    emojis: emojiPickerPrefetchTargets(
      allGuildEmojis: allGuildEmojis,
      activeGuildId: activeGuildId,
      favoriteCustomEmojis: favoriteCustomEmojis,
      frecentCustomEmojis: frecentCustomEmojis,
    ),
    prefetchAnimated: emojiPickerPrefetchAnimatedUrls(isMobile: isMobile),
    isCancelled: isCancelled,
  );
}

void scheduleEmojiPickerWarmup({
  required WidgetRef ref,
  required BuildContext context,
  bool Function()? isCancelled,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted || (isCancelled?.call() ?? false)) {
      return;
    }
    final List<GuildEmojiEntry> allGuildEmojis =
        ref.read(allGuildEmojisForPickerProvider).value ??
        const <GuildEmojiEntry>[];
    if (allGuildEmojis.isEmpty) {
      return;
    }
    unawaited(
      prefetchEmojiPickerCustomEmojis(
        context: context,
        emojis: emojiPickerPrefetchTargets(
          allGuildEmojis: allGuildEmojis,
          activeGuildId: ref.read(contextualGuildIdProvider),
          favoriteCustomEmojis: const <GuildEmojiEntry>[],
          frecentCustomEmojis: const <GuildEmojiEntry>[],
        ),
        prefetchAnimated: false,
        isCancelled: isCancelled,
      ),
    );
  });
}
