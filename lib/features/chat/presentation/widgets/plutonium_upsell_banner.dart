import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
const _kPlutoniumUrl = 'https://fluxer.app/plutonium';

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
    final dismissed =
        ref.watch(plutoniumUpsellDismissedProvider).value ?? false;
    if (dismissed) {
      return const SizedBox.shrink();
    }

    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    final emojiLabel = l10n.emojiPlutoniumUpsellCustomEmoji(lockedEmojiCount);
    final communityLabel =
        l10n.emojiPlutoniumUpsellCommunity(lockedGuilds.length);
    final text = l10n.emojiPlutoniumUpsellText(emojiLabel, communityLabel);

    final shownGuilds = lockedGuilds.take(_kCommunityIconLimit).toList();
    final extraCount = lockedGuilds.length > _kCommunityIconLimit
        ? lockedGuilds.length - _kCommunityIconLimit
        : 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.brandPrimary,
          borderRadius: layout.radiusMd,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2, right: 8),
                child: PhosphorIcon(
                  PhosphorIconsFill.crown,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                    if (shownGuilds.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      _CommunityIconRow(
                        guilds: shownGuilds,
                        extraCount: extraCount,
                      ),
                    ],
                    if (previewEmojis.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      _PreviewEmojiRow(emojis: previewEmojis),
                    ],
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _GetPlutoniumButton(l10n: l10n),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => ref
                              .read(plutoniumUpsellDismissedProvider.notifier)
                              .dismiss(),
                          child: Text(
                            l10n.emojiPlutoniumUpsellDismiss,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(255, 255, 255, 0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GetPlutoniumButton extends StatelessWidget {
  const _GetPlutoniumButton({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () async {
      // TODO: open window in app (stripe)
      await handleExternalLinkTap(context, _kPlutoniumUrl);
    },
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          l10n.emojiPlutoniumUpsellButton,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
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
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(255, 255, 255, 0.85),
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
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.25),
          ),
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
  Widget build(BuildContext context) => ColoredBox(
    color: const Color.fromRGBO(255, 255, 255, 0.1),
    child: Center(
      child: Text(
        guild.name.isNotEmpty ? guild.name[0].toUpperCase() : '?',
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),
  );
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
                  cacheKey: 'emoji_${e.id}',
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                  placeholder: (_, _) =>
                      const SizedBox(width: 32, height: 32),
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
