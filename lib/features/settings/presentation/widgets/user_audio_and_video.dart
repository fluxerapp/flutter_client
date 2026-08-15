import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/voice_mic_test_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/voice_prompts_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_audio_processing_options.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share_presets.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:material_ui/material_ui.dart';

class UserAudioAndVideo extends ConsumerStatefulWidget {
  const UserAudioAndVideo({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserAudioAndVideo> createState() => _UserAudioAndVideoState();
}

class _UserAudioAndVideoState extends ConsumerState<UserAudioAndVideo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ref.read(voiceMediaDevicesProvider.notifier).refresh());
    });
  }

  String _deviceLabel(FluxerLocalizations l10n, VoiceMediaDeviceOption device) {
    if (device.deviceId == kDefaultVoiceDeviceId) {
      return l10n.audioAndVideoDefaultDeviceLabel;
    }
    if (device.label.isNotEmpty) {
      return device.label;
    }
    return device.deviceId;
  }

  List<FluxerSelectItem<String>> _deviceItems(
    FluxerLocalizations l10n,
    List<VoiceMediaDeviceOption> devices,
  ) {
    return devices
        .map(
          (VoiceMediaDeviceOption device) => FluxerSelectItem<String>(
            value: device.deviceId,
            label: _deviceLabel(l10n, device),
          ),
        )
        .toList();
  }

  Widget _volumePercentageLabel(double value) {
    return Text('${value.round()}%');
  }

  Widget _volumePercentageMarker(double value) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final bool isFactoryDefault =
        value == kDefaultVoiceVolumePercent.toDouble();
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        '${value.round()}%',
        style: textStyles.smallText.copyWith(
          color: isFactoryDefault ? colors.textPositive : colors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _volumeSlider({
    required double value,
    required ValueChanged<double> onValueChange,
  }) {
    return FluxerSlider(
      value: value,
      defaultValue: value,
      factoryDefaultValue: kDefaultVoiceVolumePercent.toDouble(),
      minValue: kMinVoiceVolumePercent.toDouble(),
      maxValue: kMaxVoiceVolumePercent.toDouble(),
      markers: const <double>[0, 50, 100, 150, 200],
      step: 1,
      onValueRender: _volumePercentageLabel,
      onMarkerRender: _volumePercentageMarker,
      onValueChange: onValueChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceSettings settingsNotifier = ref.read(
      voiceSettingsProvider.notifier,
    );
    final VoiceMediaDevicesState devices = ref.watch(voiceMediaDevicesProvider);
    final VoicePromptsPreferencesState prompts = ref.watch(
      voicePromptsPreferencesProvider,
    );
    final VoicePromptsPreferences promptsNotifier = ref.read(
      voicePromptsPreferencesProvider.notifier,
    );
    final bool higherQualityEnabled = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featureHigherVideoQuality),
    );
    final bool canSwitchSpeaker = AudioManager.instance.canSwitchSpeakerphone;
    final bool showCameraDevicePicker = !isMobileVoiceCameraPlatform();

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'audio',
            title: l10n.audioAndVideoAudioSectionTitle,
            description: l10n.audioAndVideoAudioSectionDescription,
            isFirst: true,
            children: [
              FluxerSelect<String>(
                label: l10n.audioAndVideoInputDeviceLabel,
                value: settings.inputDeviceId,
                items: _deviceItems(l10n, devices.audioInputs),
                onChanged: (String value) =>
                    unawaited(settingsNotifier.setInputDeviceId(value)),
              ),
              if (canSwitchSpeaker)
                FluxerSettingsSwitchItem(
                  label: l10n.audioAndVideoUseSpeakerLabel,
                  description: l10n.audioAndVideoUseSpeakerDescription,
                  value: settings.preferSpeakerOutput,
                  onChanged: (bool value) => unawaited(
                    settingsNotifier.setPreferSpeakerOutput(value: value),
                  ),
                )
              else if (devices.audioOutputs.length > 1)
                FluxerSelect<String>(
                  label: l10n.audioAndVideoOutputDeviceLabel,
                  value: settings.outputDeviceId,
                  items: _deviceItems(l10n, devices.audioOutputs),
                  onChanged: (String value) =>
                      unawaited(settingsNotifier.setOutputDeviceId(value)),
                ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoInputVolumeLabel,
                children: [
                  _volumeSlider(
                    value: settings.inputVolume.toDouble(),
                    onValueChange: (double value) => unawaited(
                      settingsNotifier.setInputVolume(value.round()),
                    ),
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoOutputVolumeLabel,
                children: [
                  _volumeSlider(
                    value: settings.outputVolume.toDouble(),
                    onValueChange: (double value) => unawaited(
                      settingsNotifier.setOutputVolume(value.round()),
                    ),
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoVoiceProcessingSectionTitle,
                children: const <Widget>[VoiceAudioProcessingOptions()],
              ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoMicTestSectionTitle,
                children: const [VoiceMicTestSection()],
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'video',
            title: l10n.audioAndVideoVideoSectionTitle,
            description: l10n.audioAndVideoVideoSectionDescription,
            children: [
              if (showCameraDevicePicker) ...[
                FluxerSelect<String>(
                  label: l10n.audioAndVideoCameraLabel,
                  value: settings.videoDeviceId,
                  items: _deviceItems(l10n, devices.videoInputs),
                  onChanged: (String value) =>
                      unawaited(settingsNotifier.setVideoDeviceId(value)),
                ),
                SizedBox(height: layout.s4),
              ],
              FluxerSettingsSwitchItem(
                label: l10n.audioAndVideoMirrorCameraLabel,
                value: settings.mirrorCamera,
                onChanged: (bool value) =>
                    unawaited(settingsNotifier.setMirrorCamera(value: value)),
              ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoCameraQualitySectionTitle,
                children: [
                  FluxerRadioGroup<CameraResolution>(
                    value: settings.cameraResolution,
                    onChanged: (CameraResolution value) {
                      if (!higherQualityEnabled &&
                          isHigherVideoQualityCameraResolution(value)) {
                        return;
                      }
                      unawaited(settingsNotifier.setCameraResolution(value));
                    },
                    items: [
                      FluxerRadioItem(
                        value: CameraResolution.low,
                        label: l10n.audioAndVideoCameraQuality480pLabel,
                      ),
                      FluxerRadioItem(
                        value: CameraResolution.medium,
                        label: l10n.audioAndVideoCameraQuality720pLabel,
                      ),
                      FluxerRadioItem(
                        value: CameraResolution.high,
                        label: l10n.audioAndVideoCameraQuality1080pLabel,
                      ),
                    ],
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoScreenShareQualitySectionTitle,
                children: [
                  FluxerRadioGroup<ScreenshareResolution>(
                    value: settings.screenshareResolution,
                    onChanged: (ScreenshareResolution value) {
                      if (!higherQualityEnabled &&
                          isHigherVideoQualityScreenShareResolution(value)) {
                        return;
                      }
                      unawaited(
                        settingsNotifier.setScreenshareResolution(value),
                      );
                    },
                    items: [
                      FluxerRadioItem(
                        value: ScreenshareResolution.low480p,
                        label: l10n.audioAndVideoCameraQuality480pLabel,
                      ),
                      FluxerRadioItem(
                        value: ScreenshareResolution.medium,
                        label: l10n.audioAndVideoCameraQuality720pLabel,
                      ),
                      FluxerRadioItem(
                        value: ScreenshareResolution.high,
                        label: l10n.audioAndVideoCameraQuality1080pLabel,
                      ),
                    ],
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.audioAndVideoFrameRateSectionTitle,
                children: [
                  FluxerRadioGroup<int>(
                    value: settings.videoFrameRate,
                    onChanged: (int value) {
                      if (!higherQualityEnabled &&
                          isHigherVideoQualityFrameRate(value)) {
                        return;
                      }
                      unawaited(settingsNotifier.setVideoFrameRate(value));
                    },
                    items: [
                      FluxerRadioItem(
                        value: 15,
                        label: l10n.audioAndVideoFrameRate15Label,
                      ),
                      FluxerRadioItem(
                        value: 30,
                        label: l10n.audioAndVideoFrameRate30Label,
                      ),
                      FluxerRadioItem(
                        value: 60,
                        label: l10n.audioAndVideoFrameRate60Label,
                      ),
                    ],
                  ),
                ],
              ),
              if (!higherQualityEnabled)
                Padding(
                  padding: EdgeInsets.only(top: layout.s3),
                  child: Text(
                    l10n.audioAndVideoInstanceVideoQualityLimit,
                    style: context.textStyles.bodySmall.copyWith(fontSize: 13),
                  ),
                ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.audioAndVideoInCallBehaviorSectionTitle,
            description: l10n.audioAndVideoInCallBehaviorSectionDescription,
            children: [
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.audioAndVideoSkipHideOwnCameraConfirmLabel,
                    value: prompts.skipHideOwnCameraConfirm,
                    onChanged: (bool value) => unawaited(
                      promptsNotifier.setSkipHideOwnCameraConfirm(value: value),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.audioAndVideoSkipHideOwnScreenshareConfirmLabel,
                    value: prompts.skipHideOwnScreenshareConfirm,
                    onChanged: (bool value) => unawaited(
                      promptsNotifier.setSkipHideOwnScreenshareConfirm(
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
