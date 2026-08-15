import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/user_panel_widgets.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/video_camera_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceConnectionLocalControls extends ConsumerWidget {
  const VoiceConnectionLocalControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final String? connectionId = voice.activeConnectionId;
    final VoiceState? selfVs = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    final bool isConnected = voice.isConnected;
    final bool isCameraOn = selfVs?.selfVideo ?? false;
    final bool isScreenSharing = selfVs?.selfStream ?? false;
    final bool canScreenShare = ref
        .watch(screenShareCapabilityProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    final bool hasCamera = ref
        .watch(videoCameraCapabilityProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    final bool canVideo = hasCamera && _canUseVideo(ref, voice.channelId);
    final bool canToggleCamera = isConnected && canVideo;

    final List<Widget> controls = <Widget>[];
    if (hasCamera) {
      controls.add(
        Expanded(
          child: UserPanelMediaButton(
            icon: PhosphorIcon(
              isCameraOn
                  ? PhosphorIconsFill.videoCamera
                  : PhosphorIconsFill.videoCameraSlash,
            ),
            isActive: isCameraOn,
            enabled: canToggleCamera,
            tooltip: l10n.voiceControlVideo,
            onPressed: canToggleCamera
                ? () {
                    unawaited(
                      ref.read(voiceSessionProvider.notifier).toggleSelfVideo(),
                    );
                  }
                : null,
          ),
        ),
      );
    }
    if (canScreenShare) {
      if (controls.isNotEmpty) {
        controls.add(SizedBox(width: context.layout.s1));
      }
      controls.add(
        Expanded(
          child: UserPanelMediaButton(
            icon: const PhosphorIcon(PhosphorIconsFill.monitorPlay),
            isActive: isScreenSharing,
            enabled: isConnected,
            tooltip: l10n.voiceControlScreenShare,
            onPressed: isConnected
                ? () {
                    unawaited(
                      ref
                          .read(voiceSessionProvider.notifier)
                          .toggleSelfStream(
                            screenShareNotificationText:
                                l10n.voiceScreenShareNotificationText,
                          ),
                    );
                  }
                : null,
          ),
        ),
      );
    }
    if (controls.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(top: context.layout.s3),
      child: Row(children: controls),
    );
  }

  bool _canUseVideo(WidgetRef ref, String? channelId) {
    if (channelId == null || channelId.isEmpty) {
      return true;
    }
    final int? permissionBits = ref
        .read(channelPermissionCacheProvider.notifier)
        .getChannelBits(channelId);
    if (permissionBits == null) {
      return true;
    }
    return hasPermission(permissionBits, Permission.stream);
  }
}
