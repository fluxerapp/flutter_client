import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/advanced_video_settings_row.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/screen_share_premium_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/video_control_group.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/video_quality_note.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/video_quality_rows.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/video_quality_labels.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_video_quality_provider.dart';
import 'package:fluxer_app/features/voice/utils/media/camera_platform.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceVideoSettings extends ConsumerWidget {
  const VoiceVideoSettings({this.onOpenAdvancedSettings, super.key});

  final VoidCallback? onOpenAdvancedSettings;

  static const double _kGroupGap = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceSettings notifier = ref.read(voiceSettingsProvider.notifier);
    final VideoQualityCaps entitlementCaps = ref.watch(
      voiceVideoQualityCapsProvider,
    );
    final VideoQualityCaps deviceCaps = ref.watch(
      voiceDeviceVideoQualityCapsProvider,
    );
    final String premiumProductName = ref.watch(
      instanceRuntimeConfigProvider.select(
        (config) => config.premiumProductName,
      ),
    );
    final ScreenShareSettingsView view = resolveScreenShareSettingsView(
      settings: settings,
      entitlementCaps: entitlementCaps,
      deviceCaps: deviceCaps,
      bitrate: ref.watch(voiceScreenShareBitrateBudgetProvider),
      showsPremiumFeatures: ref.watch(
        instanceRuntimeConfigProvider.select(
          (config) => config.showsPremiumFeatures,
        ),
      ),
    );
    final VoiceVideoQualityRows rows = VoiceVideoQualityRows(
      l10n: l10n,
      notifier: notifier,
      settings: settings,
      view: view,
      caps: entitlementCaps.limitedTo(deviceCaps),
    );
    final bool showUpsell =
        view.showUpsell && ref.watch(shouldShowPremiumCommerceProvider);
    final List<VoiceVideoQualityNote> notes = _notes(
      l10n,
      view,
      premiumProductName,
    );
    final Widget? cameraDevice = isMobileVoiceCameraPlatform()
        ? null
        : rows.cameraDevice(ref.watch(voiceMediaDevicesProvider).videoInputs);
    final FluxerSettingsSwitchItem mirror = FluxerSettingsSwitchItem(
      label: l10n.audioAndVideoMirrorCameraLabel,
      value: settings.mirrorCamera,
      onChanged: (bool value) =>
          unawaited(notifier.setMirrorCamera(value: value)),
    );

    if (isMobileLayout(context)) {
      final bool phone = !kIsWeb && isFluxerNativeMobileOs;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FluxerSettingsSubsection(
            title: l10n.audioAndVideoCameraLabel,
            children: <Widget>[?cameraDevice, mirror, rows.cameraQuality()],
          ),
          FluxerSettingsSubsection(
            title: l10n.audioAndVideoScreenShareGroupTitle,
            children: <Widget>[
              rows.streamingMode(),
              rows.resolution(),
              rows.frameRate(),
              if (view.showBitrate) rows.bitrate(),
              ...notes,
              if (showUpsell)
                FluxerPlutoniumUpsell(
                  text: l10n.audioAndVideoScreenShareUpsellTitle(
                    premiumProductName,
                  ),
                  buttonLabel: l10n.audioAndVideoGetPremium(premiumProductName),
                  child: Text(
                    phone
                        ? l10n.audioAndVideoScreenShareUpsellDescriptionMobile
                        : l10n.audioAndVideoScreenShareUpsellDescription,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textOnBrandPrimary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: _kGroupGap,
      children: <Widget>[
        VoiceVideoControlGroup(
          children: <Widget>[?cameraDevice, mirror, rows.cameraQuality()],
        ),
        VoiceVideoControlGroup(
          children: <Widget>[
            rows.streamingMode(),
            rows.resolution(),
            if (showUpsell)
              VoiceScreenSharePremiumCard(
                title: l10n.audioAndVideoScreenShareUpsellTitle(
                  premiumProductName,
                ),
                description: l10n.audioAndVideoScreenShareUpsellDescription,
                buttonLabel: l10n.audioAndVideoGetPremium(premiumProductName),
                onPressed: () => openPlutoniumUpsell(context, ref),
              ),
            rows.frameRate(),
            ...notes,
            if (view.showBitrate) rows.bitrate(),
          ],
        ),
        if (onOpenAdvancedSettings case final VoidCallback open)
          VoiceAdvancedVideoSettingsRow(
            label: l10n.audioAndVideoAdvancedVideoSettingsLabel,
            buttonLabel: l10n.audioAndVideoOpenAdvancedMediaSettings,
            onPressed: open,
          ),
      ],
    );
  }

  List<VoiceVideoQualityNote> _notes(
    FluxerLocalizations l10n,
    ScreenShareSettingsView view,
    String premiumProductName,
  ) {
    final ScreenShareQuality? instanceLimit = view.instanceLimit;
    final ScreenShareQuality? saved = view.saved;
    return <VoiceVideoQualityNote>[
      if (view.showHighFrameRateNote)
        VoiceVideoQualityNote(
          text: l10n.audioAndVideoHighFrameRateRequiresPremium(
            premiumProductName,
          ),
          premium: true,
        ),
      if (instanceLimit != null)
        VoiceVideoQualityNote(
          text: l10n.audioAndVideoInstanceScreenShareLimit(
            screenShareResolutionLabel(l10n, instanceLimit.resolution),
            instanceLimit.frameRate,
          ),
        ),
      if (view.mode != StreamingMode.custom)
        VoiceVideoQualityNote(
          text: l10n.audioAndVideoScreenSharePresetOwned(
            streamingModeLabel(l10n, view.mode),
          ),
        ),
      if (saved != null)
        VoiceVideoQualityNote(
          text: l10n.audioAndVideoScreenShareSavedNeedsPremium(
            screenShareResolutionLabel(l10n, saved.resolution),
            saved.frameRate,
            premiumProductName,
            screenShareResolutionLabel(l10n, view.quality.resolution),
            view.quality.frameRate,
          ),
          premium: true,
        ),
      if (!kIsWeb && Platform.isIOS)
        VoiceVideoQualityNote(text: l10n.audioAndVideoIosScreenShareLimit),
    ];
  }
}
