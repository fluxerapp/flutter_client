import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_badges.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kBannerHeight = 100;
const double _kAvatarSize = 80;
const double _kAvatarBorderWidth = 4;
const double _kAvatarOverlap = 50;
const int _kDefaultAccentColor = 0x4641D9;
const double _kBannerAspectRatio = 17 / 6;
const double _kContentPaddingH = 16;
const double _kAvatarLeft = 10;

class ProfilePreviewCard extends ConsumerStatefulWidget {
  const ProfilePreviewCard({required this.state, super.key});

  final UserSettingsViewState state;

  @override
  ConsumerState<ProfilePreviewCard> createState() => _ProfilePreviewCardState();
}

class _ProfilePreviewCardState extends ConsumerState<ProfilePreviewCard> {
  String? _lastAvatarUri;
  Uint8List? _cachedAvatarBytes;
  String? _lastBannerUri;
  Uint8List? _cachedBannerBytes;

  Uint8List? _decodeDataUri(String? dataUri) {
    if (dataUri == null) {
      return null;
    }
    final commaIndex = dataUri.indexOf(',');
    if (commaIndex < 0) {
      return null;
    }
    try {
      return base64Decode(dataUri.substring(commaIndex + 1));
    } on FormatException {
      return null;
    }
  }

  Uint8List? _avatarBytes() {
    final uri = widget.state.previewAvatarBase64;
    if (!identical(uri, _lastAvatarUri)) {
      _lastAvatarUri = uri;
      _cachedAvatarBytes = _decodeDataUri(uri);
    }
    return _cachedAvatarBytes;
  }

  Uint8List? _bannerBytes() {
    final uri = widget.state.previewBannerBase64;
    if (!identical(uri, _lastBannerUri)) {
      _lastBannerUri = uri;
      _cachedBannerBytes = _decodeDataUri(uri);
    }
    return _cachedBannerBytes;
  }

  String _effectiveDisplayName() {
    final s = widget.state;
    if (s.isEditedDisplayNameSet) {
      final edited = s.editedDisplayName;
      if (edited != null && edited.isNotEmpty) {
        return edited;
      }
    }
    if (s.displayName.isNotEmpty) {
      return s.displayName;
    }
    return s.username;
  }

  String? _effectivePronouns() {
    final s = widget.state;
    if (s.isPerGuildProfile) {
      if (s.isEditedGuildPronounsSet) {
        return s.editedGuildPronouns;
      }
      return s.guildPronouns;
    }
    if (s.isEditedPronounsSet) {
      return s.editedPronouns;
    }
    return s.pronouns;
  }

  String? _effectiveBio() {
    final s = widget.state;
    if (s.isPerGuildProfile) {
      if (s.isEditedGuildBioSet) {
        return s.editedGuildBio;
      }
      return s.guildBio;
    }
    if (s.isEditedBioSet) {
      return s.editedBio;
    }
    return s.bio;
  }

