import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_cached_video_track.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_system_pip_providers.dart';
import 'package:fluxer_app/features/voice/utils/media/voice_pip_video_source.dart';
import 'package:fluxer_app/features/voice/utils/media/voice_video_claims.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/pip/voice_video_surface_registry.dart';
import 'package:fluxer_voice/fluxer_voice.dart';
import 'package:livekit_client/livekit_client.dart';

const Duration kVoiceSystemPipSyncDebounce = Duration(milliseconds: 250);
const Duration kVoiceSystemPipTargetLossGrace = Duration(seconds: 1);

final voiceSystemPipCoordinatorProvider = Provider<VoiceSystemPipCoordinator>((
  Ref ref,
) {
  final VoiceSystemPipCoordinator coordinator = VoiceSystemPipCoordinator(ref);
  ref.onDispose(coordinator.dispose);
  return coordinator;
});

class VoiceSystemPipCoordinator with WidgetsBindingObserver {
  VoiceSystemPipCoordinator(this._ref) {
    if (isFluxerNativeMobileOs) {
      _start();
    }
  }

  final Ref _ref;
  final FluxerVoicePip _pip = FluxerVoicePip.instance;
  bool _started = false;
  bool _supported = false;
  bool _disposed = false;
  bool _foreground = true;
  bool _pipActive = false;
  Size? _pipSize;
  VoiceSystemPipTarget? _target;
  String? _trackKey;
  VoiceMediaParticipant? _observed;
  VoiceVideoClaim? _claim;
  VoiceSystemPipTarget? _claimTarget;
  Timer? _debounce;
  Timer? _lossTimer;
  StreamSubscription<VoicePipEvent>? _events;
  AppLifecycleListener? _lifecycle;

  void _start() {
    _started = true;
    _ref
      ..listen<VoiceSystemPipTarget?>(
        voiceSystemPipTargetProvider,
        (_, VoiceSystemPipTarget? next) => _setTarget(next),
        fireImmediately: true,
      )
      ..listen<bool>(appUiForegroundProvider, (_, bool next) {
        _foreground = next;
        _sync();
      }, fireImmediately: true)
      ..listen<Offset?>(voicePipPlacementProvider, (_, _) => _scheduleSync())
      ..listen<VoicePipOverlayPhase>(
        voicePipOverlayPhaseProvider,
        (_, _) => _scheduleSync(),
      );
    WidgetsBinding.instance.addObserver(this);
    _lifecycle = AppLifecycleListener(onInactive: _sync);
    VoiceVideoSurfaceRegistry.instance.addListener(_onSurfaceChanged);
    _events = _pip.events.listen(_onEvent, onError: (Object _) {});
    unawaited(
      _pip.isSupported().then((bool supported) {
        _supported = supported;
        _sync();
      }),
    );
  }

  @override
  void didChangeMetrics() => _scheduleSync();

  void reportPipSize(Size size) {
    if (!_pipActive || size.isEmpty || size == _pipSize) {
      return;
    }
    _pipSize = size;
    _scheduleSync();
  }

  void _setTarget(VoiceSystemPipTarget? next) {
    if (next == _target) {
      return;
    }
    _target = next;
    if (!identical(_observed, next?.participant)) {
      _observed?.removeListener(_scheduleSync);
      _observed = next?.participant;
      _observed?.addListener(_scheduleSync);
    }
    _sync();
  }

  void _onSurfaceChanged(String key) {
    if (key == _trackKey) {
      _scheduleSync();
    }
  }

  void _onEvent(VoicePipEvent event) {
    _pipActive = event.active;
    _pipSize = event.active ? event.size ?? _pipSize : null;
    _ref.read(voiceSystemPipActiveProvider.notifier).set(active: event.active);
    _sync();
  }

  void _scheduleSync() {
    if (_disposed ||
        _debounce != null ||
        _target == null && _pip.armed == null) {
      return;
    }
    _debounce = Timer(kVoiceSystemPipSyncDebounce, _sync);
  }

