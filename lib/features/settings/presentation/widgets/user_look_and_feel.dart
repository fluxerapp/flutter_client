import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/look_and_feel_messages_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_swatch_button.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/typing_indicator_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/advanced_setting_visibility.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserLookAndFeel extends ConsumerWidget {
  const UserLookAndFeel({this.scrollController, super.key});

  final ScrollController? scrollController;

  static const _darkSwatch = Color(0xFF1E222C);
  static const _coalSwatch = Color(0xFF050608);
  static const _lightSwatch = Color(0xFFFBFBFC);
  static const _systemDarkSwatch = Color(0xFF0A0B0F);

  static const List<double> _appZoomMarkerPercents =
      kAppZoomLevelMarkerPercents;

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
            sectionId: 'hdr',
            title: l10n.lookAndFeelHdrSectionTitle,
            description: l10n.lookAndFeelHdrSectionDescription,
            children: [
              Semantics(
                container: true,
                label: l10n.lookAndFeelHdrDisplayModeLabel,
                child: FluxerRadioGroup<HdrDisplayMode>(
                  value: appearance.hdrDisplayMode,
                  onChanged: (HdrDisplayMode value) => unawaited(
                    ref
                        .read(appearancePreferencesProvider.notifier)
                        .setHdrDisplayMode(value),
                  ),
                  items: [
                    FluxerRadioItem(
                      value: HdrDisplayMode.full,
                      label: l10n.lookAndFeelHdrFullName,
                      description: l10n.lookAndFeelHdrFullDescription,
                    ),
                    FluxerRadioItem(
                      value: HdrDisplayMode.standard,
                      label: l10n.lookAndFeelHdrStandardName,
                      description: l10n.lookAndFeelHdrStandardDescription,
                    ),
                  ],
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'app-zoom-level',
            title: l10n.lookAndFeelAppZoomTitle,
            description: l10n.lookAndFeelAppZoomDescription,
            children: [
              FluxerSlider(
                defaultValue: themePref.scaleFactor * 100,
                factoryDefaultValue: kDefaultLayoutZoomLevel * 100,
                minValue: kMinLayoutZoomLevel * 100,
                maxValue: kMaxLayoutZoomLevel * 100,
                markers: _appZoomMarkerPercents,
                step: 1,
                markerLabelWidth: 36,
                semanticLabel: l10n.lookAndFeelAppZoomTitle,
                onMarkerRender: (double value) {
                  final bool isDefault =
                      value.round() == kDefaultLayoutZoomLevel * 100;
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${value.round()}%',
                      style: context.textStyles.smallText.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDefault
                            ? context.colors.textPositive
                            : context.colors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                onValueRender: (value) => Text('${value.round()}%'),
                onValueChange: (value) => unawaited(
                  ref
                      .read(themePreferenceProvider.notifier)
                      .setScaleFactor(value / 100),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'messages',
            title: l10n.lookAndFeelMessagesSectionTitle,
            description: l10n.lookAndFeelMessagesSectionDescription,
            children: const [LookAndFeelMessagesSection()],
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
        ],
      ),
    );
  }
}
