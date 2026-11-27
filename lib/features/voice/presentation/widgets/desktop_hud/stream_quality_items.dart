import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/video_quality_labels.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_settings_view_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceStreamQualityItems extends ConsumerWidget {
  const VoiceStreamQualityItems({
    required this.onClose,
    this.showFrameRate = true,
    this.showResolution = true,
    this.showLabels = true,
    super.key,
  });

  final VoidCallback onClose;
  final bool showFrameRate;
  final bool showResolution;
  final bool showLabels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ScreenShareSettingsView view = ref.watch(
      screenShareSettingsViewProvider,
    );
    final VideoQualityCaps caps = ref.watch(screenShareEffectiveCapsProvider);
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final bool canUpsell = ref.watch(shouldShowPremiumCommerceProvider);

    void apply(ScreenShareQualityPatch? patch) {
      if (patch == null) {
        return;
      }
      unawaited(
        ref
            .read(voiceSettingsProvider.notifier)
            .setScreenShareQuality(
              resolution: patch.resolution,
              frameRate: patch.frameRate,
            ),
      );
    }

    void upsell() {
      onClose();
      openPlutoniumUpsell(context, ref);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (showFrameRate) ...<Widget>[
          if (showLabels)
            FluxerMenuSectionHeader(
              label: l10n.audioAndVideoFrameRateSectionTitle,
            ),
          for (final int value in kScreenShareFrameRates)
            if (view.frameRateOptions.contains(value) ||
                (canUpsell && view.showHighFrameRateNote))
              FluxerMenuRadioItem(
                label: screenShareFrameRateLabel(l10n, value),
                isSelected: value == view.quality.frameRate,
                icon: caps.allowsFrameRate(value)
                    ? null
                    : PhosphorIconsFill.atom,
                onPressed: caps.allowsFrameRate(value)
                    ? () => apply(
                        resolveScreenShareQualityPick(
                          settings: settings,
                          caps: caps,
                          frameRate: value,
                        ),
                      )
                    : upsell,
              ),
        ],
        if (showResolution) ...<Widget>[
          if (showLabels)
            FluxerMenuSectionHeader(label: l10n.voiceScreenShareResolution),
          for (final VideoQualityOption<ScreenshareResolution> option
              in view.resolutionOptions)
            FluxerMenuRadioItem(
              label: screenShareResolutionLabel(l10n, option.value),
              isSelected: option.value == view.quality.resolution,
              icon: option.enabled ? null : PhosphorIconsFill.atom,
              enabled: option.enabled || canUpsell,
              onPressed: option.enabled
                  ? () => apply(
                      resolveScreenShareQualityPick(
                        settings: settings,
                        caps: caps,
                        resolution: option.value,
                      ),
                    )
                  : upsell,
            ),
        ],
      ],
    );
  }
}
