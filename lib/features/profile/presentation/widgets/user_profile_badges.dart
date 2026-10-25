import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_details_tooltip.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_actions.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_caption_style.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

enum UserProfileBadgesSize { desktop, mobile }

class UserProfileBadges extends ConsumerWidget {
  const UserProfileBadges({
    required this.badges,
    this.size = UserProfileBadgesSize.desktop,
    this.touch = false,
    super.key,
  });

  final List<ProfileBadgeResponse> badges;
  final UserProfileBadgesSize size;
  final bool touch;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (badges.isEmpty) {
      return const SizedBox.shrink();
    }
    final double badgeHeight = _badgeHeight();
    final bool useRichTooltip = !touch;

    return Wrap(
      spacing: size == UserProfileBadgesSize.mobile ? 8 : 6,
      runSpacing: 4,
      children: badges.map((ProfileBadgeResponse badge) {
        final HexString16Type? imageHash = profileBadgeImageHash(
          badge,
          displayHeight: badgeHeight,
        );
        final Widget badgeContent = imageHash != null
            ? ProfileBadgeImage(
                hash: imageHash,
                height: badgeHeight,
                aspectRatio: badge.aspectRatio,
              )
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
        final Widget tooltipChild = useRichTooltip && details != null
            ? FluxerTooltip(
                richMessage: ProfileBadgeDetailsTooltip(
                  badge: badge,
                  details: details,
                ),
                child: badgeContent,
              )
            : FluxerTooltip(message: badge.label, child: badgeContent);

        final bool opensPremium =
            !touch && profileBadgeOpensPremiumSheet(badge);
        final String? href = badge.href;
        final bool opensLink = href != null && !touch && !opensPremium;

        return Semantics(
          key: ValueKey<String>(badge.kind),
          label: _semanticLabel(badge),
          button: opensPremium || opensLink,
          child: FluxerTappable(
            onTap: (opensPremium || opensLink)
                ? () => unawaited(
                    handleProfileBadgeTap(context, ref, badge, touch: touch),
                  )
                : null,
            button: opensPremium || opensLink,
            semanticLabel: _semanticLabel(badge),
            excludeChildSemantics: true,
            builder: (BuildContext context, Set<WidgetState> states) =>
                tooltipChild,
          ),
        );
      }).toList(),
    );
  }
}
