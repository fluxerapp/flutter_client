import 'dart:async';

import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/push/push_tray_drain.dart';
import 'package:fluxer_app/core/push/push_tray_registry_provider.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_tray_background_listener_provider.g.dart';

/// Flushes read acks and reconciles the notification tray when the app backgrounds.
@Riverpod(keepAlive: true)
Raw<void> pushTrayBackgroundListener(Ref ref) {
  ref.listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
    if ((previous ?? false) && !next) {
      unawaited(_onAppBackgrounded(ref));
    }
  });
}

Future<void> _onAppBackgrounded(Ref ref) async {
  await ref.read(ackBatcherProvider).flushPending(force: true);
  await drainPushTrayRegistry(ref.read(pushTrayRegistryProvider));
}
