import 'dart:async';
import 'dart:io';

import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_provider.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_service.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/notification/foreground_policy.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_icon_badge_coordinator.g.dart';

@Riverpod(keepAlive: true)
class AppIconBadgeCoordinator extends _$AppIconBadgeCoordinator {
  StreamSubscription<PushMessage>? _pushSub;

  @override
  void build() {
    ref
      ..listen<AppIconBadgeValue?>(appIconBadgeProvider, (
        AppIconBadgeValue? previous,
        AppIconBadgeValue? next,
      ) {
        if (next == null || previous?.count == next.count) {
          return;
        }
        _apply(next.count);
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
    if (Platform.isWindows) {
      ref.listen<FluxerLocalizations>(appLocalizationsProvider, (_, _) {
        if (ref.read(appIconBadgeProvider) case final AppIconBadgeValue badge) {
          _apply(badge.count);
        }
      });
    }
    if (ref.read(currentUserIdProvider) == null) {
      unawaited(AppIconBadgeService.clear());
    } else if (ref.read(appIconBadgeProvider)
        case final AppIconBadgeValue badge) {
      _apply(badge.count);
    }
    if (Platform.isAndroid) {
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
    if (gatewayReady &&
        !ForegroundPushNotificationPolicy.shouldProcessAlertPush(
          isAppForeground: isForeground,
        )) {
      return;
    }
    final int? badgeCount = parsePushBadgeCount(message.payload);
    if (badgeCount == null) {
      return;
    }
    _apply(badgeCount);
  }

  void _apply(int count) {
    unawaited(
      AppIconBadgeService.update(
        count,
        description: Platform.isWindows && count > 0
            ? ref
                  .read(appLocalizationsProvider)
                  .desktopBadgeUnreadMessages(count)
            : null,
      ),
    );
  }
}
