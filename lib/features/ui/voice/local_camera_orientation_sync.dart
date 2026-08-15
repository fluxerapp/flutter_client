import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:material_ui/material_ui.dart';

/// Restarts the local camera track after device orientation changes.
class LocalCameraOrientationSync extends ConsumerStatefulWidget {
  const LocalCameraOrientationSync({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<LocalCameraOrientationSync> createState() =>
      _LocalCameraOrientationSyncState();
}

class _LocalCameraOrientationSyncState
    extends ConsumerState<LocalCameraOrientationSync> {
  Orientation? _lastOrientation;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    if (_lastOrientation != null && _lastOrientation != orientation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          unawaited(
            ref
                .read(voiceSessionProvider.notifier)
                .refreshLocalCameraAfterOrientationChange(),
          );
        }
      });
    }
    _lastOrientation = orientation;
    return widget.child;
  }
}
