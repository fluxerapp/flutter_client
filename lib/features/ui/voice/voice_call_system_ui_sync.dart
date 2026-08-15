import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:material_ui/material_ui.dart';

/// Hides the system status bar in phone landscape when call overlays are hidden.
class VoiceCallSystemUiSync extends ConsumerStatefulWidget {
  const VoiceCallSystemUiSync({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<VoiceCallSystemUiSync> createState() =>
      _VoiceCallSystemUiSyncState();
}

class _VoiceCallSystemUiSyncState extends ConsumerState<VoiceCallSystemUiSync> {
  bool _statusBarHidden = false;

  @override
  void dispose() {
    _restoreStatusBar();
    super.dispose();
  }

  void _restoreStatusBar() {
    if (!_statusBarHidden) {
      return;
    }
    _statusBarHidden = false;
    unawaited(
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      ),
    );
  }

  void _sync({required bool hideStatusBar}) {
    if (hideStatusBar == _statusBarHidden) {
      return;
    }
    _statusBarHidden = hideStatusBar;
    if (hideStatusBar) {
      unawaited(
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: const <SystemUiOverlay>[SystemUiOverlay.bottom],
        ),
      );
    } else {
      unawaited(
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isInVoice = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.isInVoice),
    );
    final bool showsOverlay = ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    );
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final bool hideStatusBar = isInVoice && isLandscape && !showsOverlay;

    if (hideStatusBar != _statusBarHidden) {
      final bool next = hideStatusBar;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        _sync(hideStatusBar: next);
      });
    }

    return widget.child;
  }
}
