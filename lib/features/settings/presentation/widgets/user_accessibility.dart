import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/resolve_reduced_motion.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/accessibility_saturation_slider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility_animation_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility_keyboard_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_accessibility_tts_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class UserAccessibility extends ConsumerWidget {
  const UserAccessibility({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appearance = ref.watch(appearancePreferencesProvider);
    final appearanceNotifier = ref.read(appearancePreferencesProvider.notifier);
    final l10n = FluxerLocalizations.of(context);
    final bool showPreview = !isMobileLayout(context);
    final bool showKeyboard = !isTouchPrimaryInput(ref);
    final bool platformReducedMotion = MediaQuery.disableAnimationsOf(context);
    final bool reducedMotion = resolveReducedMotion(
      syncReducedMotionWithSystem: appearance.syncReducedMotionWithSystem,
      reducedMotionOverride: appearance.reducedMotionOverride,
      platformReducedMotion: platformReducedMotion,
    );
    final String reduceMotionBaseDescription =
        appearance.syncReducedMotionWithSystem
        ? l10n.accessibilityReducedMotionOverrideSyncedDescription
        : l10n.accessibilityReducedMotionOverrideManualDescription;
    final String reduceMotionDescription = reducedMotion
        ? '$reduceMotionBaseDescription ${l10n.accessibilityReducedMotionAnimationTabHint}'
        : reduceMotionBaseDescription;

    final layout = context.layout;

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showPreview) ...[
            const UserAccessibilityPreview(),
            SizedBox(height: layout.s8),
          ],
          FluxerSettingsSection(
            sectionId: 'visual',
            title: l10n.accessibilityVisualGroupTitle,
            isFirst: true,
            children: [
              FluxerSettingsSubsection(
                title: l10n.accessibilitySaturationTitle,
                children: const [AccessibilitySaturationSlider()],
              ),
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityAlwaysUnderlineLinksLabel,
                    value: appearance.alwaysUnderlineLinks,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setAlwaysUnderlineLinks(value: value),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityDimStrikethroughTextLabel,
                    value: appearance.dimStrikethroughText,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setDimStrikethroughText(value: value),
                    ),
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.accessibilityDmMessagePreviewGroupTitle,
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
                          label:
                              l10n.accessibilityDmMessagePreviewUnreadOnlyName,
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
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'screen-reader',
            title: l10n.accessibilityScreenReaderGroupTitle,
            children: [
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label:
                        l10n.accessibilityScreenReaderAnnounceNewMessagesLabel,
                    description: l10n
                        .accessibilityScreenReaderAnnounceNewMessagesDescription,
                    value: appearance.screenReaderAnnounceNewMessages,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setScreenReaderAnnounceNewMessages(
                        value: value,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const UserAccessibilityTtsSection(),
          if (showKeyboard) const UserAccessibilityKeyboardSection(),
          const UserAccessibilityAnimationSection(),
          FluxerSettingsSection(
            sectionId: 'motion',
            title: l10n.accessibilityMotionGroupTitle,
            children: [
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilitySyncReducedMotionWithSystemLabel,
                    description: l10n
                        .accessibilitySyncReducedMotionWithSystemDescription,
                    value: appearance.syncReducedMotionWithSystem,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setSyncReducedMotionWithSystem(
                        value: value,
                      ),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.accessibilityReducedMotionOverrideLabel,
                    description: reduceMotionDescription,
                    value: appearance.syncReducedMotionWithSystem
                        ? reducedMotion
                        : appearance.reducedMotionOverride,
                    enabled: !appearance.syncReducedMotionWithSystem,
                    onChanged: (value) => unawaited(
                      appearanceNotifier.setReducedMotionOverride(value: value),
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
