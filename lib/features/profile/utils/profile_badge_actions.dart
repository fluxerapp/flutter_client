import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/external_purchase_links_provider.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_badge_detail_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_caption_style.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/settings/utils/commerce/open_user_billing_settings.dart';
import 'package:fluxer_app/features/settings/utils/commerce/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_app/shared/external_links/first_party_site_link.dart';
import 'package:fluxer_dart/export.dart';

const Set<String> _kPurchaseBadgeKinds = <String>{
  'operator_pass',
  'visionary',
  'visionary_number',
  'premium',
  'plutonium',
};

bool profileBadgeLinkAllowed({
  required bool externalPurchaseLinksAllowed,
  required bool officialInstance,
  required ProfileBadgeResponse badge,
}) {
  final String? href = badge.href;
  if (href == null) {
    return false;
  }
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return true;
  }
  if (!officialInstance) {
    return false;
  }
  if (externalPurchaseLinksAllowed) {
    return true;
  }
  final Uri? uri = Uri.tryParse(href);
  return uri != null &&
      !_kPurchaseBadgeKinds.contains(badge.kind) &&
      !isFirstPartySiteLinkWithoutAppView(uri);
}

bool profileBadgeHasAction({
  required bool externalPurchaseLinksAllowed,
  required bool officialInstance,
  required bool billingNavVisible,
  required ProfileBadgeResponse badge,
}) {
  if (profileBadgeOpensPremiumSheet(badge)) {
    return billingNavVisible;
  }
  return profileBadgeLinkAllowed(
    externalPurchaseLinksAllowed: externalPurchaseLinksAllowed,
    officialInstance: officialInstance,
    badge: badge,
  );
}

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
  if (touch) {
    return;
  }
  if (profileBadgeOpensPremiumSheet(badge)) {
    if (ref.read(premiumBillingNavVisibleProvider)) {
      await openPlutoniumCommerce(context, ref, useRootNavigator: true);
    }
    return;
  }
  if (!profileBadgeLinkAllowed(
    externalPurchaseLinksAllowed: ref.read(
      externalPurchaseLinksAllowedProvider,
    ),
    officialInstance: ref.read(isActiveInstanceOfficialProvider),
    badge: badge,
  )) {
    return;
  }
  final Uri? uri = Uri.tryParse(badge.href!);
  if (uri != null) {
    await openExternalUrl(uri);
  }
}
