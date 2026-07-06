import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FlipCameraButton extends ConsumerWidget {
  const FlipCameraButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileVoiceCameraPlatform()) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final (bool isConnected, String? connectionId) = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => (s.isConnected, s.activeConnectionId),
      ),
    );
    if (!isConnected || connectionId == null) {
      return const SizedBox.shrink();
    }
    final VoiceState? selfVs = ref.watch(
      voiceStateForConnectionProvider(connectionId),
    );
    final bool isVideoOn = selfVs?.selfVideo ?? false;
    if (!isVideoOn) {
      return const SizedBox.shrink();
    }
    return Semantics(
      button: true,
      label: l10n.voiceControlFlipCamera,
      child: Tooltip(
        message: l10n.voiceControlFlipCamera,
        child: GestureDetector(
          onTap: () {
            unawaited(ref.read(voiceSessionProvider.notifier).flipCamera());
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: context.colors.backgroundFloating.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(20),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: PhosphorIcon(
                PhosphorIconsFill.cameraRotate,
                size: 20,
                color: context.colors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
