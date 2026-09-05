import 'dart:math' as math;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kComposerAutocompletePanelMaxHeight = 490;
const double kComposerAutocompletePanelSafeGap = 8;
const double kComposerAutocompleteScrollRowStride = 48;
const double _kAutocompleteBorderRadius = 8;
const double _kAutocompleteScrollerVerticalPadding = 8;
const double _kAutocompleteRowGap = 4;
const double _kAutocompleteButtonHorizontalPadding = 6;
const double _kAutocompleteRowInnerPadding = 8;
const double _kAutocompleteNameFontSize = 16;
const double _kAutocompleteDescFontSize = 12;
const double _kAutocompleteDescMarginLeft = 16;
const double _kAutocompleteAvatarSize = 28;
const double _kAutocompleteAvatarGap = 8;
const double _kAutocompleteEmojiPreviewSize = 24;
const double _kAutocompleteMediaPreviewSize = 32;
const double _kAutocompleteGifTileWidth = 192;
const double _kAutocompleteGifTileHeight = 128;
const double _kAutocompleteGifContainerHeight = 192;
const Duration _kAutocompletePanelExpandDuration = Duration(milliseconds: 220);

double composerAutocompletePanelMaxHeight({required double availableHeight}) {
  return math.max(
    0,
    math.min(kComposerAutocompletePanelMaxHeight, availableHeight),
  );
}

({bool openAbove, double maxHeight}) composerAutocompleteOverlayPlacement({
  required Rect target,
  required Size overlaySize,
  required double topSafePadding,
  required double bottomSafePadding,
}) {
  final double above = composerAutocompletePanelMaxHeight(
    availableHeight:
        target.top - topSafePadding - kComposerAutocompletePanelSafeGap,
  );
  final double below = composerAutocompletePanelMaxHeight(
    availableHeight:
        overlaySize.height -
        target.bottom -
        bottomSafePadding -
        kComposerAutocompletePanelSafeGap,
  );
  final bool openAbove = above >= below;
  return (openAbove: openAbove, maxHeight: openAbove ? above : below);
}

typedef ComposerAutocompletePanelHost =
    ValueNotifier<ComposerAutocompletePanelSnapshot?>;

class ComposerAutocompleteGifTile {
  const ComposerAutocompleteGifTile({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  final String id;
  final String title;
  final String imageUrl;
  final VoidCallback onTap;
}

class ComposerAutocompletePanelRow {
  const ComposerAutocompletePanelRow({
    required this.title,
    required this.onTap,
    this.subtitle,
    this.titleColor,
    this.channelRowType,
    this.userAvatarUserId,
    this.userAvatarImageUrl,
    this.userAvatarFallbackText,
    this.userAvatarColor,
    this.userAvatarStatus,
    this.emojiSurrogates,
    this.emojiImageUrl,
    this.emojiCacheKey,
    this.mediaPreviewUrl,
    this.mediaPreviewCacheKey,
    this.isDivider = false,
    this.isSectionHeading = false,
  });

  final String title;
  final String? subtitle;
  final Color? titleColor;
  final VoidCallback onTap;
  final ChannelType? channelRowType;
  final String? userAvatarUserId;
  final String? userAvatarImageUrl;
  final String? userAvatarFallbackText;
  final int? userAvatarColor;
  final String? userAvatarStatus;
  final String? emojiSurrogates;
  final String? emojiImageUrl;
  final String? emojiCacheKey;
  final String? mediaPreviewUrl;
  final String? mediaPreviewCacheKey;
  final bool isDivider;
  final bool isSectionHeading;
}

class ComposerAutocompletePanelSnapshot {
  const ComposerAutocompletePanelSnapshot({
    required this.rows,
    required this.selectedIndex,
    this.heading,
    this.gifs = const <ComposerAutocompleteGifTile>[],
    this.gifEmpty = false,
  });

  final List<ComposerAutocompletePanelRow> rows;
  final int selectedIndex;
  final String? heading;
  final List<ComposerAutocompleteGifTile> gifs;
  final bool gifEmpty;
}

/// Renders [ComposerAutocompletePanelSnapshot] from [host], anchored to the
/// bottom of the parent stack over the message list.
class ComposerAutocompletePanelStrip extends StatelessWidget {
  const ComposerAutocompletePanelStrip({
    required this.host,
    required this.scrollController,
    super.key,
  });

  final ComposerAutocompletePanelHost host;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ComposerAutocompletePanelSnapshot?>(
      valueListenable: host,
      builder:
          (
            BuildContext context,
            ComposerAutocompletePanelSnapshot? snap,
            Widget? _,
          ) {
            final bool isOpen =
                snap != null &&
                (snap.rows.isNotEmpty || snap.gifs.isNotEmpty || snap.gifEmpty);
            return RepaintBoundary(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double width = constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : MediaQuery.sizeOf(context).width;
                  final double availableHeight = constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : MediaQuery.sizeOf(context).height -
                            MediaQuery.paddingOf(context).top;
                  final double maxHeight = composerAutocompletePanelMaxHeight(
                    availableHeight: availableHeight,
                  );
                  return ClipRect(
                    child: AnimatedSize(
                      duration: _kAutocompletePanelExpandDuration,
                      curve: Curves.easeOutCubic,
                      alignment: Alignment.bottomCenter,
                      child: isOpen
                          ? SizedBox(
                              width: width,
                              child: ComposerAutocompletePanelBody(
                                snap: snap,
                                scrollController: scrollController,
                                maxHeight: maxHeight,
                              ),
                            )
                          : SizedBox(width: width, height: 0),
                    ),
                  );
                },
              ),
            );
          },
    );
  }
}

