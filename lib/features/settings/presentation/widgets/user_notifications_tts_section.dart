import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/notification_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserNotificationsTtsSection extends ConsumerWidget {
  const UserNotificationsTtsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final appearance = ref.watch(appearancePreferencesProvider);
    final appearanceNotifier = ref.read(appearancePreferencesProvider.notifier);
    final notificationPrefs = ref.watch(notificationPreferencesProvider);
    final notificationNotifier = ref.read(
      notificationPreferencesProvider.notifier,
    );

    return FluxerSettingsSection(
      sectionId: 'text-to-speech',
      title: l10n.notificationsTtsSectionTitle,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FluxerSettingsSwitchItem(
              label: l10n.notificationsTtsEnableCommandLabel,
              description: l10n.notificationsTtsEnableCommandDescription,
              value: appearance.enableTtsCommand,
              onChanged: (bool value) => unawaited(
                appearanceNotifier.setEnableTtsCommand(value: value),
              ),
            ),
            SizedBox(height: layout.s3),
            Text.rich(
              TextSpan(
                style: textStyles.smallText.copyWith(
                  color: colors.textSecondary,
                ),
                children: [
                  TextSpan(text: l10n.notificationsTtsAccessibilityLinkPrefix),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: FluxerGestureDetector(
                      onTap: () => unawaited(
                        UserSettingsModal.show(
                          context,
                          initialSection: UserSettingsSection.accessibility,
                        ),
                      ),
                      child: Text(
                        l10n.notificationsTtsAccessibilityLinkLabel,
                        style: textStyles.smallText.copyWith(
                          color: colors.textLink,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  TextSpan(text: l10n.notificationsTtsAccessibilityLinkSuffix),
                ],
              ),
            ),
          ],
        ),
        FluxerSettingsSubsection(
          title: l10n.notificationsTtsAutoNarrationTitle,
          description: l10n.notificationsTtsAutoNarrationDescription,
          children: [
            Semantics(
              label: l10n.notificationsTtsModeAriaLabel,
              container: true,
              child: FluxerRadioGroup<TtsNotificationMode>(
                value: notificationPrefs.ttsNotificationMode,
                onChanged: (TtsNotificationMode value) => unawaited(
                  notificationNotifier.setTtsNotificationMode(value),
                ),
                items: [
                  FluxerRadioItem(
                    value: TtsNotificationMode.forAllChannels,
                    label: l10n.notificationsTtsModeAllChannelsName,
                    description:
                        l10n.notificationsTtsModeAllChannelsDescription,
                  ),
                  FluxerRadioItem(
                    value: TtsNotificationMode.forCurrentChannel,
                    label: l10n.notificationsTtsModeCurrentChannelName,
                    description:
                        l10n.notificationsTtsModeCurrentChannelDescription,
                  ),
                  FluxerRadioItem(
                    value: TtsNotificationMode.never,
                    label: l10n.notificationsTtsModeNeverName,
                    description: l10n.notificationsTtsModeNeverDescription,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
