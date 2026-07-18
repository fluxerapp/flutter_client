part of 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';

const double kComposerAutocompletePanelMaxHeight = 200;
const double _kAutocompleteBorderRadius = 8;
const double _kAutocompleteScrollerVerticalPadding = 8;
const double _kAutocompleteRowGap = 4;
const double _kAutocompleteButtonHorizontalPadding = 6;
const double _kAutocompleteRowInnerPadding = 8;
const double _kAutocompleteNameFontSize = 16;
const double _kAutocompleteDescFontSize = 12;
const double _kAutocompleteDescMarginLeft = 16;
const double _kAutocompleteScrollRowStride = 48;
const double _kAutocompleteAvatarSize = 28;
const double _kAutocompleteAvatarGap = 8;
const double _kAutocompleteEmojiPreviewSize = 24;
const Duration _kAutocompletePanelExpandDuration = Duration(milliseconds: 220);

typedef ComposerAutocompletePanelHost =
    ValueNotifier<ComposerAutocompletePanelSnapshot?>;

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
}

class ComposerAutocompletePanelSnapshot {
  const ComposerAutocompletePanelSnapshot({
    required this.rows,
    required this.selectedIndex,
  });

  final List<ComposerAutocompletePanelRow> rows;
  final int selectedIndex;
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
            final bool isOpen = snap != null && snap.rows.isNotEmpty;
            return RepaintBoundary(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double width = constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : MediaQuery.sizeOf(context).width;
                  return ClipRect(
                    child: AnimatedSize(
                      duration: _kAutocompletePanelExpandDuration,
                      curve: Curves.easeOutCubic,
                      alignment: Alignment.bottomCenter,
                      child: isOpen
                          ? SizedBox(
                              width: width,
                              child: _ComposerAutocompletePanelOpenBody(
                                snap: snap,
                                scrollController: scrollController,
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

class _ComposerAutocompletePanelOpenBody extends StatelessWidget {
  const _ComposerAutocompletePanelOpenBody({
    required this.snap,
    required this.scrollController,
  });

  final ComposerAutocompletePanelSnapshot snap;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final Color panelBg = context.colors.backgroundFloating;
    return Semantics(
      container: true,
      label: 'Suggestions',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kAutocompleteBorderRadius),
        child: Material(
          color: panelBg,
          shadowColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: kComposerAutocompletePanelMaxHeight,
            ),
            child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(
                vertical: _kAutocompleteScrollerVerticalPadding,
              ),
              shrinkWrap: true,
              itemCount: snap.rows.length,
              separatorBuilder: (BuildContext _, int _) {
                return const SizedBox(height: _kAutocompleteRowGap);
              },
              itemBuilder: (BuildContext _, int i) {
                final ComposerAutocompletePanelRow row = snap.rows[i];
                final bool selected = i == snap.selectedIndex;
                return ComposerAutocompletePanelListTile(
                  title: row.title,
                  isSelected: selected,
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
                );
              },
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

  @override
  Widget build(BuildContext context) {
    final Color hoverFill = context.colors.backgroundModifierHover;
    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w400,
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
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
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
