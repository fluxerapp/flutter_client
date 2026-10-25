import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/open_user_billing_settings.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
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