/// Bottom-aligned [Stack] child with a bounded height.
class ComposerAutocompletePanelLayer extends StatelessWidget {
  const ComposerAutocompletePanelLayer({
    required this.host,
    required this.scrollController,
    super.key,
  });

  final ComposerAutocompletePanelHost host;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ComposerAutocompletePanelStrip(
          host: host,
          scrollController: scrollController,
        ),
      ),
    );
  }
}

class ComposerAutocompletePanelBody extends StatelessWidget {
  const ComposerAutocompletePanelBody({
    required this.snap,
    required this.scrollController,
    this.maxHeight = kComposerAutocompletePanelMaxHeight,
    super.key,
  });

  final ComposerAutocompletePanelSnapshot snap;
  final ScrollController scrollController;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final Color panelBg = context.colors.backgroundPrimary;
    final Color accent = context.colors.backgroundModifierAccent;
    return Semantics(
      container: true,
      label: FluxerLocalizations.of(context).composerAutocompleteSuggestions,
      child: Listener(
        behavior: HitTestBehavior.opaque,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: panelBg,
            borderRadius: BorderRadius.circular(_kAutocompleteBorderRadius),
            border: Border.all(color: accent),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x3D000000),
                offset: Offset(0, 8),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_kAutocompleteBorderRadius),
            child: Material(
              color: panelBg,
              shadowColor: Colors.transparent,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: maxHeight),
                child: snap.gifEmpty || snap.gifs.isNotEmpty
                    ? ComposerAutocompleteGifGrid(
                        gifs: snap.gifs,
                        selectedIndex: snap.selectedIndex,
                        empty: snap.gifEmpty,
                      )
                    : ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(
                          vertical: _kAutocompleteScrollerVerticalPadding,
                        ),
                        shrinkWrap: true,
                        itemCount:
                            snap.rows.length + (snap.heading != null ? 1 : 0),
                        separatorBuilder: (BuildContext _, int index) {
                          if (snap.heading != null && index == 0) {
                            return const SizedBox.shrink();
                          }
                          return const SizedBox(height: _kAutocompleteRowGap);
                        },
                        itemBuilder: (BuildContext _, int i) {
                          if (snap.heading != null) {
                            if (i == 0) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  12,
                                  4,
                                  12,
                                  4,
                                ),
                                child: Text(
                                  snap.heading!.toUpperCase(),
                                  style: context.textStyles.timestamp.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.colors.textPrimaryMuted,
                                    letterSpacing: 0,
                                  ),
                                ),
                              );
                            }
                            i -= 1;
                          }
                          final ComposerAutocompletePanelRow row = snap.rows[i];
                          if (row.isDivider) {
                            return Divider(
                              height: 1,
                              thickness: 1,
                              color: context.colors.backgroundModifierHover,
                            );
                          }
                          if (row.isSectionHeading) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                              child: Text(
                                row.title.toUpperCase(),
                                style: context.textStyles.timestamp.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.textPrimaryMuted,
                                ),
                              ),
                            );
                          }
                          final int selectedIndex = snap.selectedIndex;
                          return ComposerAutocompletePanelListTile(
                            title: row.title,
                            isSelected: i == selectedIndex,
                            onTap: row.onTap,
                            subtitle: row.subtitle,
                            titleColor: row.titleColor,
                            channelRowType: row.channelRowType,
                            userAvatarUserId: row.userAvatarUserId,
                            userAvatarImageUrl: row.userAvatarImageUrl,
                            userAvatarFallbackText: row.userAvatarFallbackText,
                            userAvatarColor: row.userAvatarColor,
                            userAvatarStatus: row.userAvatarStatus,
                            emojiSurrogates: row.emojiSurrogates,
                            emojiImageUrl: row.emojiImageUrl,
                            emojiCacheKey: row.emojiCacheKey,
                            mediaPreviewUrl: row.mediaPreviewUrl,
                            mediaPreviewCacheKey: row.mediaPreviewCacheKey,
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// [FluxerAvatar.user] uses [BigInt.parse] on [userId] for default avatars;
/// only pass ids that parse as integers (e.g. Discord snowflakes).
String? _snowflakeUserIdForDefaultAvatar(String? userId) {
  if (userId == null || userId.isEmpty) {
    return null;
  }
  if (BigInt.tryParse(userId) != null) {
    return userId;
  }
  return null;
}

/// A single suggestion row shared by every autocomplete kind: mention (avatar),
/// channel (glyph), or emoji (unicode glyph / custom network image).
class ComposerAutocompletePanelListTile extends StatelessWidget {
  const ComposerAutocompletePanelListTile({
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.subtitle,
    this.titleColor,
    this.channelRowType,
    this.userAvatarUserId,
    this.userAvatarImageUrl,
    this.userAvatarFallbackText,
    this.userAvatarColor,
    this.userAvatarStatus,
    this.emojiSurrogates,
    this.emojiImageUrl,
    this.emojiCacheKey,
    this.mediaPreviewUrl,
    this.mediaPreviewCacheKey,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Color? titleColor;
  final bool isSelected;
  final VoidCallback onTap;
  final ChannelType? channelRowType;
  final String? userAvatarUserId;
  final String? userAvatarImageUrl;
  final String? userAvatarFallbackText;
  final int? userAvatarColor;
  final String? userAvatarStatus;
  final String? emojiSurrogates;
  final String? emojiImageUrl;
  final String? emojiCacheKey;
  final String? mediaPreviewUrl;
  final String? mediaPreviewCacheKey;

  bool get _showsUserAvatar {
    return userAvatarFallbackText != null &&
        userAvatarFallbackText!.trim().isNotEmpty;
  }

  bool get _showsChannelGlyph {
    return channelRowType != null;
  }

  bool get _showsEmojiPreview {
    return emojiSurrogates != null || emojiImageUrl != null;
  }

  bool get _showsMediaPreview {
    return mediaPreviewUrl != null;
  }

  @override
  Widget build(BuildContext context) {
    final Color hoverFill = context.colors.backgroundModifierHover;
    final TextStyle titleStyle = context.textStyles.bodyMedium.copyWith(
      fontSize: _kAutocompleteNameFontSize,
      height: 1.25,
      color: titleColor ?? context.colors.textPrimary,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _kAutocompleteButtonHorizontalPadding,
      ),
      child: Material(
        color: isSelected ? hoverFill : Colors.transparent,
        borderRadius: BorderRadius.circular(_kAutocompleteBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(_kAutocompleteBorderRadius),
          onTap: onTap,
          hoverColor: hoverFill,
          child: Padding(
            padding: const EdgeInsets.all(_kAutocompleteRowInnerPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      if (_showsUserAvatar) ...<Widget>[
                        FluxerAvatar.userPresence(
                          imageUrl: userAvatarImageUrl,
                          fallbackText: userAvatarFallbackText,
                          userId:
                              _snowflakeUserIdForDefaultAvatar(
                                userAvatarUserId,
                              ) ??
                              userAvatarUserId ??
                              '',
                          avatarColor: userAvatarColor,
                          size: _kAutocompleteAvatarSize,
                        ),
                        const SizedBox(width: _kAutocompleteAvatarGap),
                      ],
                      if (_showsChannelGlyph) ...<Widget>[
                        ChannelIcon(
                          type: channelRowType!,
                          size: 16,
                          color: context.colors.textTertiary,
                        ),
                        const SizedBox(width: _kAutocompleteAvatarGap),
                      ],
                      if (_showsMediaPreview) ...<Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            width: _kAutocompleteMediaPreviewSize,
                            height: _kAutocompleteMediaPreviewSize,
                            child: CachedNetworkImage(
                              imageUrl: mediaPreviewUrl!,
                              cacheKey: mediaPreviewCacheKey,
                              width: _kAutocompleteMediaPreviewSize,
                              height: _kAutocompleteMediaPreviewSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: _kAutocompleteAvatarGap),
                      ],
                      if (_showsEmojiPreview) ...<Widget>[
                        SizedBox(
                          width: _kAutocompleteEmojiPreviewSize,
                          height: _kAutocompleteEmojiPreviewSize,
                          child: emojiSurrogates != null
                              ? UnicodeEmojiWidget(
                                  emoji: emojiSurrogates!,
                                  size: _kAutocompleteEmojiPreviewSize,
                                )
                              : CachedNetworkImage(
                                  imageUrl: emojiImageUrl!,
                                  cacheKey: emojiCacheKey,
                                  width: _kAutocompleteEmojiPreviewSize,
                                  height: _kAutocompleteEmojiPreviewSize,
                                ),
                        ),
                        const SizedBox(width: _kAutocompleteAvatarGap),
                      ],
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                if (subtitle != null &&
                    subtitle!.trim().isNotEmpty) ...<Widget>[
                  const SizedBox(width: _kAutocompleteDescMarginLeft),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: context.textStyles.timestamp.copyWith(
                          fontSize: _kAutocompleteDescFontSize,
                          height: 1.33,
                          color: context.colors.textPrimaryMuted,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ComposerAutocompleteGifGrid extends StatelessWidget {
  const ComposerAutocompleteGifGrid({
    required this.gifs,
    required this.selectedIndex,
    required this.empty,
    super.key,
  });

  final List<ComposerAutocompleteGifTile> gifs;
  final int selectedIndex;
  final bool empty;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool light = Theme.of(context).brightness == Brightness.light;
    final Color selectedBorder = light
        ? context.colors.brandPrimary
        : context.colors.brandPrimaryLight;
    return SizedBox(
      height: _kAutocompleteGifContainerHeight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              l10n.composerAutocompleteGifsHeading,
              style: context.textStyles.bodyMedium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: context.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            if (empty || gifs.isEmpty)
              Expanded(child: _ComposerAutocompleteGifEmpty(l10n: l10n))
            else
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: gifs.length,
                  separatorBuilder: (BuildContext _, int _) =>
                      const SizedBox(width: 4),
                  itemBuilder: (BuildContext _, int i) {
                    final ComposerAutocompleteGifTile gif = gifs[i];
                    final bool selected = i == selectedIndex;
                    return Semantics(
                      button: true,
                      selected: selected,
                      label: gif.title,
                      child: GestureDetector(
                        onTap: gif.onTap,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.backgroundSecondary,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selected
                                  ? selectedBorder
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: SizedBox(
                              width: _kAutocompleteGifTileWidth,
                              height: _kAutocompleteGifTileHeight,
                              child: CachedNetworkImage(
                                imageUrl: gif.imageUrl,
                                fit: BoxFit.cover,
                                width: _kAutocompleteGifTileWidth,
                                height: _kAutocompleteGifTileHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ComposerAutocompleteGifEmpty extends StatelessWidget {
  const _ComposerAutocompleteGifEmpty({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsBold.smileySad,
              size: 32,
              color: colors.textTertiary,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.composerAutocompleteNoGifs,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.gifPickerNoResultsDescription,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