  int _effectiveAccentColor() {
    final s = widget.state;
    if (s.isPerGuildProfile) {
      if (s.isEditedGuildAccentColorSet) {
        return s.editedGuildAccentColor ?? _kDefaultAccentColor;
      }
      return s.guildAccentColor ?? s.accentColor ?? _kDefaultAccentColor;
    }
    if (s.isEditedAccentColorSet) {
      return s.editedAccentColor ?? _kDefaultAccentColor;
    }
    return s.accentColor ?? _kDefaultAccentColor;
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    final accentColor = Color(0xFF000000 | _effectiveAccentColor());

    return Center(
      child: Column(
        children: [
          Text(
            l10n.profilePreviewLabel,
            style: textStyles.label.copyWith(color: colors.textSecondary),
          ),
          SizedBox(height: layout.s4),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: colors.backgroundPrimary,
                borderRadius: layout.radiusMd,
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: layout.radiusMd,
                border: Border.all(color: accentColor, width: 2.5),
              ),
              child: _buildCardBody(
                s,
                accentColor,
                colors,
                textStyles,
                layout,
                l10n,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBody(
    UserSettingsViewState s,
    Color accentColor,
    FluxerColorTheme colors,
    FluxerTextTheme textStyles,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final effectiveBio = _effectiveBio();
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    final showPremiumBadge =
        !selfHosted && s.isPremium && !s.effectivePremiumBadgeHidden;
    final hasBadges = UserProfileBadges.hasBadges(
      flags: s.publicFlags,
      hasPlutonium: showPremiumBadge,
      selfHosted: selfHosted,
    );
    final premiumLifetimeSequence =
        showPremiumBadge &&
            s.hasLifetimePremium &&
            !s.effectivePremiumBadgeMasked &&
            !s.effectivePremiumBadgeSequenceHidden
        ? s.premiumLifetimeSequence
        : null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bannerH = _bannerHeight(s, constraints.maxWidth);
        final avatarTop = bannerH - _kAvatarOverlap;
        const avatarTotal = _kAvatarSize + _kAvatarBorderWidth * 2;
        final headerH = avatarTop + avatarTotal;

        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(
                  s,
                  accentColor,
                  colors,
                  bannerH,
                  avatarTop,
                  headerH,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    _kContentPaddingH,
                    layout.s2,
                    _kContentPaddingH,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserInfo(s, colors, textStyles),
                      if (effectiveBio != null &&
                          effectiveBio.trim().isNotEmpty) ...[
                        SizedBox(height: layout.s2),
                        _buildBio(effectiveBio, colors, textStyles),
                      ],
                      if (_memberSinceDate(s) case final date?) ...[
                        SizedBox(height: layout.s2),
                        _buildMemberSince(date, colors, textStyles, l10n),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    layout.s3,
                    layout.s4,
                    layout.s3,
                    layout.s3,
                  ),
                  child: FluxerButton.primary(
                    label: l10n.profilePreviewMessage,
                    icon: PhosphorIconsFill.chatTeardrop,
                    size: FluxerButtonSize.small,
                  ),
                ),
              ],
            ),
            if (hasBadges)
              Positioned(
                top: bannerH + 10,
                right: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundSecondary.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: UserProfileBadges(
                      flags: s.publicFlags,
                      hasPlutonium: showPremiumBadge,
                      isLifetimePlutonium: s.hasLifetimePremium,
                      premiumSince: s.premiumSince,
                      premiumLifetimeSequence: premiumLifetimeSequence,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  double _bannerHeight(UserSettingsViewState s, double width) {
    final bannerBytes = _bannerBytes();
    final showBanner =
        !s.previewBannerCleared &&
        (bannerBytes != null || s.previewBannerUrl != null);
    return showBanner ? width / _kBannerAspectRatio : _kBannerHeight;
  }

  Widget _buildHeader(
    UserSettingsViewState s,
    Color accentColor,
    FluxerColorTheme colors,
    double bannerH,
    double avatarTop,
    double headerH,
  ) {
    final bannerBytes = _bannerBytes();
    final bannerUrl = s.previewBannerUrl;
    final showBanner =
        !s.previewBannerCleared && (bannerBytes != null || bannerUrl != null);

    Widget bannerContent;
    if (showBanner && bannerBytes != null) {
      bannerContent = Image.memory(
        bannerBytes,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      );
    } else if (showBanner && bannerUrl != null) {
      bannerContent = CachedNetworkImage(
        imageUrl: bannerUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => ColoredBox(color: accentColor),
      );
    } else {
      bannerContent = ColoredBox(color: accentColor);
    }

    final avatarBytes = _avatarBytes();
    final hasAvatar =
        !s.previewAvatarCleared &&
        (avatarBytes != null || s.previewAvatarUrl != null);

    return SizedBox(
      height: headerH,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: bannerH,
            child: bannerContent,
          ),
          Positioned(
            left: _kAvatarLeft,
            top: avatarTop,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.backgroundPrimary,
              ),
              padding: const EdgeInsets.all(_kAvatarBorderWidth),
              child: hasAvatar && avatarBytes != null
                  ? ClipOval(
                      child: Image.memory(
                        avatarBytes,
                        width: _kAvatarSize,
                        height: _kAvatarSize,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ),
                    )
                  : FluxerAvatar.user(
                      imageUrl: s.previewAvatarCleared
                          ? null
                          : s.previewAvatarUrl,
                      fallbackText: _effectiveDisplayName(),
                      avatarColor: s.avatarColor,
                      userId: s.userId,
                      size: _kAvatarSize,
                      showStatus: false,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(
    UserSettingsViewState s,
    FluxerColorTheme colors,
    FluxerTextTheme textStyles,
  ) {
    final pronouns = _effectivePronouns();
    final showPronouns = pronouns != null && pronouns.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _effectiveDisplayName(),
          style: textStyles.heading.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          '${s.username}#${s.discriminator}',
          style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showPronouns) ...[
          const SizedBox(height: 4),
          Text(
            pronouns,
            style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
          ),
        ],
      ],
    );
  }

  Widget _buildBio(
    String effectiveBio,
    FluxerColorTheme colors,
    FluxerTextTheme textStyles,
  ) {
    return MessageMarkdown(
      data: effectiveBio.trim(),
      markdownContext: FluxerMarkdownContext.restrictedUserBio,
      baseStyle: textStyles.bodySmall.copyWith(color: colors.textSecondary),
    );
  }

  DateTime? _memberSinceDate(UserSettingsViewState s) {
    if (s.userId.isEmpty) {
      return null;
    }
    return dateTimeFromUserSnowflakeOrNull(s.userId);
  }

  Widget _buildMemberSince(
    DateTime date,
    FluxerColorTheme colors,
    FluxerTextTheme textStyles,
    FluxerLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.profilePreviewMemberSince(
            ref.watch(
              instanceRuntimeConfigProvider.select(
                (config) => config.productName,
              ),
            ),
          ),
          style: textStyles.bodySmall.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          formatUserMediumDate(date.toLocal(), l10n.localeName),
          style: textStyles.bodySmall.copyWith(color: colors.textChat),
        ),
      ],
    );
  }
}
