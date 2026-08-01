import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class UserAccessibility extends ConsumerWidget {
  const UserAccessibility({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appearance = ref.watch(appearancePreferencesProvider);
    final appearanceNotifier = ref.read(appearancePreferencesProvider.notifier);
    final themePref = ref.watch(themePreferenceProvider);
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.accessibilitySaturationTitle,
            description: l10n.accessibilitySaturationDescription,
            isFirst: true,
            children: [
              FluxerSlider(
                defaultValue: themePref.saturationFactor * 100,
                factoryDefaultValue: 100,
                markers: const <double>[
                  0,
                  10,
                  20,
                  30,
                  40,
                  50,
                  60,
                  70,
                  80,
                  90,
                  100,
                ],
                onMarkerRender: (value) {
                  final textStyles = context.textStyles;
                  final colors = context.colors;
                  final isFactoryDefault = value == 100;
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${value.round()}%',
                      style: textStyles.smallText.copyWith(
                        color: isFactoryDefault
                            ? colors.textPositive
                            : colors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                onValueRender: (value) => Text('${value.round()}%'),
                onValueChange: (value) => unawaited(
                  ref
                      .read(themePreferenceProvider.notifier)
                      .setSaturationFactor(value / 100),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.accessibilityUnreadGroupTitle,
            description: l10n.accessibilityUnreadGroupDescription,
            children: [
              FluxerSettingsSwitchItem(
                label: l10n.accessibilityShowFadedUnreadOnMutedChannelsLabel,
                description:
                    l10n.accessibilityShowFadedUnreadOnMutedChannelsDescription,
                value: appearance.showFadedUnreadOnMutedChannels,
                onChanged: (value) => unawaited(
                  appearanceNotifier.setShowFadedUnreadOnMutedChannels(
                    value: value,
                  ),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.accessibilityDmMessagePreviewGroupTitle,
            description: l10n.accessibilityDmMessagePreviewGroupDescription,
            children: [
              Semantics(
                label: l10n.accessibilityDmMessagePreviewModeLabel,
                container: true,
                child: FluxerRadioGroup<DmMessagePreviewMode>(
                  value: appearance.dmMessagePreviewMode,
                  onChanged: (value) => unawaited(
                    appearanceNotifier.setDmMessagePreviewMode(value),
                  ),
                  items: [
                    FluxerRadioItem(
                      value: DmMessagePreviewMode.all,
                      label: l10n.accessibilityDmMessagePreviewAllName,
                      description:
                          l10n.accessibilityDmMessagePreviewAllDescription,
                    ),
                    FluxerRadioItem(
                      value: DmMessagePreviewMode.unreadOnly,
                      label: l10n.accessibilityDmMessagePreviewUnreadOnlyName,
                      description: l10n
                          .accessibilityDmMessagePreviewUnreadOnlyDescription,
                    ),
                    FluxerRadioItem(
                      value: DmMessagePreviewMode.none,
                      label: l10n.accessibilityDmMessagePreviewNoneName,
                      description:
                          l10n.accessibilityDmMessagePreviewNoneDescription,
                    ),
                  ],
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.accessibilityMediaButtonsGroupTitle,
            description: l10n.accessibilityMediaButtonsGroupDescription,
            children: [
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityShowMediaDeleteButtonLabel,
                    value: appearance.showMediaDeleteButton,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setShowMediaDeleteButton(value: value),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityShowMediaDownloadButtonLabel,
                    value: appearance.showMediaDownloadButton,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setShowMediaDownloadButton(
                        value: value,
                      ),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityShowMediaFavoriteButtonLabel,
                    value: appearance.showMediaFavoriteButton,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setShowMediaFavoriteButton(
                        value: value,
                      ),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityShowSuppressEmbedsButtonLabel,
                    value: appearance.showSuppressEmbedsButton,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setShowSuppressEmbedsButton(
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
