import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
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
    return FluxerButton.circle(
      icon: PhosphorIconsFill.cameraRotate,
      variant: FluxerButtonVariant.secondary,
      size: FluxerButtonSize.small,
      iconSize: 20,
      semanticLabel: l10n.voiceControlFlipCamera,
      onPressed: () {
        unawaited(ref.read(voiceSessionProvider.notifier).flipCamera());
      },
    );
  }
}
