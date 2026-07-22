import 'dart:async';
import 'dart:io';

import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/share/shared_media_payload.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_share_provider.g.dart';

bool isPendingShareReady({
  required bool isAuthenticated,
  required bool isGatewayReady,
  required bool isConnectionFailed,
}) {
  return isAuthenticated && isGatewayReady && !isConnectionFailed;
}

/// Queues media from the OS share sheet until the app is ready to present it.
@Riverpod(keepAlive: true)
class PendingShare extends _$PendingShare {
  StreamSubscription<List<SharedMediaFile>>? _mediaSubscription;

  @override
  SharedMediaPayload? build() {
    if (!Platform.isIOS && !Platform.isAndroid) {
      return null;
    }

    unawaited(_listenToMedia());

    ref
      ..listen<bool>(gatewayReadyProvider, (_, bool next) {
        if (next) {
          flushIfReady();
        }
      })
      ..listen<bool>(authStateProvider, (_, bool next) {
        if (next) {
          flushIfReady();
        }
      })
      ..listen<bool>(gatewayConnectionFailedProvider, (_, bool next) {
        if (!next) {
          flushIfReady();
        }
      })
      ..listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
        if (next > 0 && previous != next) {
          flushIfReady();
        }
      });
    return null;
  }

  Future<void> _listenToMedia() async {
    await _mediaSubscription?.cancel();

    unawaited(
      ReceiveSharingIntent.instance.getInitialMedia().then(_handleMedia),
    );

    _mediaSubscription = ReceiveSharingIntent.instance.getMediaStream().listen(
      _handleMedia,
      onError: (Object error) {
        talker.warning('[PendingShare] Media stream error: $error');
      },
    );

    ref.onDispose(() {
      unawaited(_mediaSubscription?.cancel() ?? Future<void>.value());
      _mediaSubscription = null;
    });
  }

  void _handleMedia(List<SharedMediaFile> files) {
    if (files.isEmpty) {
      return;
    }
    store(SharedMediaPayload(files: files, message: files.first.message));
  }

  void store(SharedMediaPayload payload) {
    if (!payload.hasContent) {
      talker.info('[PendingShare] Ignored shared payload with no content');
      return;
    }
    state = payload;
    talker.info(
      '[PendingShare] Queued share with ${payload.files.length} item(s)',
    );
    flushIfReady();
  }

  void clear() {
    state = null;
    unawaited(ReceiveSharingIntent.instance.reset());
  }

  void flushIfReady() {
    final SharedMediaPayload? pending = state;
    if (pending == null) {
      return;
    }
    if (!isPendingShareReady(
      isAuthenticated: ref.read(authStateProvider),
      isGatewayReady: ref.read(gatewayReadyProvider),
      isConnectionFailed: ref.read(gatewayConnectionFailedProvider),
    )) {
      return;
    }
    talker.info('[PendingShare] Ready to present share sheet');
  }
}
