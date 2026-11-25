import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_panel_settings.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_control_button.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_device_menu.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_menu.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_more_options_menu.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/features/voice/providers/active_self_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_capability_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/connection/session_navigation.dart';
import 'package:fluxer_app/features/voice/utils/voice_diagnostics_report.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceDesktopControlBar extends ConsumerWidget {
  const VoiceDesktopControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final (bool isInVoice, bool isConnected) = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => (s.isInVoice, s.isConnected),
      ),
    );
    if (!isInVoice) {
      return const SizedBox.shrink();
    }
    final VoiceState? selfState = ref.watch(activeSelfVoiceStateProvider);
    final bool isMuted = selfState?.selfMute ?? false;
    final bool isDeafened = selfState?.selfDeaf ?? false;
    final bool isVideoOn = selfState?.selfVideo ?? false;
    final bool isScreenSharing = selfState?.selfStream ?? false;
    final bool canScreenShare = ref
        .watch(screenShareCapabilityProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    final VoiceSession session = ref.read(voiceSessionProvider.notifier);

    void openSettings() =>
        unawaited(openVoiceHudAudioVideoSettings(context, ref));

    void toggleScreenShare() => unawaited(
      session.toggleSelfStream(
        screenShareNotificationText: l10n.voiceScreenShareNotificationText,
      ),
    );

    void openMenu(BuildContext anchor, VoiceHudMenuBuilder builder) =>
        unawaited(showVoiceHudMenu(anchor, ref, builder: builder));

    void openDeviceMenu(BuildContext anchor, VoiceHudDeviceKind kind) {
      unawaited(ref.read(voiceMediaDevicesProvider.notifier).refresh());
      openMenu(
        anchor,
        (VoidCallback close) => VoiceHudDeviceMenu(
          kind: kind,
          onClose: close,
          onOpenSettings: openSettings,
        ),
      );
    }

    void openInputMenu(BuildContext anchor) =>
        openDeviceMenu(anchor, VoiceHudDeviceKind.input);
    void openOutputMenu(BuildContext anchor) =>
        openDeviceMenu(anchor, VoiceHudDeviceKind.output);
    void openCameraMenu(BuildContext anchor) =>
        openDeviceMenu(anchor, VoiceHudDeviceKind.camera);

    void openScreenShareMenu(BuildContext anchor) => openMenu(
      anchor,
      (VoidCallback close) => VoiceHudScreenShareMenu(
        onClose: close,
        onToggle: toggleScreenShare,
        onOpenSettings: openSettings,
      ),
    );

    void openMoreOptionsMenu(BuildContext anchor) => openMenu(
      anchor,
      (VoidCallback close) => VoiceHudMoreOptionsMenu(
        onClose: close,
        onSwitchToStandard: () =>
            unawaited(confirmSwitchToStandardVoiceCall(context, ref)),
        onCopyDiagnostics: () => unawaited(copyVoiceDiagnostics(context)),
        onOpenSettings: openSettings,
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: kVoiceHudSurface,
        borderRadius: BorderRadius.circular(kVoiceHudBarRadius),
        border: Border.all(color: kVoiceHudBarBorder),
        boxShadow: kVoiceHudBarShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kVoiceHudBarPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: kVoiceHudButtonGap,
          children: <Widget>[
            VoiceHudControlButton(
              icon: isMuted
                  ? PhosphorIconsFill.microphoneSlash
                  : PhosphorIconsFill.microphone,
              tone: isMuted ? VoiceHudTone.danger : VoiceHudTone.neutral,
              tooltip: isMuted
                  ? l10n.voiceControlUnmute
                  : l10n.voiceControlMute,
              semanticLabel: l10n.voiceControlMute,
              toggled: isMuted,
              onPressed: (_) => unawaited(session.toggleSelfMute()),
              onSecondaryPressed: openInputMenu,
              settingsTooltip: l10n.voiceControlInputSettings,
              onSettingsPressed: openInputMenu,
            ),
            VoiceHudControlButton(
              icon: isDeafened
                  ? PhosphorIconsFill.speakerSlash
                  : PhosphorIconsFill.speakerHigh,
              tone: isDeafened ? VoiceHudTone.danger : VoiceHudTone.neutral,
              tooltip: isDeafened
                  ? l10n.voiceControlUndeafen
                  : l10n.voiceControlDeafen,
              semanticLabel: l10n.voiceControlDeafen,
              toggled: isDeafened,
              onPressed: (_) => unawaited(session.toggleSelfDeafen()),
              onSecondaryPressed: openOutputMenu,
              settingsTooltip: l10n.voiceControlOutputSettings,
              onSettingsPressed: openOutputMenu,
            ),
            VoiceHudControlButton(
              icon: isVideoOn
                  ? PhosphorIconsFill.camera
                  : PhosphorIconsFill.cameraSlash,
              tone: isVideoOn ? VoiceHudTone.success : VoiceHudTone.neutral,
              tooltip: l10n.voiceControlVideo,
              toggled: isVideoOn,
              onPressed: isConnected
                  ? (_) => unawaited(session.toggleSelfVideo())
                  : null,
              onSecondaryPressed: isConnected ? openCameraMenu : null,
              settingsTooltip: l10n.voiceControlCameraSettings,
              onSettingsPressed: openCameraMenu,
            ),
            if (canScreenShare)
              VoiceHudControlButton(
                icon: PhosphorIconsFill.monitorPlay,
                tone: isScreenSharing
                    ? VoiceHudTone.success
                    : VoiceHudTone.neutral,
                tooltip: l10n.voiceControlScreenShare,
                toggled: isScreenSharing,
                onPressed: isConnected ? (_) => toggleScreenShare() : null,
                onSecondaryPressed: isConnected ? openScreenShareMenu : null,
                settingsTooltip: l10n.voiceControlScreenShareSettings,
                onSettingsPressed: isConnected ? openScreenShareMenu : null,
              ),
            VoiceHudControlButton(
              icon: PhosphorIconsBold.dotsThree,
              tone: VoiceHudTone.neutral,
              tooltip: l10n.voiceControlMoreOptions,
              onPressed: openMoreOptionsMenu,
            ),
            const VoiceHudSeparator(),
            VoiceHudControlButton(
              icon: PhosphorIconsFill.phoneX,
              tone: VoiceHudTone.disconnect,
              tooltip: l10n.voiceControlDisconnect,
              onPressed: (_) =>
                  unawaited(endPhoneVoiceCall(context: context, ref: ref)),
            ),
          ],
        ),
      ),
    );
  }
}
