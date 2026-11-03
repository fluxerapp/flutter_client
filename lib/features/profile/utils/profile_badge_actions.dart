import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_badge_detail_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_caption_style.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/commerce/open_user_billing_settings.dart';
import 'package:fluxer_app/features/settings/utils/commerce/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_dart/export.dart';

bool profileBadgeOpensPremiumSheet(ProfileBadgeResponse badge) {
  if (badge.kind == 'premium') {
    return badge.href == null;
  }
  return badge.kind == 'plutonium';
}

bool profileBadgeUsesDetailSheet(ProfileBadgeResponse badge) {
  final ProfileBadgeResponseDetails? details = badge.details;
  if (details == null) {
    return false;
  }
  if (details.lines.length > 1) {
    return true;
  }
  if (details.lines.isEmpty) {
    return false;
  }
  return profileBadgeDisplayImageUrl(
        badge,
        displayHeight: kProfileBadgeTooltipArtHeight,
      ) !=
      null;
}

String profileBadgeToastMessage(ProfileBadgeResponse badge) {
  final ProfileBadgeResponseDetails? details = badge.details;
  if (details == null) {
    return badge.label;
  }
  if (details.lines.length == 1) {
    final String line = details.lines.first;
    if (details.title == badge.label || details.title.isEmpty) {
      return line;
    }
    return '${details.title}\n$line';
  }
  if (details.lines.isEmpty) {
    return details.title;
  }
  return badge.label;
}

const double kProfileBadgeToastLeadingSize = 20;

Widget? profileBadgeToastLeading(
  BuildContext context,
  ProfileBadgeResponse badge,
) {
  final String? imageUrl = profileBadgeDisplayImageUrl(
    badge,
    displayHeight: kProfileBadgeToastLeadingSize,
  );
  if (imageUrl != null) {
    return ProfileBadgeImage.fromBadge(
      badge,
      height: kProfileBadgeToastLeadingSize,
    );
  }
  final String? caption = badge.caption;
  if (caption != null && caption.isNotEmpty) {
    return SizedBox(
      height: kProfileBadgeToastLeadingSize,
      width: kProfileBadgeToastLeadingSize,
      child: Center(
        child: Text(
          caption,
          style: profileBadgeCaptionTextStyle(context, fontSize: 14),
        ),
      ),
    );
  }
  return null;
}

FluxerToast profileBadgeToast(
  BuildContext context,
  ProfileBadgeResponse badge,
) {
  return FluxerToast(
    message: profileBadgeToastMessage(badge),
    leading: profileBadgeToastLeading(context, badge),
  );
}

Future<void> showProfileBadgeDetails(
  BuildContext context,
  WidgetRef ref,
  ProfileBadgeResponse badge,
) async {
  if (profileBadgeUsesDetailSheet(badge)) {
    await ProfileBadgeDetailSheet.show(context, ref, badge: badge);
    return;
  }
  ref.read(toastProvider.notifier).show(profileBadgeToast(context, badge));
}

Future<void> handleProfileBadgeTap(
  BuildContext context,
  WidgetRef ref,
  ProfileBadgeResponse badge, {
  bool touch = false,
}) async {
  if (!touch && profileBadgeOpensPremiumSheet(badge)) {
    if (userSettingsShowBillingNav(ref)) {
      await openUserBillingSettings(
        context,
        UserSettingsSection.fluxerPlutonium,
      );
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.plutoniumNotAvailableTitle,
      useRootNavigator: true,
      builder: (sheetContext, _) => Padding(
        padding: EdgeInsets.all(sheetContext.layout.s4),
        child: Text(
          l10n.plutoniumNotAvailableBody,
          style: sheetContext.textStyles.bodyMedium.copyWith(
            color: sheetContext.colors.textSecondary,
          ),
        ),
      ),
    );
    return;
  }
  final String? href = badge.href;
  if (href != null && !touch) {
    final Uri? uri = Uri.tryParse(href);
    if (uri != null) {
      await openExternalUrl(uri);
    }
  }
}
