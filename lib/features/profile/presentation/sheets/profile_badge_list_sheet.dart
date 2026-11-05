import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/external_purchase_links_provider.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_actions.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_caption_style.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/settings/utils/commerce/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const double _kListBadgeHeight = 32;

class ProfileBadgeListSheet {
  ProfileBadgeListSheet._();

  static Future<void> show(
    BuildContext context, {
    required List<ProfileBadgeResponse> badges,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.profileBadgesSettingsTitle,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback _) {
        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            sheetContext.layout.s4,
            sheetContext.layout.s2,
            sheetContext.layout.s4,
            sheetContext.layout.s4 +
                FluxerBottomSheet.scrollBottomPaddingOf(sheetContext),
          ),
          itemCount: badges.length,
          separatorBuilder: (_, _) => SizedBox(height: sheetContext.layout.s3),
          itemBuilder: (BuildContext context, int index) {
            return _BadgeListRow(badge: badges[index]);
          },
        );
      },
    );
  }
}

class _BadgeListRow extends ConsumerWidget {
  const _BadgeListRow({required this.badge});

  final ProfileBadgeResponse badge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final layout = context.layout;
    final ProfileBadgeResponseDetails? details = badge.details;
    final String title = details?.title ?? badge.label;
    final List<String> lines = details?.lines ?? const <String>[];
    final String? imageUrl = profileBadgeDisplayImageUrl(
      badge,
      displayHeight: _kListBadgeHeight,
    );
    final bool tappable = profileBadgeHasAction(
      externalPurchaseLinksAllowed: ref.watch(
        externalPurchaseLinksAllowedProvider,
      ),
      officialInstance: ref.watch(isActiveInstanceOfficialProvider),
      billingNavVisible: ref.watch(premiumBillingNavVisibleProvider),
      badge: badge,
    );

    final Widget leading = imageUrl != null
        ? ProfileBadgeImage.fromBadge(badge, height: _kListBadgeHeight)
        : SizedBox(
            height: _kListBadgeHeight,
            width: _kListBadgeHeight,
            child: Center(
              child: Text(
                badge.caption ?? '',
                style: profileBadgeCaptionTextStyle(context, fontSize: 22),
              ),
            ),
          );

    return FluxerTappable(
      onTap: tappable
          ? () => unawaited(handleProfileBadgeTap(context, ref, badge))
          : null,
      button: tappable,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            SizedBox(width: layout.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyles.bodyMedium.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  for (final String line in lines) ...[
                    SizedBox(height: layout.s1),
                    Text(
                      line,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
