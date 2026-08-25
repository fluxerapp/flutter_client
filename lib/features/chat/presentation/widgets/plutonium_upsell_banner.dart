import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/ui/plutonium_upsell/fluxer_plutonium_upsell.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plutonium_upsell_banner.g.dart';

@Riverpod(keepAlive: true)
class PlutoniumUpsellDismissed extends _$PlutoniumUpsellDismissed {
  @override
  Future<bool> build() async {
    final userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return false;
    }
    final db = ref.read(fluxerDatabaseProvider);
    return db.userPreferencesDao.getPlutoniumUpsellDismissed(userId);
  }

  Future<void> dismiss() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    state = const AsyncData(true);
    final db = ref.read(fluxerDatabaseProvider);
    await db.userPreferencesDao.setPlutoniumUpsellDismissed(
      userId,
      dismissed: true,
    );
  }
}

const _kCommunityIconLimit = 4;

class PlutoniumUpsellBanner extends ConsumerWidget {
  const PlutoniumUpsellBanner({
    required this.lockedEmojiCount,
    required this.lockedGuilds,
    required this.previewEmojis,
    super.key,
  });

  final int lockedEmojiCount;
  final List<Guild> lockedGuilds;

  final List<GuildEmojiEntry> previewEmojis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(shouldShowPremiumCommerceProvider)) {
      return const SizedBox.shrink();
    }
    final dismissed =
        ref.watch(plutoniumUpsellDismissedProvider).value ?? false;
    if (dismissed) {
      return const SizedBox.shrink();
    }

    final l10n = FluxerLocalizations.of(context);

    final emojiLabel = l10n.emojiPlutoniumUpsellCustomEmoji(lockedEmojiCount);
    final communityLabel = l10n.emojiPlutoniumUpsellCommunity(
      lockedGuilds.length,
    );
    final text = l10n.emojiPlutoniumUpsellText(emojiLabel, communityLabel);

    final shownGuilds = lockedGuilds.take(_kCommunityIconLimit).toList();
    final extraCount = lockedGuilds.length > _kCommunityIconLimit
        ? lockedGuilds.length - _kCommunityIconLimit
        : 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: FluxerPlutoniumUpsell(
        text: text,
        onDismiss: () =>
            ref.read(plutoniumUpsellDismissedProvider.notifier).dismiss(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (shownGuilds.isNotEmpty)
              _CommunityIconRow(guilds: shownGuilds, extraCount: extraCount),
            if (previewEmojis.isNotEmpty)
              _PreviewEmojiRow(emojis: previewEmojis),
          ],
        ),
      ),
    );
  }
}

class _CommunityIconRow extends StatelessWidget {
  const _CommunityIconRow({required this.guilds, required this.extraCount});

  final List<Guild> guilds;
  final int extraCount;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      ...guilds.map((g) => _CommunityIcon(guild: g)),
      if (extraCount > 0)
        Container(
          margin: const EdgeInsets.only(left: 4),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.15),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            '+$extraCount',
            style: context.textStyles.timestamp.copyWith(
              color: const Color.fromRGBO(255, 255, 255, 0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
    ],
  );
}

class _CommunityIcon extends StatelessWidget {
  const _CommunityIcon({required this.guild});

  final Guild guild;

  @override
  Widget build(BuildContext context) {
    final iconUrl = guild.iconUrl;
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.25)),
          color: const Color.fromRGBO(255, 255, 255, 0.1),
        ),
        child: ClipOval(
          child: iconUrl != null
              ? CachedNetworkImage(
                  imageUrl: iconUrl,
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => _GuildInitial(guild: guild),
                )
              : _GuildInitial(guild: guild),
        ),
      ),
    );
  }
}

class _GuildInitial extends StatelessWidget {
  const _GuildInitial({required this.guild});

  final Guild guild;

  @override
  Widget build(BuildContext context) {
    final initials = abbreviateGuildName(guild.name);
    final initialsLength = guildNameInitialsLength(guild.name);
    return ColoredBox(
      color: const Color.fromRGBO(255, 255, 255, 0.1),
      child: Center(
        child: Text(
          initials,
          style: context.textStyles.smallText.copyWith(
            fontSize: _plutoniumGuildInitialsFontSize(initialsLength),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

double _plutoniumGuildInitialsFontSize(int initialsLength) {
  if (initialsLength <= 2) {
    return 9;
  }
  if (initialsLength <= kGuildIconInitialsMaxLength) {
    return 7.5;
  }
  return 6.5;
}

class _PreviewEmojiRow extends StatelessWidget {
  const _PreviewEmojiRow({required this.emojis});

  final List<GuildEmojiEntry> emojis;

  @override
  Widget build(BuildContext context) => Row(
    children: emojis
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.08),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.08),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: e.url,
                  cacheKey: e.cacheKeyForSize(kCustomEmojiFetchSize),
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                  placeholder: (_, _) => const SizedBox(width: 32, height: 32),
                  errorBuilder: (_, _, _) =>
                      const SizedBox(width: 32, height: 32),
                ),
              ),
            ),
          ),
        )
        .toList(),
  );
}

/// Returns up to [limit] items in a deterministic random order based on [seed].
List<T> pickRandomItems<T>(List<T> items, int limit, int seed) {
  if (items.isEmpty || limit <= 0) {
    return const [];
  }
  final rng = Random(seed);
  final shuffled = List<T>.from(items)..shuffle(rng);
  return shuffled.take(limit).toList();
}
