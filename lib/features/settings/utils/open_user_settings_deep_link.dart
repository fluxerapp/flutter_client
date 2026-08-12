import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/deep_links/user_settings_deep_link.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_nav.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_field_registry.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserSettingsDeepLinkPresentation {
  const UserSettingsDeepLinkPresentation({
    required this.tabLabel,
    required this.tabIcon,
    this.scrollFieldId,
    this.fieldLabel,
  });

  final String tabLabel;
  final IconData tabIcon;
  final String? scrollFieldId;
  final String? fieldLabel;
}

UserSettingsDeepLinkPresentation buildUserSettingsDeepLinkPresentation({
  required BuildContext context,
  required bool isTouchPrimary,
  required FluxerLocalizations l10n,
  required UserSettingsDeepLinkTarget target,
}) {
  final String? scrollFieldId = target.tab == null
      ? null
      : resolveUserSettingsScrollFieldId(
          context: context,
          isTouchPrimary: isTouchPrimary,
          tab: target.tab!,
          fieldId: target.fieldId,
          section: target.section,
        );
  final String? fieldLabel =
      scrollFieldId == null || target.tab == null || target.fieldId == null
      ? null
      : userSettingsFieldLabel(l10n, target.tab!, target.fieldId!);
  final IconData tabIcon = target.section == null
      ? PhosphorIconsFill.gear
      : iconForUserSettingsSection(target.section!) ?? PhosphorIconsFill.gear;

  return UserSettingsDeepLinkPresentation(
    tabLabel: userSettingsDeepLinkTabLabel(l10n, target),
    tabIcon: tabIcon,
    scrollFieldId: scrollFieldId,
    fieldLabel: fieldLabel,
  );
}

Future<void> openUserSettingsDeepLink(
  BuildContext context,
  WidgetRef ref,
  UserSettingsDeepLinkTarget target, {
  String? scrollFieldId,
}) async {
  await _openUserSettingsDeepLink(
    context,
    isTouchPrimary: isTouchPrimaryInput(ref),
    target: target,
    scrollFieldId: scrollFieldId,
  );
}

Future<void> openUserSettingsDeepLinkFromContext(
  BuildContext context,
  UserSettingsDeepLinkTarget target, {
  String? scrollFieldId,
}) async {
  final ProviderContainer container = ProviderScope.containerOf(
    context,
    listen: false,
  );
  await _openUserSettingsDeepLink(
    context,
    isTouchPrimary: container.read(inputModalityProvider),
    target: target,
    scrollFieldId: scrollFieldId,
  );
}

Future<void> _openUserSettingsDeepLink(
  BuildContext context, {
  required bool isTouchPrimary,
  required UserSettingsDeepLinkTarget target,
  String? scrollFieldId,
}) async {
  final String? resolvedScrollFieldId =
      scrollFieldId ??
      (target.tab == null
          ? null
          : resolveUserSettingsScrollFieldId(
              context: context,
              isTouchPrimary: isTouchPrimary,
              tab: target.tab!,
              fieldId: target.fieldId,
              section: target.section,
            ));
  await UserSettingsModal.show(
    context,
    initialSection: target.section,
    initialFieldId: resolvedScrollFieldId,
  );
}

String userSettingsDeepLinkTabLabel(
  FluxerLocalizations l10n,
  UserSettingsDeepLinkTarget target,
) {
  if (target.tab == null) {
    return l10n.userAreaUserSettings;
  }
  if (target.section == null &&
      !isUserSettingsDeepLinkTabSupported(target.tab!)) {
    return l10n.userAreaUserSettings;
  }
  return userSettingsTabLabel(l10n, target.tab!);
}

bool isUserSettingsDeepLinkTabSupported(String tab) {
  return mapUserSettingsDeepLinkToSection(tab, null) != null;
}
