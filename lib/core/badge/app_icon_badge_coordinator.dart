import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/badge/app_icon_badge.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_provider.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_service.dart';
import 'package:fluxer_app/core/badge/push_badge_count_parser.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/push_provider.dart';
import 'package:fluxer_app/core/push/notification/foreground_policy.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/providers/preferences/desktop_behavior_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/notification_preferences_provider.dart';
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
        if (next == null ||
            (previous?.count == next.count &&
                previous?.hasUnread == next.hasUnread)) {
          return;
        }
        _applyValue(next);
      })
      ..listen<bool>(
        notificationPreferencesProvider.select(
          (NotificationPreferencesState state) =>
              state.unreadMessageBadgeEnabled,
        ),
        (_, _) => _reapply(),
      )
      ..listen<(bool, bool)>(
        desktopBehaviorPreferencesProvider.select(
          (DesktopBehaviorPreferencesState state) =>
              (state.darkTaskbarBadge, state.unreadLauncherBadge),
        ),
        (_, _) => _reapply(),
      )
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
      ref.listen<FluxerLocalizations>(
        appLocalizationsProvider,
        (_, _) => _reapply(),
      );
    }
    if (ref.read(currentUserIdProvider) == null) {
      unawaited(AppIconBadgeService.clear());
    } else if (ref.read(appIconBadgeProvider)
        case final AppIconBadgeValue badge) {
      _applyValue(badge);
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

  void _reapply() {
    if (ref.read(appIconBadgeProvider) case final AppIconBadgeValue badge) {
      _applyValue(badge);
    }
  }

  void _applyValue(AppIconBadgeValue value) {
    final bool showDot =
        isFluxerDesktopOs &&
        value.count <= 0 &&
        value.hasUnread &&
        ref.read(notificationPreferencesProvider).unreadMessageBadgeEnabled;
    _apply(showDot ? kAppIconBadgeUnreadDot : value.count);
  }

  void _apply(int count) {
    final DesktopBehaviorPreferencesState desktopPrefs = ref.read(
      desktopBehaviorPreferencesProvider,
    );
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    String? description;
    if (Platform.isWindows) {
      if (count > 0) {
        description = l10n.desktopBadgeUnreadMessages(count);
      } else if (count == kAppIconBadgeUnreadDot) {
        description = l10n.desktopBadgeUnreadMessagesNoCount;
      }
    }
    unawaited(
      AppIconBadgeService.update(
        count,
        description: description,
        dark: desktopPrefs.darkTaskbarBadge,
        linuxUnreadAsCount: desktopPrefs.unreadLauncherBadge,
      ),
    );
  }
}
