import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_attribution.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/features/emoji/providers/emoji_info_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_avatar.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kEmojiPreviewSize = 65.6;

class EmojiInfoBottomSheet {
  EmojiInfoBottomSheet._();

  static Future<void> show(
    BuildContext context, {
    required EmojiInfoData emoji,
  }) {
    FluxerHaptics.medium();
    return FluxerBottomSheet.show<void>(
      context,
      maxHeight: 0.45,
      builder: (sheetContext, close) {
        return _EmojiInfoBottomSheetContent(emoji: emoji);
      },
    );
  }
}

void openEmojiInfoBottomSheet(
  BuildContext context, {
  required EmojiInfoData emoji,
}) {
  unawaited(EmojiInfoBottomSheet.show(context, emoji: emoji));
}

void handleFluxerMarkdownEmojiLongPress(
  BuildContext context, {
  required String? emojiId,
  required String name,
  required bool animated,
  required bool isCustom,
}) {
  openEmojiInfoBottomSheet(
    context,
    emoji: EmojiInfoData.fromMarkdownLongPress(
      emojiId: emojiId,
      name: name,
      animated: animated,
    ),
  );
}

FluxerEmojiLongPressHandler get fluxerMarkdownEmojiLongPressHandler =>
    handleFluxerMarkdownEmojiLongPress;

class _EmojiInfoBottomSheetContent extends ConsumerWidget {
  const _EmojiInfoBottomSheetContent({required this.emoji});

  final EmojiInfoData emoji;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final resolvedAsync = ref.watch(emojiInfoResolvedProvider(emoji));
    final favoriteKeys =
        ref.watch(favoriteEmojiKeysProvider).value ?? const <String>[];

    final resolved =
        resolvedAsync.value ??
        const EmojiInfoResolved(
          attribution: EmojiAttribution(
            type: EmojiAttributionType.defaultEmoji,
          ),
        );
    final favoriteKey = resolved.favoriteKey;
    final isFavorite =
        favoriteKey != null && favoriteKeys.contains(favoriteKey);
    final showGuildSection =
        resolved.attribution.type == EmojiAttributionType.customGuild &&
        resolved.attribution.guild != null;

    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _EmojiPreview(emoji: emoji),
              SizedBox(width: layout.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      emoji.displayName,
                      style: context.textStyles.heading.copyWith(
                        fontSize: 18,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    SizedBox(height: layout.s1),
                    Text(
                      emojiAttributionDescription(l10n, resolved.attribution),
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (favoriteKey != null)
                _FavoriteButton(
                  isFavorite: isFavorite,
                  onToggle: () {
                    FluxerHaptics.selection();
                    unawaited(
                      ref
                          .read(favoriteEmojiKeysProvider.notifier)
                          .toggle(favoriteKey),
                    );
                  },
                  addLabel: l10n.emojiInfoAddToFavorites,
                  removeLabel: l10n.emojiInfoRemoveFromFavorites,
                ),
            ],
          ),
          if (showGuildSection) ...[
            SizedBox(height: layout.s4),
            Divider(color: context.colors.borderColor, height: 1),
            SizedBox(height: layout.s4),
            Text(
              l10n.emojiInfoFromHeader.toUpperCase(),
              style: context.textStyles.label.copyWith(
                color: context.colors.textPrimaryMuted,
                letterSpacing: 0.4,
              ),
            ),
            SizedBox(height: layout.s3),
            _GuildSourceRow(
              guild: resolved.attribution.guild!,
              l10n: l10n,
              isVerified: resolved.attribution.isVerified,
            ),
          ],
        ],
      ),
    );
  }
}

class _EmojiPreview extends StatelessWidget {
  const _EmojiPreview({required this.emoji});

  final EmojiInfoData emoji;

  @override
  Widget build(BuildContext context) {
    if (emoji.isCustom) {
      return SizedBox(
        width: _kEmojiPreviewSize,
        height: _kEmojiPreviewSize,
        child: CachedEmojiImage(
          emojiId: emoji.id!,
          animated: emoji.animated,
          requestSize: kCustomEmojiFetchSize,
          size: _kEmojiPreviewSize,
        ),
      );
    }

    return SizedBox(
      width: _kEmojiPreviewSize,
      height: _kEmojiPreviewSize,
      child: UnicodeEmojiWidget(
        emoji: emoji.unicodeSurrogate,
        size: _kEmojiPreviewSize,
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.isFavorite,
    required this.onToggle,
    required this.addLabel,
    required this.removeLabel,
  });

  final bool isFavorite;
  final VoidCallback onToggle;
  final String addLabel;
  final String removeLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: isFavorite ? removeLabel : addLabel,
      child: FluxerGestureDetector(
        onTap: onToggle,
        child: Padding(
          padding: EdgeInsets.all(context.layout.s1),
          child: Icon(
            isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
            size: 24,
            color: isFavorite
                ? context.colors.statusWarning
                : context.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _GuildSourceRow extends StatelessWidget {
  const _GuildSourceRow({
    required this.guild,
    required this.l10n,
    required this.isVerified,
  });

  final Guild guild;
  final FluxerLocalizations l10n;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final subtitle = guild.isDiscoverable
        ? l10n.emojiInfoDiscoverableCommunity
        : l10n.emojiInfoPrivateCommunity;

    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: GuildBottomSheetAvatar(guild: guild),
        ),
        SizedBox(width: layout.s3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      guild.name,
                      style: context.textStyles.label.copyWith(
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (isVerified) ...[
                    SizedBox(width: layout.s1),
                    Tooltip(
                      message: l10n.emojiInfoVerifiedCommunity,
                      child: Icon(
                        PhosphorIconsFill.sealCheck,
                        size: 16,
                        color: context.colors.brandPrimary,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: layout.s1_5),
              Text(
                subtitle,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
