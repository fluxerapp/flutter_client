import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_swatch_button.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/typing_indicator_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/advanced_setting_visibility.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserLookAndFeel extends ConsumerWidget {
  const UserLookAndFeel({this.scrollController, super.key});

  final ScrollController? scrollController;

  static const _darkSwatch = Color(0xFF1E222C);
  static const _coalSwatch = Color(0xFF050608);
  static const _lightSwatch = Color(0xFFFBFBFC);
  static const _systemDarkSwatch = Color(0xFF0A0B0F);

  static const _chatFontSizeMarkers = <double>[12, 14, 15, 16, 18, 20, 24];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final themePref = ref.watch(themePreferenceProvider);
    final appearance = ref.watch(appearancePreferencesProvider);
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final layout = context.layout;

    final systemSwatchColor = platformBrightness == Brightness.dark
        ? _systemDarkSwatch
        : _lightSwatch;

    final isSystem = themePref.mode == FluxerThemeMode.system;
    final inflightMode = themePref.inflightTheme;
    final swatchesEnabled = inflightMode == null;

    void showSyncFailedToast() {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.lookAndFeelThemeSyncFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }

    Future<void> changeTheme(FluxerThemeMode mode) async {
      try {
        await ref.read(themePreferenceProvider.notifier).setTheme(mode);
      } on Object {
        showSyncFailedToast();
      }
    }

    Future<void> changeSync({required bool value}) async {
      try {
        await ref
            .read(themePreferenceProvider.notifier)
            .setSyncAcrossDevices(value: value);
      } on Object {
        showSyncFailedToast();
      }
    }

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'theme',
            title: l10n.lookAndFeelThemeSectionTitle,
            description: l10n.lookAndFeelThemeSectionDescription,
            isFirst: true,
            children: [
              Wrap(
                spacing: layout.s3,
                runSpacing: layout.s3,
                children: [
                  ThemeSwatchButton(
                    label: l10n.lookAndFeelThemeDark,
                    backgroundColor: _darkSwatch,
                    isSelected: themePref.mode == FluxerThemeMode.dark,
                    enabled: swatchesEnabled,
                    isLoading: inflightMode == FluxerThemeMode.dark,
                    onTap: () => unawaited(changeTheme(FluxerThemeMode.dark)),
                  ),
                  ThemeSwatchButton(
                    label: l10n.lookAndFeelThemeCoal,
                    backgroundColor: _coalSwatch,
                    isSelected: themePref.mode == FluxerThemeMode.coal,
                    enabled: swatchesEnabled,
                    isLoading: inflightMode == FluxerThemeMode.coal,
                    onTap: () => unawaited(changeTheme(FluxerThemeMode.coal)),
                  ),
                  ThemeSwatchButton(
                    label: l10n.lookAndFeelThemeLight,
                    backgroundColor: _lightSwatch,
                    isSelected: themePref.mode == FluxerThemeMode.light,
                    enabled: swatchesEnabled,
                    isLoading: inflightMode == FluxerThemeMode.light,
                    onTap: () => unawaited(changeTheme(FluxerThemeMode.light)),
                  ),
                  ThemeSwatchButton(
                    label: l10n.lookAndFeelThemeSystem,
                    backgroundColor: systemSwatchColor,
                    isSelected: isSystem,
                    centerIcon: PhosphorIconsFill.arrowsCounterClockwise,
                    enabled: swatchesEnabled,
                    isLoading: inflightMode == FluxerThemeMode.system,
                    onTap: () => unawaited(changeTheme(FluxerThemeMode.system)),
                  ),
                ],
              ),
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelSyncThemeAcrossDevicesLabel,
                description: isSystem
                    ? l10n.lookAndFeelSyncThemeAcrossDevicesSystemDescription
                    : l10n.lookAndFeelSyncThemeAcrossDevicesDescription,
                value: themePref.syncAcrossDevices && !isSystem,
                enabled: !isSystem && swatchesEnabled,
                onChanged: (value) => unawaited(changeSync(value: value)),
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'chat-font-scaling',
            title: l10n.lookAndFeelChatFontScalingTitle,
            description: l10n.lookAndFeelChatFontScalingDescription,
            children: [
              _ChatFontPreview(
                sample: l10n.lookAndFeelChatFontPreviewSample,
                fontSize: themePref.chatFontSize.toDouble(),
              ),
              FluxerSlider(
                defaultValue: themePref.chatFontSize.toDouble(),
                factoryDefaultValue: 16,
                minValue: 12,
                maxValue: 24,
                markers: _chatFontSizeMarkers,
                stickToMarkers: true,
                onMarkerRender: (value) => FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '${value.toInt()}px',
                    style: context.textStyles.smallText.copyWith(
                      color: value == 16
                          ? context.colors.textPositive
                          : context.colors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onValueRender: (value) => Text('${value.toInt()}px'),
                onValueChange: (value) => unawaited(
                  ref
                      .read(themePreferenceProvider.notifier)
                      .setChatFontSize(value.toInt()),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'interface',
            title: l10n.lookAndFeelInterfaceTitle,
            description: l10n.lookAndFeelInterfaceDescription,
            children: [
              FluxerSettingsSubsection(
                title: l10n.lookAndFeelChannelTypingIndicatorsTitle,
                description: l10n.lookAndFeelChannelTypingIndicatorsDescription,
                children: [
                  Center(
                    child: TypingIndicatorPreview(
                      mode: appearance.channelTypingIndicatorMode,
                      channelName:
                          l10n.lookAndFeelTypingIndicatorPreviewChannelName,
                    ),
                  ),
                  FluxerRadioGroup<ChannelTypingIndicatorMode>(
                    value: appearance.channelTypingIndicatorMode,
                    onChanged: (value) => unawaited(
                      ref
                          .read(appearancePreferencesProvider.notifier)
                          .setChannelTypingIndicatorMode(value),
                    ),
                    items: [
                      FluxerRadioItem(
                        value: ChannelTypingIndicatorMode.avatars,
                        label:
                            l10n.lookAndFeelChannelTypingIndicatorAvatarsName,
                        description: l10n
                            .lookAndFeelChannelTypingIndicatorAvatarsDescription,
                      ),
                      FluxerRadioItem(
                        value: ChannelTypingIndicatorMode.indicatorOnly,
                        label: l10n.lookAndFeelChannelTypingIndicatorOnlyName,
                        description: l10n
                            .lookAndFeelChannelTypingIndicatorOnlyDescription,
                      ),
                      FluxerRadioItem(
                        value: ChannelTypingIndicatorMode.hidden,
                        label: l10n.lookAndFeelChannelTypingIndicatorHiddenName,
                        description: l10n
                            .lookAndFeelChannelTypingIndicatorHiddenDescription,
                      ),
                    ],
                  ),
                  FluxerSwitchGroupItem(
                    label:
                        l10n.lookAndFeelShowSelectedChannelTypingIndicatorLabel,
                    description: l10n
                        .lookAndFeelShowSelectedChannelTypingIndicatorDescription,
                    value: appearance.showSelectedChannelTypingIndicator,
                    onChanged: (value) => unawaited(
                      ref
                          .read(appearancePreferencesProvider.notifier)
                          .setShowSelectedChannelTypingIndicator(value: value),
                    ),
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.lookAndFeelKeyboardHintsTitle,
                description: l10n.lookAndFeelKeyboardHintsDescription,
                children: [
                  FluxerSwitchGroupItem(
                    label: l10n.lookAndFeelHideKeyboardHintsLabel,
                    description: l10n.lookAndFeelHideKeyboardHintsDescription,
                    value: appearance.hideKeyboardHints,
                    onChanged: (value) => unawaited(
                      ref
                          .read(appearancePreferencesProvider.notifier)
                          .setHideKeyboardHints(value: value),
                    ),
                  ),
                ],
              ),
              if (showKeyboardShortcutAdvancedSettings(context))
                FluxerSettingsSubsection(
                  title: l10n.lookAndFeelVoiceChannelJoinTitle,
                  description: l10n.lookAndFeelVoiceChannelJoinDescription,
                  children: [
                    // TODO(M0n7y5): wire to UserPreferences + sync once the
                    // Dart SDK exposes SyncedAccessibilityPreferences. Toggle is
                    // presentational only for now.
                    FluxerSwitchGroupItem(
                      label: l10n.lookAndFeelRequireDoubleClickJoinLabel,
                      description:
                          l10n.lookAndFeelRequireDoubleClickJoinDescription,
                      value: false,
                      onChanged: (_) {},
                    ),
                  ],
                ),
              FluxerSettingsSubsection(
                title: l10n.lookAndFeelGuildSidebarTitle,
                description: l10n.lookAndFeelGuildSidebarDescription,
                children: [
                  FluxerSwitchGroupItem(
                    label: l10n.lookAndFeelCollapseDMsLabel,
                    description: l10n.lookAndFeelCollapseDMsDescription,
                    value: appearance.collapseDMs,
                    onChanged: (value) => unawaited(
                      ref
                          .read(appearancePreferencesProvider.notifier)
                          .setCollapseDMs(value: value),
                    ),
                  ),
                ],
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'channel-list',
            title: l10n.lookAndFeelChannelListSectionTitle,
            description: l10n.lookAndFeelChannelListSectionDescription,
            children: [
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelShowFadedUnreadOnMutedChannelsLabel,
                description:
                    l10n.lookAndFeelShowFadedUnreadOnMutedChannelsDescription,
                value: appearance.showFadedUnreadOnMutedChannels,
                onChanged: (value) => unawaited(
                  ref
                      .read(appearancePreferencesProvider.notifier)
                      .setShowFadedUnreadOnMutedChannels(value: value),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'active-now',
            title: l10n.lookAndFeelActiveNowSectionTitle,
            description: l10n.lookAndFeelActiveNowSectionDescription,
            children: [
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelShowActiveNowLabel,
                description: l10n.lookAndFeelShowActiveNowDescription,
                value: appearance.showActiveNow,
                onChanged: (value) => unawaited(
                  ref
                      .read(appearancePreferencesProvider.notifier)
                      .setShowActiveNow(value: value),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.lookAndFeelFavoritesSectionTitle,
            description: l10n.lookAndFeelFavoritesSectionDescription,
            children: [
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelEnableFavoritesLabel,
                description: l10n.lookAndFeelEnableFavoritesDescription,
                value: appearance.showFavorites,
                onChanged: (value) => unawaited(
                  ref
                      .read(appearancePreferencesProvider.notifier)
                      .setShowFavorites(value: value),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.lookAndFeelNekoTitle,
            description: l10n.lookAndFeelNekoDescription,
            children: [
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelShowNekoLabel,
                description: l10n.lookAndFeelShowNekoDescription,
                value: appearance.showNeko,
                onChanged: (value) => unawaited(
                  ref
                      .read(appearancePreferencesProvider.notifier)
                      .setShowNeko(value: value),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChatFontPreview extends StatelessWidget {
  const _ChatFontPreview({required this.sample, required this.fontSize});

  final String sample;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusMd,
      ),
      child: Text(
        sample,
        style: context.textStyles.messageText.copyWith(
          fontSize: fontSize,
          color: colors.textPrimary,
        ),
      ),
    );
  }
}
