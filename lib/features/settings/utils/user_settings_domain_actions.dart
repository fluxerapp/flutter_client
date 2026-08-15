import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/hide_muted_channels_confirm_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<void> handleTrustAllDomainsChange(
  BuildContext context,
  WidgetRef ref,
  bool value,
) async {
  final notifier = ref.read(userSettingsViewModelProvider.notifier);
  final l10n = FluxerLocalizations.of(context);

  if (value) {
    final confirmed = await showFluxerSettingsConfirmSheet(
      context,
      title: l10n.externalLinkTrustAllConfirmTitle,
      description: l10n.externalLinkTrustAllConfirmDescription,
      confirmLabel: l10n.externalLinkTrustAllConfirmAction,
      isDanger: true,
    );
    if (confirmed != true) {
      return;
    }
    await notifier.setTrustAllDomains(trustAll: true);
    return;
  }

  final confirmed = await showFluxerSettingsConfirmSheet(
    context,
    title: l10n.externalLinkStopTrustingAllTitle,
    description: l10n.externalLinkStopTrustingAllDescription,
    confirmLabel: l10n.externalLinkStopTrustingAllAction,
  );
  if (confirmed != true) {
    return;
  }
  await notifier.setTrustAllDomains(trustAll: false);
}

Future<void> handleDefaultHideMutedChannelsChange(
  BuildContext context,
  WidgetRef ref,
  bool value,
) async {
  final notifier = ref.read(userSettingsViewModelProvider.notifier);
  final choice = await showHideMutedChannelsConfirmSheet(context, value: value);
  if (choice == null) {
    return;
  }

  await notifier.setDefaultHideMutedChannels(value: value);
  if (choice == HideMutedChannelsChoice.applyAll) {
    await notifier.applyDefaultHideMutedChannelsToExistingGuilds(value: value);
  }
}
