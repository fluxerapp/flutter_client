import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_badge_list_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_details_tooltip.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_actions.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_caption_style.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_dart/export.dart';

enum UserProfileBadgesSize { desktop, mobile }

class UserProfileBadges extends ConsumerWidget {
  const UserProfileBadges({
    required this.badges,
    this.size = UserProfileBadgesSize.desktop,
    this.touch = false,
    this.maxVisible,
    super.key,
  });

  final List<ProfileBadgeResponse> badges;
  final UserProfileBadgesSize size;
  final bool touch;
  final int? maxVisible;

  static bool hasBadges(List<ProfileBadgeResponse> badges) => badges.isNotEmpty;

  double _badgeHeight() {
    return switch (size) {
      UserProfileBadgesSize.desktop => 24,
      UserProfileBadgesSize.mobile => 32,
    };
  }

  double _captionFontSize() {
    return switch (size) {
      UserProfileBadgesSize.desktop => 20,
      UserProfileBadgesSize.mobile => 26,
    };
  }

  String _semanticLabel(ProfileBadgeResponse badge) {
    return badge.accessibleLabel ?? badge.caption ?? badge.label;
  }

  Future<void> _onBadgeTap(
    BuildContext context,
    WidgetRef ref,
    ProfileBadgeResponse badge, {
    required bool touchPrimary,
  }) async {
    if (touchPrimary) {
      await showProfileBadgeDetails(context, ref, badge);
      return;
    }
    await handleProfileBadgeTap(context, ref, badge);
  }

  Widget _badgeChip(
    BuildContext context,
    WidgetRef ref,
    ProfileBadgeResponse badge,
    double badgeHeight, {
    required bool touchPrimary,
    required bool useHoverTooltip,
  }) {
    final String? imageUrl = profileBadgeDisplayImageUrl(
      badge,
      displayHeight: badgeHeight,
    );
    final Widget badgeContent = imageUrl != null
        ? ProfileBadgeImage.fromBadge(badge, height: badgeHeight)
        : SizedBox(
            height: badgeHeight,
            child: Center(
              child: Text(
                badge.caption ?? '',
                style: profileBadgeCaptionTextStyle(
                  context,
                  fontSize: _captionFontSize(),
                ),
              ),
            ),
          );

    final ProfileBadgeResponseDetails? details = badge.details;
    final Widget displayedContent;
    if (useHoverTooltip && details != null) {
      displayedContent = FluxerTooltip(
        richMessage: ProfileBadgeDetailsTooltip(badge: badge, details: details),
        child: badgeContent,
      );
    } else if (useHoverTooltip) {
      displayedContent = FluxerTooltip(
        message: badge.label,
        child: badgeContent,
      );
    } else {
      displayedContent = badgeContent;
    }

    final bool opensPremium =
        !touchPrimary && profileBadgeOpensPremiumSheet(badge);
    final String? href = badge.href;
    final bool opensLink = href != null && !touchPrimary && !opensPremium;
    final bool tappable = touchPrimary || opensPremium || opensLink;

    return Semantics(
      key: ValueKey<String>(badge.key.isNotEmpty ? badge.key : badge.kind),
      label: _semanticLabel(badge),
      button: tappable,
      child: FluxerTappable(
        onTap: tappable
            ? () => unawaited(
                _onBadgeTap(context, ref, badge, touchPrimary: touchPrimary),
              )
            : null,
        button: tappable,
        semanticLabel: _semanticLabel(badge),
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) =>
            displayedContent,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (badges.isEmpty) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool touchPrimary = touch || ref.watch(inputModalityProvider);
    final bool useHoverTooltip = !touchPrimary;
    final double badgeHeight = _badgeHeight();
    final int? limit = maxVisible != null && maxVisible! > 0
        ? maxVisible
        : null;
    final List<ProfileBadgeResponse> visible;
    if (limit != null && badges.length > limit) {
      visible = badges.sublist(0, limit);
    } else {
      visible = badges;
    }
    final int hiddenCount = badges.length - visible.length;

    return Wrap(
      spacing: size == UserProfileBadgesSize.mobile ? 8 : 6,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final ProfileBadgeResponse badge in visible)
          _badgeChip(
            context,
            ref,
            badge,
            badgeHeight,
            touchPrimary: touchPrimary,
            useHoverTooltip: useHoverTooltip,
          ),
        if (hiddenCount > 0)
          _overflowControl(
            context: context,
            l10n: l10n,
            hiddenCount: hiddenCount,
            useHoverTooltip: useHoverTooltip,
            badges: badges,
          ),
      ],
    );
  }

  Widget _overflowControl({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required int hiddenCount,
    required bool useHoverTooltip,
    required List<ProfileBadgeResponse> badges,
  }) {
    final Widget control = FluxerTappable(
      onTap: () =>
          unawaited(ProfileBadgeListSheet.show(context, badges: badges)),
      button: true,
      semanticLabel: l10n.profileBadgesShowAllSemantic(hiddenCount),
      builder: (BuildContext context, Set<WidgetState> states) {
        final textStyles = context.textStyles;
        final colors = context.colors;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            l10n.profileBadgesOverflowButton(hiddenCount),
            style: textStyles.bodySmall.copyWith(
              color: colors.textLink,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );

    if (!useHoverTooltip) {
      return control;
    }
    return FluxerTooltip(
      message: l10n.profileBadgesShowAllTooltip,
      child: control,
    );
  }
}
