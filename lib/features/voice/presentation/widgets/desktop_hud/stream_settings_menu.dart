import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/video_quality_labels.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/stream_quality_items.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/stream_quality_submenu.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_settings_view_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceStreamSettingsMenu extends ConsumerWidget {
  const VoiceStreamSettingsMenu({
    required this.onClose,
    required this.onOpenSettings,
    super.key,
  });

  final VoidCallback onClose;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ScreenShareSettingsView view = ref.watch(
      screenShareSettingsViewProvider,
    );
    final bool hidePreview = ref.watch(
      advancedPreferencesProvider.select(
        (preferences) => preferences.disableStreamPreviews,
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FluxerMenuSectionHeader(
          label: l10n.audioAndVideoStreamingModeSectionTitle,
        ),
        for (final StreamingMode mode in StreamingMode.values)
          FluxerMenuRadioItem(
            label: streamingModeLabel(l10n, mode),
            hint: _modeHint(l10n, view, mode),
            isSelected: mode == view.mode,
            onPressed: () => unawaited(
              ref.read(voiceSettingsProvider.notifier).setStreamingMode(mode),
            ),
          ),
        if (view.mode == StreamingMode.custom) ...<Widget>[
          const FluxerMenuDivider(),
          VoiceStreamQualitySubmenu(
            label: l10n.voiceScreenShareResolution,
            builder: (BuildContext _) => VoiceStreamQualityItems(
              onClose: onClose,
              showFrameRate: false,
              showLabels: false,
            ),
          ),
          VoiceStreamQualitySubmenu(
            label: l10n.audioAndVideoFrameRateSectionTitle,
            builder: (BuildContext _) => VoiceStreamQualityItems(
              onClose: onClose,
              showResolution: false,
              showLabels: false,
            ),
          ),
        ],
        const FluxerMenuDivider(),
        FluxerMenuCheckboxItem(
          label: l10n.voiceScreenShareHidePreviewThumbnail,
          isChecked: hidePreview,
          onPressed: () => unawaited(
            ref
                .read(advancedPreferencesProvider.notifier)
                .setDisableStreamPreviews(value: !hidePreview),
          ),
        ),
        const FluxerMenuDivider(),
        FluxerMenuItem(
          label: l10n.voiceControlScreenShareSettings,
          icon: PhosphorIconsFill.gear,
          onPressed: () {
            onClose();
            onOpenSettings();
          },
        ),
      ],
    );
  }

  String _modeHint(
    FluxerLocalizations l10n,
    ScreenShareSettingsView view,
    StreamingMode mode,
  ) {
    final ScreenShareQuality? quality = view.presetQualities[mode];
    if (quality == null) {
      return l10n.audioAndVideoStreamingModeCustomDescription;
    }
    final String resolution = screenShareResolutionLabel(
      l10n,
      quality.resolution,
    );
    return mode == StreamingMode.gaming
        ? l10n.audioAndVideoStreamingModeGamingDescription(
            quality.frameRate,
            resolution,
          )
        : l10n.audioAndVideoStreamingModeScreenShareDescription(
            resolution,
            quality.frameRate,
          );
  }
}
