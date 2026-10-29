import 'package:fluxer_app/features/ui/settings/fluxer_settings_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<bool> confirmUserSettingsLogout(BuildContext context) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final bool? confirmed = await showFluxerSettingsConfirmSheet(
    context,
    title: l10n.userSettingsLogOutConfirmTitle,
    description: l10n.userSettingsLogOutConfirmDescription,
    confirmLabel: l10n.signOut,
    isDanger: true,
  );
  return confirmed ?? false;
}
