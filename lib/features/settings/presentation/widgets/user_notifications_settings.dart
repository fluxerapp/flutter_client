import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_notifications_permission_banner.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_notifications_sound_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_notifications_tts_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/mention_preference_provider.dart';
import 'package:fluxer_app/features/settings/providers/notification_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

const int _kMinAfkTimeoutMinutes = 1;
const int _kMaxAfkTimeoutMinutes = 10;

class UserNotificationsSettings extends ConsumerWidget {
  const UserNotificationsSettings({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final notificationPrefs = ref.watch(notificationPreferencesProvider);
    final notificationNotifier = ref.read(
      notificationPreferencesProvider.notifier,
    );
    final mentionPreferenceAsync = ref.watch(mentionReplyPreferenceProvider);
    final mentionPreference =
        mentionPreferenceAsync.value ?? MentionReplyPreferences.noPreference;
    final settings = ref.watch(userSettingsStatusProvider);
    final int afkTimeoutMinutes = settings == null
        ? 5
        : (settings.afkTimeout / 60).round().clamp(
            _kMinAfkTimeoutMinutes,
            _kMaxAfkTimeoutMinutes,
          );
    final String notificationsLabel = isDesktopOs
        ? l10n.notificationsEnableDesktopNotificationsLabel
        : l10n.notificationsEnableNotificationsLabel;
    final String notificationsDescription = isDesktopOs
        ? l10n.notificationsEnableDesktopNotificationsDescription
        : l10n.notificationsEnableNotificationsDescription('Fluxer');
    final timeoutItems = List<FluxerSelectItem<int>>.generate(
      _kMaxAfkTimeoutMinutes,
      (int index) {
        final int minutes = index + 1;
        return FluxerSelectItem<int>(
          value: minutes,
          label: minutes == 1
              ? l10n.notificationsPushInactiveTimeoutOneMinute(minutes)
              : l10n.notificationsPushInactiveTimeoutMinutes(minutes),
        );
      },
    );
    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'notifications',
            title: l10n.notificationsGeneralSectionTitle,
            isFirst: true,
            children: [
              const UserNotificationsPermissionBanner(),
              FluxerSettingsSwitchItem(
                label: notificationsLabel,
                description: notificationsDescription,
                value: notificationPrefs.notificationsEnabled,
                onChanged: (bool value) => unawaited(
                  _handleNotificationsEnabledChanged(
                    context: context,
                    ref: ref,
                    notificationNotifier: notificationNotifier,
                    l10n: l10n,
                    value: value,
                  ),
                ),
              ),
              if (isDesktopOs) ...[
                Text(
                  l10n.notificationsPushInactiveTimeoutLabel,
                  style: textStyles.label.copyWith(color: colors.textPrimary),
                ),
                SizedBox(height: layout.s1),
                Text(
                  l10n.notificationsPushInactiveTimeoutDescription('Fluxer'),
                  style: textStyles.smallText.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                SizedBox(height: layout.s3),
                FluxerSelect<int>(
                  value: afkTimeoutMinutes,
                  items: timeoutItems,
                  onChanged: (int minutes) async {
                    try {
                      await ref
                          .read(userSettingsSyncProvider)
                          .pushAfkTimeout(minutes);
                    } on Object {
                      if (context.mounted) {
                        _showSyncFailedToast(
                          ref,
                          l10n.notificationsAfkTimeoutSyncFailed,
                        );
                      }
                    }
                  },
                ),
              ],
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'mention-preference',
            title: l10n.notificationsMentionPreferenceSectionTitle,
            children: [
              Semantics(
                label: l10n.notificationsReplyMentionPreferenceAriaLabel,
                container: true,
                child: FluxerRadioGroup<MentionReplyPreferences>(
                  value: mentionPreference,
                  onChanged: (MentionReplyPreferences value) async {
                    try {
                      await ref
                          .read(mentionReplyPreferenceProvider.notifier)
                          .setPreference(value);
                    } on Object {
                      if (context.mounted) {
                        _showSyncFailedToast(
                          ref,
                          l10n.notificationsMentionPreferenceSyncFailed,
                        );
                      }
                    }
                  },
                  items: [
                    FluxerRadioItem(
                      value: MentionReplyPreferences.noPreference,
                      label: l10n.notificationsMentionNoPreferenceName,
                      description:
                          l10n.notificationsMentionNoPreferenceDescription,
                    ),
                    FluxerRadioItem(
                      value: MentionReplyPreferences.preferMention,
                      label: l10n.notificationsMentionPreferMentionName,
                      description:
                          l10n.notificationsMentionPreferMentionDescription,
                    ),
                    FluxerRadioItem(
                      value: MentionReplyPreferences.preferNoMention,
                      label: l10n.notificationsMentionPreferNoMentionName,
                      description:
                          l10n.notificationsMentionPreferNoMentionDescription,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const UserNotificationsTtsSection(),
          FluxerSettingsSection(
            sectionId: 'sounds',
            title: l10n.notificationsSoundsSectionTitle,
            children: const [UserNotificationsSoundSettingsSection()],
          ),
        ],
      ),
    );
  }
}

Future<void> _handleNotificationsEnabledChanged({
  required BuildContext context,
  required WidgetRef ref,
  required NotificationPreferences notificationNotifier,
  required FluxerLocalizations l10n,
  required bool value,
}) async {
  final NotificationEnableResult result = await notificationNotifier
      .setNotificationsEnabled(context: context, value: value);
  if (!context.mounted) {
    return;
  }
  if (result == NotificationEnableResult.permissionDenied) {
    _showSyncFailedToast(
      ref,
      l10n.notificationsEnableNotificationsPermissionDenied,
    );
  }
}

void _showSyncFailedToast(WidgetRef ref, String message) {
  ref
      .read(toastProvider.notifier)
      .show(FluxerToast(message: message, variant: FluxerToastVariant.danger));
}
