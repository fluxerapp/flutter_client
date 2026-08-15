import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/advanced_setting_visibility.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showAdvancedMediaButtonsSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingMediaButtonsLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final appearance = ref.watch(appearancePreferencesProvider);
          final advanced = ref.watch(advancedPreferencesProvider);
          final appearanceNotifier = ref.read(
            appearancePreferencesProvider.notifier,
          );
          final advancedNotifier = ref.read(
            advancedPreferencesProvider.notifier,
          );

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowGifIndicatorLabel,
                  value: advanced.showGifIndicator,
                  onChanged: (value) =>
                      advancedNotifier.setShowGifIndicator(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowAttachmentExpiryLabel,
                  value: advanced.showAttachmentExpiryIndicator,
                  onChanged: (value) => advancedNotifier
                      .setShowAttachmentExpiryIndicator(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowMediaDeleteLabel,
                  value: appearance.showMediaDeleteButton,
                  onChanged: (value) =>
                      appearanceNotifier.setShowMediaDeleteButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowMediaDownloadLabel,
                  value: appearance.showMediaDownloadButton,
                  onChanged: (value) => appearanceNotifier
                      .setShowMediaDownloadButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowMediaFavoriteLabel,
                  value: appearance.showMediaFavoriteButton,
                  onChanged: (value) => appearanceNotifier
                      .setShowMediaFavoriteButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowSuppressEmbedsLabel,
                  value: appearance.showSuppressEmbedsButton,
                  onChanged: (value) => appearanceNotifier
                      .setShowSuppressEmbedsButton(value: value),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedMessageActionBarSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingMessageActionBarLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final advanced = ref.watch(advancedPreferencesProvider);
          final notifier = ref.read(advancedPreferencesProvider.notifier);
          final bool actionBarEnabled = advanced.showMessageActionBar;
          final bool moreOnly = advanced.showMessageActionBarOnlyMoreButton;

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowMessageActionBarLabel,
                  value: actionBarEnabled,
                  onChanged: (value) =>
                      notifier.setShowMessageActionBar(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowOnlyMoreButtonLabel,
                  value: moreOnly,
                  enabled: actionBarEnabled,
                  onChanged: (value) => notifier
                      .setShowMessageActionBarOnlyMoreButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowQuickReactionsLabel,
                  value: advanced.showMessageActionBarQuickReactions,
                  enabled: actionBarEnabled && !moreOnly,
                  onChanged: (value) => notifier
                      .setShowMessageActionBarQuickReactions(value: value),
                ),
                if (showKeyboardShortcutAdvancedSettings(sheetContext))
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.advancedSettingEnableShiftToExpandLabel,
                    value: advanced.showMessageActionBarShiftExpand,
                    enabled: actionBarEnabled && !moreOnly,
                    onChanged: (value) => notifier
                        .setShowMessageActionBarShiftExpand(value: value),
                  ),
              ],
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedExpressionAutocompleteSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingExpressionAutocompleteLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final chat = ref.watch(chatPreferencesProvider);
          final notifier = ref.read(chatPreferencesProvider.notifier);

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowDefaultEmojisAutocompleteLabel,
                  value: chat.showDefaultEmojisInExpressionAutocomplete,
                  onChanged: (value) =>
                      notifier.setShowDefaultEmojisInExpressionAutocomplete(
                        value: value,
                      ),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowCustomEmojisAutocompleteLabel,
                  value: chat.showCustomEmojisInExpressionAutocomplete,
                  onChanged: (value) =>
                      notifier.setShowCustomEmojisInExpressionAutocomplete(
                        value: value,
                      ),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowStickersAutocompleteLabel,
                  value: chat.showStickersInExpressionAutocomplete,
                  onChanged: (value) => notifier
                      .setShowStickersInExpressionAutocomplete(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowSavedMediaAutocompleteLabel,
                  value: chat.showMemesInExpressionAutocomplete,
                  onChanged: (value) => notifier
                      .setShowMemesInExpressionAutocomplete(value: value),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedInputButtonsSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingInputButtonsLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final advanced = ref.watch(advancedPreferencesProvider);
          final notifier = ref.read(advancedPreferencesProvider.notifier);

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowGifsButtonLabel,
                  value: advanced.showGifButton,
                  onChanged: (value) => notifier.setShowGifButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowMediaButtonLabel,
                  value: advanced.showMemesButton,
                  onChanged: (value) =>
                      notifier.setShowMemesButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowStickersButtonLabel,
                  value: advanced.showStickersButton,
                  onChanged: (value) =>
                      notifier.setShowStickersButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowEmojiButtonLabel,
                  value: advanced.showEmojiButton,
                  onChanged: (value) =>
                      notifier.setShowEmojiButton(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingShowSendButtonLabel,
                  value: advanced.showMessageSendButton,
                  onChanged: (value) =>
                      notifier.setShowMessageSendButton(value: value),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedVoiceJoinSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingVoiceChannelJoinBehaviorLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final advanced = ref.watch(advancedPreferencesProvider);
          final notifier = ref.read(advancedPreferencesProvider.notifier);
          final bool doubleClick = advanced.voiceChannelJoinRequiresDoubleClick;

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: FluxerSettingsSwitchGroup(
              children: [
                if (showKeyboardShortcutAdvancedSettings(sheetContext))
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.advancedSettingRequireDoubleClickJoinLabel,
                    value: doubleClick,
                    onChanged: (value) => notifier
                        .setVoiceChannelJoinRequiresDoubleClick(value: value),
                  ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingConfirmBeforeJoiningVoiceLabel,
                  value:
                      advanced.confirmBeforeJoiningVoiceChannels &&
                      !doubleClick,
                  enabled: !doubleClick,
                  onChanged: (value) => notifier
                      .setConfirmBeforeJoiningVoiceChannels(value: value),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedScreenSharePreviewSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingScreenSharePreviewBehaviorLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final advanced = ref.watch(advancedPreferencesProvider);
          final advancedNotifier = ref.read(
            advancedPreferencesProvider.notifier,
          );

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingPauseScreenSharePreviewLabel,
                  value: ref.watch(
                    voiceSettingsProvider.select(
                      (state) => state.pauseOwnScreenSharePreviewOnUnfocus,
                    ),
                  ),
                  onChanged: (value) => ref
                      .read(voiceSettingsProvider.notifier)
                      .setPauseOwnScreenSharePreviewOnUnfocus(value: value),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.advancedSettingHideStreamPreviewLabel,
                  value: advanced.disableStreamPreviews,
                  onChanged: (value) =>
                      advancedNotifier.setDisableStreamPreviews(value: value),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
