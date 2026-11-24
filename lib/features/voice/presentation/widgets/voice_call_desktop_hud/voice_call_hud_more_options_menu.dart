import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_panel_settings.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_hud_menu.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_display_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/noise_suppression_labels.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceCallHudMoreOptionsMenu extends ConsumerWidget {
  const VoiceCallHudMoreOptionsMenu({
    required this.onClose,
    required this.onSwitchToStandard,
    required this.onCopyDiagnostics,
    required this.onOpenSettings,
    super.key,
  });

  final VoidCallback onClose;
  final VoidCallback onSwitchToStandard;
  final VoidCallback onCopyDiagnostics;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceCallDisplayPreferencesState display = ref.watch(
      voiceCallDisplayPreferencesProvider,
    );
    final VoiceCallDisplayPreferences displayNotifier = ref.read(
      voiceCallDisplayPreferencesProvider.notifier,
    );
    final VoiceCallLayoutMode mode = ref.watch(
      voiceCallLayoutProvider.select((VoiceCallLayoutState s) => s.mode),
    );
    final VoiceCallLayout layoutNotifier = ref.read(
      voiceCallLayoutProvider.notifier,
    );
    final NoiseSuppressionBackend selectedBackend =
        watchVoicePanelNoiseSuppression(ref);
    final bool showSwitchToStandard = watchCanSwitchToStandardVoiceCall(
      ref,
      channelId: ref.watch(
        voiceSessionProvider.select((VoiceSessionState s) => s.channelId),
      ),
    );

    void selectNoiseBackend(NoiseSuppressionBackend value) {
      unawaited(setVoicePanelNoiseSuppression(ref, value));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FluxerMenuSectionHeader(label: l10n.voiceCallViewModeLabel),
        FluxerMenuRadioItem(
          label: l10n.voiceCallViewModeGrid,
          isSelected: mode == VoiceCallLayoutMode.grid,
          onPressed: () => layoutNotifier.setMode(VoiceCallLayoutMode.grid),
        ),
        FluxerMenuRadioItem(
          label: l10n.voiceCallViewModeFocus,
          isSelected: mode == VoiceCallLayoutMode.focus,
          onPressed: () => layoutNotifier.setMode(VoiceCallLayoutMode.focus),
        ),
        const FluxerMenuDivider(),
        FluxerMenuCheckboxItem(
          label: l10n.voicePanelOnlyShowVideosLabel,
          isChecked: display.onlyShowVideos,
          onPressed: () =>
              displayNotifier.setOnlyShowVideos(value: !display.onlyShowVideos),
        ),
        FluxerMenuCheckboxItem(
          label: l10n.voicePanelShowOwnCameraLabel,
          isChecked: display.showOwnCamera,
          onPressed: () =>
              displayNotifier.setShowOwnCamera(value: !display.showOwnCamera),
        ),
        FluxerMenuCheckboxItem(
          label: l10n.voicePrioritizeSpeakersLabel,
          isChecked: settings.prioritizeSpeakingParticipants,
          onPressed: () => unawaited(
            ref
                .read(voiceSettingsProvider.notifier)
                .setPrioritizeSpeakingParticipants(
                  value: !settings.prioritizeSpeakingParticipants,
                ),
          ),
        ),
        const FluxerMenuDivider(),
        FluxerMenuSectionHeader(
          label: l10n.audioAndVideoNoiseSuppressionSectionTitle,
        ),
        for (final NoiseSuppressionBackend backend
            in NoiseSuppressionBackend.values)
          FluxerMenuRadioItem(
            label: noiseSuppressionBackendLabel(l10n, backend),
            isSelected: selectedBackend == backend,
            onPressed: () => selectNoiseBackend(backend),
          ),
        const FluxerMenuDivider(),
        if (showSwitchToStandard)
          FluxerMenuItem(
            label: l10n.voiceP2pSwitchToStandard,
            icon: PhosphorIconsFill.shareNetwork,
            onPressed: () {
              onClose();
              onSwitchToStandard();
            },
          ),
        FluxerMenuItem(
          label: l10n.voiceDiagnosticsCopy,
          icon: PhosphorIconsFill.chartLine,
          onPressed: () {
            onClose();
            onCopyDiagnostics();
          },
        ),
        VoiceCallHudMenuSettingsItem(
          onClose: onClose,
          onOpenSettings: onOpenSettings,
        ),
      ],
    );
  }
}
