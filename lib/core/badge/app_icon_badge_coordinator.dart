import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_provider.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_service.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_icon_badge_coordinator.g.dart';

@Riverpod(keepAlive: true)
class AppIconBadgeCoordinator extends _$AppIconBadgeCoordinator {
  StreamSubscription<PushMessage>? _pushSub;

  @override
  void build() {
    ref
      ..listen(appIconBadgeProvider, (AppIconBadgeValue? previous, next) {
        if (previous?.count == next.count) {
          return;
        }
        unawaited(AppIconBadgeService.update(next.count));
      })
      ..listen<String?>(currentUserIdProvider, (
        String? previous,
        String? next,
      ) {
        if (previous != null && next != null && previous != next) {
          unawaited(AppIconBadgeService.clear());
        }
        if (next == null && previous != null) {
          unawaited(AppIconBadgeService.clear());
        }
      });
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      unawaited(AppIconBadgeService.clear());
    } else {
      final AppIconBadgeValue badge = ref.watch(appIconBadgeProvider);
      unawaited(AppIconBadgeService.update(badge.count));
    }
    if (!kIsWeb && Platform.isAndroid) {
      unawaited(_pushSub?.cancel());
      _pushSub = ref
          .read(pushServiceProvider)
          .watchMessages()
          .listen(_onPushMessage);
    }
    ref.onDispose(() {
      unawaited(_pushSub?.cancel());
      unawaited(AppIconBadgeService.clear());
    });
  }

  void _onPushMessage(PushMessage message) {
    if (!Platform.isAndroid) {
      return;
    }
    final bool gatewayReady = ref.read(gatewayReadyProvider);
    final bool isForeground = ref.read(appUiForegroundProvider);
    if (gatewayReady && isForeground) {
      return;
    }
    final int? badgeCount = parsePushBadgeCount(message.payload);
    if (badgeCount == null) {
      return;
    }
    unawaited(AppIconBadgeService.update(badgeCount));
  }
}