  void _sync() {
    _debounce?.cancel();
    _debounce = null;
    if (_disposed || !_started) {
      return;
    }
    final VideoTrack? track = _target?.track;
    _trackKey = track == null ? null : voiceVideoTrackCacheKey(track);
    _applyBackgroundFocus();
    _syncClaim();
    _syncTargetLoss(hasTrack: track != null);
    final VoicePipRequest? request = _supported && track != null
        ? _buildRequest(_target!, track)
        : null;
    if (request == null) {
      unawaited(_pip.disarm().catchError((Object _) {}));
      return;
    }
    unawaited(_pip.arm(request).catchError((Object _) {}));
  }

  VideoQuality? get _pipQuality {
    final VoiceSystemPipTarget? target = _target;
    if (!_pipActive || target == null) {
      return null;
    }
    return voiceSystemPipQuality(
      isScreenShare: target.isScreenShare,
      pipSize: _pipSize,
    );
  }

  void _applyBackgroundFocus() {
    VoiceVideoClaims.setBackgroundFocus(
      backgrounded: !_foreground || _pipActive,
      participant: _target?.participant,
      source: _target?.trackSource,
      quality: _pipQuality,
    );
  }

  void _syncClaim() {
    final VoiceSystemPipTarget? target = _target;
    final VideoQuality? quality = _pipQuality;
    if (target == null || quality == null) {
      _releaseClaim();
      return;
    }
    final VoiceVideoClaim? claim = _claim;
    if (claim != null && target == _claimTarget) {
      claim.update(quality);
      return;
    }
    _releaseClaim();
    _claimTarget = target;
    _claim = VoiceVideoClaims.of(
      target.participant,
    ).claim(target.trackSource, quality: quality);
  }

  void _releaseClaim() {
    _claim?.release();
    _claim = null;
    _claimTarget = null;
  }

  void _syncTargetLoss({required bool hasTrack}) {
    if (!_pipActive || hasTrack) {
      _lossTimer?.cancel();
      _lossTimer = null;
      return;
    }
    _lossTimer ??= Timer(kVoiceSystemPipTargetLossGrace, () {
      _lossTimer = null;
      if (!_disposed && _pipActive && _target?.track == null) {
        unawaited(_pip.stop().catchError((Object _) {}));
      }
    });
  }

  VoicePipRequest? _buildRequest(
    VoiceSystemPipTarget target,
    VideoTrack track,
  ) {
    final VoicePipVideoSource? source = voicePipVideoSourceFor(track);
    if (source == null) {
      return null;
    }
    final VoicePipRequest? armed = _pip.armed;
    if (_pipActive && armed != null && armed.source == source) {
      return armed;
    }
    final VoiceVideoSurfaceInfo? surface = VoiceVideoSurfaceRegistry.instance
        .lookup(_trackKey!);
    final Rect? rect = surface?.rect;
    return VoicePipRequest(
      source: source,
      aspect: surface?.videoSize ?? _fallbackAspect(target),
      sourceRect: rect == null
          ? null
          : Rect.fromLTRB(
              rect.left.roundToDouble(),
              rect.top.roundToDouble(),
              rect.right.roundToDouble(),
              rect.bottom.roundToDouble(),
            ),
    );
  }

  Size _fallbackAspect(VoiceSystemPipTarget target) {
    final VideoDimensions? dimensions = target.isScreenShare
        ? target.participant.screenShareDimensions
        : null;
    if (dimensions != null && dimensions.width > 0 && dimensions.height > 0) {
      return Size(dimensions.width.toDouble(), dimensions.height.toDouble());
    }
    return const Size(16, 9);
  }

  void dispose() {
    _disposed = true;
    _debounce?.cancel();
    _lossTimer?.cancel();
    if (!_started) {
      return;
    }
    WidgetsBinding.instance.removeObserver(this);
    _lifecycle?.dispose();
    unawaited(_events?.cancel());
    _observed?.removeListener(_scheduleSync);
    _observed = null;
    VoiceVideoSurfaceRegistry.instance.removeListener(_onSurfaceChanged);
    _releaseClaim();
    VoiceVideoClaims.setBackgroundFocus(backgrounded: false);
    unawaited(_pip.disarm().catchError((Object _) {}));
  }
}
