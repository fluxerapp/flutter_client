import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceAudioProcessingOptions extends ConsumerWidget {
  const VoiceAudioProcessingOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceSettings settingsNotifier = ref.read(
      voiceSettingsProvider.notifier,
    );
    final bool noiseFilterSupported = ref
        .watch(voiceNoiseFilterProvider)
        .maybeWhen(
          data: (VoiceNoiseFilterState value) => value.isSupported,
          orElse: () => false,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FluxerRadioGroup<VoiceProcessingMode>(
          value: settings.voiceProcessingMode,
          onChanged: (VoiceProcessingMode value) {
            unawaited(settingsNotifier.setVoiceProcessingMode(value));
          },
          items: <FluxerRadioItem<VoiceProcessingMode>>[
            FluxerRadioItem(
              value: VoiceProcessingMode.voice,
              label: l10n.audioAndVideoFocusedVoiceLabel,
              description: l10n.audioAndVideoFocusedVoiceDescription,
            ),
            FluxerRadioItem(
              value: VoiceProcessingMode.studio,
              label: l10n.audioAndVideoDirectInputLabel,
              description: l10n.audioAndVideoDirectInputDescription,
            ),
            FluxerRadioItem(
              value: VoiceProcessingMode.custom,
              label: l10n.audioAndVideoCustomProfileLabel,
              description: l10n.audioAndVideoCustomProfileDescription,
            ),
          ],
        ),
        if (settings.voiceProcessingMode == VoiceProcessingMode.custom)
          FluxerSettingsSubsection(
            title: l10n.audioAndVideoNoiseSuppressionSectionTitle,
            children: <Widget>[
              FluxerRadioGroup<NoiseSuppressionTier>(
                value: settings.noiseSuppressionTier,
                onChanged: (NoiseSuppressionTier value) {
                  unawaited(settingsNotifier.setNoiseSuppressionTier(value));
                },
                items: <FluxerRadioItem<NoiseSuppressionTier>>[
                  FluxerRadioItem(
                    value: NoiseSuppressionTier.enhanced,
                    label: l10n.audioAndVideoNoiseSuppressionEnhancedLabel,
                    enabled: noiseFilterSupported,
                  ),
                  FluxerRadioItem(
                    value: NoiseSuppressionTier.standard,
                    label: l10n.audioAndVideoNoiseSuppressionStandardLabel,
                  ),
                  FluxerRadioItem(
                    value: NoiseSuppressionTier.none,
                    label: l10n.audioAndVideoNoiseSuppressionNoneLabel,
                  ),
                ],
              ),
              FluxerSettingsSwitchItem(
                label: l10n.audioAndVideoEchoCancellationLabel,
                value: settings.echoCancellation,
                onChanged: (bool value) {
                  unawaited(settingsNotifier.setEchoCancellation(value: value));
                },
              ),
              FluxerSettingsSwitchItem(
                label: l10n.audioAndVideoAutomaticGainControlLabel,
                description: l10n.audioAndVideoAutomaticGainControlDescription,
                value: settings.autoGainControl,
                enabled:
                    !(settings.noiseSuppressionTier ==
                            NoiseSuppressionTier.enhanced &&
                        noiseFilterSupported),
                onChanged: (bool value) {
                  unawaited(settingsNotifier.setAutoGainControl(value: value));
                },
              ),
            ],
          ),
      ],
    );
  }
}
