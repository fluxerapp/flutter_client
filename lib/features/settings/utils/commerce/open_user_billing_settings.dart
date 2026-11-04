import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/utils/commerce/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> openUserBillingSettings(
  BuildContext context,
  UserSettingsSection section,
) {
  return UserSettingsModal.show(context, initialSection: section);
}

Future<void> openPlutoniumCommerce(
  BuildContext context,
  WidgetRef ref, {
  bool useRootNavigator = false,
}) async {
  if (userSettingsShowBillingNav(ref)) {
    await openUserBillingSettings(context, UserSettingsSection.fluxerPlutonium);
    return;
  }
  await showPlutoniumUnavailableSheet(
    context,
    useRootNavigator: useRootNavigator,
  );
}

Future<void> showPlutoniumUnavailableSheet(
  BuildContext context, {
  bool useRootNavigator = false,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  await FluxerBottomSheet.show<void>(
    context,
    title: l10n.plutoniumNotAvailableTitle,
    useRootNavigator: useRootNavigator,
    builder: (sheetContext, _) => Padding(
      padding: EdgeInsets.fromLTRB(
        sheetContext.layout.s4,
        sheetContext.layout.s4,
        sheetContext.layout.s4,
        0,
      ),
      child: Text(
        l10n.plutoniumNotSoldHere,
        style: sheetContext.textStyles.bodyMedium.copyWith(
          color: sheetContext.colors.textSecondary,
        ),
      ),
    ),
  );
}
