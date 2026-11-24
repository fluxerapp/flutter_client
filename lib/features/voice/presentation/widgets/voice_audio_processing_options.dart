import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/features/voice/utils/audio/external_audio_processor.dart';
import 'package:fluxer_app/features/voice/utils/audio/noise_suppression_labels.dart';
import 'package:fluxer_app/features/voice/utils/audio/processing_profile.dart';
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
    final List<Widget> options = switch (settings.voiceProcessingMode) {
      VoiceProcessingMode.voice => _voiceOptions(
        context,
        ref,
        settings: settings,
      ),
      VoiceProcessingMode.studio => const <Widget>[],
      VoiceProcessingMode.custom => _customOptions(
        context,
        ref,
        settings: settings,
      ),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const _ExternalProcessorWarning(),
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
        if (options.isNotEmpty) _ProcessingOptions(children: options),
      ],
    );
  }

  List<Widget> _voiceOptions(
    BuildContext context,
    WidgetRef ref, {
    required VoiceSettingsState settings,
  }) {
    final String? fallbackMessage = _fallbackMessage(
      context,
      ref,
      settings: settings,
    );
    return <Widget>[
      if (fallbackMessage != null)
        Text(
          fallbackMessage,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
      _automaticGainControlItem(context, ref, settings: settings),
    ];
  }

  List<Widget> _customOptions(
    BuildContext context,
    WidgetRef ref, {
    required VoiceSettingsState settings,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSettings settingsNotifier = ref.read(
      voiceSettingsProvider.notifier,
    );
    final bool mobile = isMobileLayout(context);
    return <Widget>[
      FluxerSettingsSwitchItem(
        label: l10n.audioAndVideoAutoActivityThresholdLabel,
        description: l10n.audioAndVideoAutoActivityThresholdDescription,
        value: settings.vadAutoSensitivity,
        onChanged: (bool value) {
          unawaited(settingsNotifier.setVadAutoSensitivity(value: value));
        },
      ),
      if (!settings.vadAutoSensitivity)
        FluxerSettingsSubsection(
          title: l10n.audioAndVideoActivityThresholdLabel,
          description: l10n.audioAndVideoActivityThresholdDescription,
          children: <Widget>[
            FluxerSlider(
              defaultValue: settings.vadThreshold.toDouble(),
              factoryDefaultValue: kDefaultVadThreshold.toDouble(),
              minValue: 0,
              maxValue: 100,
              step: 1,
              onValueRender: (double value) => Text('${value.round()}%'),
              onValueChange: (double value) {
                unawaited(settingsNotifier.setVadThreshold(value.round()));
              },
            ),
          ],
        ),
      FluxerSettingsSelectRow<NoiseSuppressionBackend>(
        label: l10n.audioAndVideoNoiseSuppressionSectionTitle,
        description: _fallbackMessage(context, ref, settings: settings),
        value: selectedNoiseSuppressionBackend(settings),
        items: <FluxerSelectItem<NoiseSuppressionBackend>>[
          for (final NoiseSuppressionBackend backend
              in NoiseSuppressionBackend.values)
            FluxerSelectItem<NoiseSuppressionBackend>(
              value: backend,
              label: noiseSuppressionBackendLabel(l10n, backend),
              description: mobile
                  ? noiseSuppressionBackendDescription(l10n, backend)
                  : null,
            ),
        ],
        onChanged: (NoiseSuppressionBackend value) {
          unawaited(settingsNotifier.setNoiseSuppressionBackend(value));
        },
      ),
      FluxerSettingsSwitchItem(
        label: l10n.audioAndVideoEchoCancellationLabel,
        description: l10n.audioAndVideoEchoCancellationDescription,
        value: settings.echoCancellation,
        onChanged: (bool value) {
          unawaited(settingsNotifier.setEchoCancellation(value: value));
        },
      ),
      _automaticGainControlItem(context, ref, settings: settings),
    ];
  }

  FluxerSettingsSwitchItem _automaticGainControlItem(
    BuildContext context,
    WidgetRef ref, {
    required VoiceSettingsState settings,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerSettingsSwitchItem(
      label: l10n.audioAndVideoAutomaticGainControlLabel,
      description: l10n.audioAndVideoAutoGainControlDescription,
      value: settings.autoGainControl,
      onChanged: (bool value) {
        unawaited(
          ref
              .read(voiceSettingsProvider.notifier)
              .setAutoGainControl(value: value),
        );
      },
    );
  }

  String? _fallbackMessage(
    BuildContext context,
    WidgetRef ref, {
    required VoiceSettingsState settings,
  }) {
    return noiseSuppressionFallbackMessage(
      FluxerLocalizations.of(context),
      settings: settings,
      unavailableBackends: ref.watch(voiceNoiseFilterProvider),
    );
  }
}

class _ProcessingOptions extends StatelessWidget {
  const _ProcessingOptions({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final bool mobile = isMobileLayout(context);
    return Container(
      margin: EdgeInsets.only(top: layout.s4),
      padding: mobile ? null : EdgeInsets.only(top: layout.s4),
      decoration: mobile
          ? null
          : BoxDecoration(
              border: Border(
                top: BorderSide(color: context.colors.backgroundModifierAccent),
              ),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        spacing: layout.s4,
        children: mobile ? groupSettingsMenuRows(children) : children,
      ),
    );
  }
}

class _ExternalProcessorWarning extends ConsumerWidget {
  const _ExternalProcessorWarning();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isFluxerDesktopOs) {
      return const SizedBox.shrink();
    }
    final (String inputDeviceId, VoiceProcessingMode mode) = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState settings) =>
            (settings.inputDeviceId, settings.voiceProcessingMode),
      ),
    );
    final String? processor = externalAudioProcessorForDevice(
      deviceId: inputDeviceId,
      devices: ref.watch(voiceMediaDevicesProvider).audioInputs,
    );
    if (processor == null || mode == VoiceProcessingMode.studio) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FluxerWarningAlert(
            message: l10n.audioAndVideoExternalProcessorWarning(processor),
          ),
          FluxerTextLink(
            text: l10n.audioAndVideoSwitchToDirectInput,
            onTap: () {
              unawaited(
                ref
                    .read(voiceSettingsProvider.notifier)
                    .setVoiceProcessingMode(VoiceProcessingMode.studio),
              );
            },
          ),
        ],
      ),
    );
  }
}
