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
                        FluxerAvatar.user(
                          imageUrl: userAvatarImageUrl,
                          fallbackText: userAvatarFallbackText,
                          userId: _snowflakeUserIdForDefaultAvatar(
                            userAvatarUserId,
                          ),
                          avatarColor: userAvatarColor,
                          status: userAvatarStatus,
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
                              ? Center(
                                  child: Text(
                                    emojiSurrogates!,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: emojiImageUrl!,
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
