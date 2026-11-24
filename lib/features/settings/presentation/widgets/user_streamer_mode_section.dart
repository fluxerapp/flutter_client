import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/streamer_mode_provider.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserStreamerModeSection extends ConsumerWidget {
  const UserStreamerModeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final StreamerModeState state = ref.watch(streamerModeProvider);
    final StreamerMode notifier = ref.read(streamerModeProvider.notifier);
    return FluxerSettingsSection(
      sectionId: 'streamer-mode',
      title: l10n.streamerModeSectionTitle,
      description: l10n.streamerModeSectionDescription,
      children: [
        FluxerSettingsSwitchItem(
          label: l10n.streamerModeEnableLabel,
          value: state.manualEnabled,
          onChanged: (bool value) =>
              unawaited(notifier.setManualEnabled(value: value)),
        ),
        if (isDesktopOs && streamerModeAutoDetectSupported)
          FluxerSettingsSwitchItem(
            label: l10n.streamerModeAutoEnableLabel,
            description: l10n.streamerModeAutoEnableDescription,
            value: state.autoEnable,
            onChanged: (bool value) =>
                unawaited(notifier.setAutoEnable(value: value)),
          ),
        FluxerSettingsSwitchGroup(
          children: [
            FluxerSettingsSwitchItem.grouped(
              label: l10n.streamerModeHidePersonalLabel,
              description: l10n.streamerModeHidePersonalDescription,
              value: state.hidePersonalInformation,
              onChanged: (bool value) =>
                  unawaited(notifier.setHidePersonalInformation(value: value)),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: l10n.streamerModeHideInviteLinksLabel,
              description: l10n.streamerModeHideInviteLinksDescription,
              value: state.hideInviteLinks,
              onChanged: (bool value) =>
                  unawaited(notifier.setHideInviteLinks(value: value)),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: l10n.streamerModeDisableSoundsLabel,
              value: state.disableSounds,
              onChanged: (bool value) =>
                  unawaited(notifier.setDisableSounds(value: value)),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: l10n.streamerModeDisableNotificationsLabel,
              value: state.disableNotifications,
              onChanged: (bool value) =>
                  unawaited(notifier.setDisableNotifications(value: value)),
            ),
          ],
        ),
      ],
    );
  }
}
