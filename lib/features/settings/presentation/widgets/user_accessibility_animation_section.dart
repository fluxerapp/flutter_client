import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/accessibility/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/accessibility/motion_preferences.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;

class UserAccessibilityAnimationSection extends ConsumerWidget {
  const UserAccessibilityAnimationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final MotionAppearanceSlice appearance = ref.watch(
      appearancePreferencesProvider.select(motionAppearanceSlice),
    );
    final MotionUserSettingsSlice userSettings = ref.watch(
      userSettingsViewModelProvider.select(motionUserSettingsSlice),
    );
    final bool isMobile = isMobileLayout(context);
    final input = motionPreferencesInputFromSlices(
      appearance: appearance,
      userSettings: userSettings,
      systemReducedMotion: MediaQuery.disableAnimationsOf(context),
      isMobile: isMobile,
    );
    final model = resolveMotionPreferencesModel(input);

    String? emojiDescription;
    if (model.emojiOverridesReducedMotion) {
      emojiDescription = l10n.accessibilityPlayingDespiteReducedMotion;
    } else if (model.reducedMotion) {
      emojiDescription = l10n.accessibilityPausedEmojiByReducedMotion;
    }

    String? gifDescription;
    if (model.gifOverridesReducedMotion) {
      gifDescription = l10n.accessibilityPlayingDespiteReducedMotion;
    } else if (model.reducedMotion) {
      gifDescription = l10n.accessibilityPausedGifByReducedMotion;
    }

    String? stickerDescription;
    if (model.stickerOverridesReducedMotion) {
      stickerDescription = l10n.accessibilityStickersAlwaysDespiteReducedMotion;
    } else if (model.reducedMotion) {
      stickerDescription = l10n.accessibilityStickersReducedMotionHint;
    } else if (isMobile && !appearance.mobileStickerAnimationOverridden) {
      stickerDescription = l10n.accessibilityStickersDefaultsOnMobile;
    }

    Future<void> applyWrite(MotionPreferencesWrite write) async {
      final appearanceNotifier = ref.read(
        appearancePreferencesProvider.notifier,
      );
      final settingsNotifier = ref.read(userSettingsViewModelProvider.notifier);
      await appearanceNotifier.applyMotionPreferencesWrite(write);
      if (write.animateEmoji != null) {
        await settingsNotifier.setAnimateEmoji(value: write.animateEmoji!);
      }
      if (write.gifAutoPlay != null) {
        await settingsNotifier.setGifAutoPlay(value: write.gifAutoPlay!);
      }
      if (write.animateStickers != null) {
        await settingsNotifier.setAnimateStickers(write.animateStickers!);
      }
    }

    return FluxerSettingsSection(
      sectionId: 'animation',
      title: l10n.accessibilityAnimationGroupTitle,
      description: model.reducedMotion
          ? l10n.accessibilityReducedMotionActiveNote
          : null,
      children: [
        FluxerSettingsSwitchGroup(
          children: [
            FluxerSettingsSwitchItem.grouped(
              label: l10n.accessibilityPlayAnimatedEmojisLabel,
              description: emojiDescription,
              value: model.effectiveAnimateEmoji,
              onChanged: (value) => unawaited(
                applyWrite(
                  resolveAnimateEmojiRequest(input: input, value: value),
                ),
              ),
            ),
            FluxerSettingsSwitchItem.grouped(
              label: isMobile
                  ? l10n.accessibilityAutoPlayGifsMobileLabel
                  : l10n.accessibilityAutoPlayGifsDesktopLabel(
                      kFluxerProductName,
                    ),
              description: gifDescription,
              value: model.effectiveGifAutoPlay,
              onChanged: (value) => unawaited(
                applyWrite(
                  resolveGifAutoPlayRequest(input: input, value: value),
                ),
              ),
            ),
          ],
        ),
        FluxerSettingsSubsection(
          title: l10n.accessibilityStickerAnimationsTitle,
          description: stickerDescription,
          children: [
            Semantics(
              label: l10n.accessibilityStickerAnimationPreferenceLabel,
              container: true,
              child: FluxerRadioGroup<StickerAnimationOptions>(
                value: model.effectiveAnimateStickers,
                onChanged: (value) => unawaited(
                  applyWrite(
                    resolveAnimateStickersRequest(input: input, value: value),
                  ),
                ),
                items: [
                  FluxerRadioItem(
                    value: StickerAnimationOptions.alwaysAnimate,
                    label: l10n.accessibilityStickerAlwaysAnimateName,
                    description:
                        l10n.accessibilityStickerAlwaysAnimateDescription,
                  ),
                  FluxerRadioItem(
                    value: StickerAnimationOptions.animateOnInteraction,
                    label: l10n.accessibilityStickerAnimateOnInteractionName,
                    description: isMobile
                        ? l10n.accessibilityStickerAnimateOnPressDescription
                        : l10n.accessibilityStickerAnimateOnHoverDescription,
                  ),
                  FluxerRadioItem(
                    value: StickerAnimationOptions.neverAnimate,
                    label: l10n.accessibilityStickerNeverAnimateName,
                    description:
                        l10n.accessibilityStickerNeverAnimateDescription,
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
