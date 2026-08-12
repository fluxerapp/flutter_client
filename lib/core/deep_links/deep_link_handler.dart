import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/core/deep_links/user_settings_deep_link.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/auth/providers/pending_invite_code_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';
import 'package:fluxer_app/features/settings/utils/open_user_settings_deep_link.dart';
import 'package:fluxer_app/features/settings/providers/default_apps_preferences_provider.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deep_link_handler.g.dart';

@Riverpod(keepAlive: true)
class DeepLinkHandler extends _$DeepLinkHandler {
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _subscription;
  Uri? _pendingDeepLink;

  @override
  void build() {
    _appLinks = AppLinks();

    _subscription = _appLinks.uriLinkStream.listen(
      _handleDeepLink,
      onError: (Object error) {
        talker.error('[DeepLink] Error receiving deep link: $error');
      },
    );

    ref.onDispose(() => _subscription?.cancel());

    unawaited(_checkInitialLink());
  }

  Future<void> _checkInitialLink() async {
    try {
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(initialLink);
      }
    } on Exception catch (e) {
      talker.error('[DeepLink] Error getting initial link: $e');
    }
  }

  void _handleDeepLink(Uri uri) {
    final Uri normalizedUri = normalizeIncomingDeepLinkUri(uri);
    talker.info('[DeepLink] Received: $uri');

    if (_tryDeferOAuthDeepLinkToBrowser(uri)) {
      return;
    }

    // Password reset links work without authentication.
    if (_tryHandleResetLink(normalizedUri)) {
      return;
    }

    if (!isAllowedDeepLinkPath(normalizedUri)) {
      talker.info(
        '[DeepLink] Ignored non-routable path: ${normalizedUri.path}',
      );
      return;
    }

    final isAuthenticated = ref.read(authStateProvider);
    if (!isAuthenticated) {
      _pendingDeepLink = normalizedUri;
      _extractInviteCode(normalizedUri);
      talker.info('[DeepLink] Queued for after auth');
      return;
    }

    _processDeepLink(normalizedUri);
  }

  bool _tryDeferOAuthDeepLinkToBrowser(Uri uri) {
    final String instanceWebAppBase = ref.read(instanceWebAppBaseUrlProvider);
    if (!isFluxerOAuthDeepLinkUri(
      uri,
      instanceWebAppBase: instanceWebAppBase,
    )) {
      return false;
    }
    talker.info('[DeepLink] Deferring OAuth URL to browser: $uri');
    final browser = ref.read(defaultAppsPreferencesProvider);
    unawaited(openExternalUrl(uri, browser: browser));
    return true;
  }

  void _extractInviteCode(Uri uri) {
    final String? code = parseInviteCode(uri.toString());
    if (code != null) {
      ref.read(pendingInviteCodeProvider.notifier).store(code);
      talker.info('[DeepLink] Stored invite code for auth flow');
      return;
    }
    if (uri.pathSegments.length >= 2 && uri.pathSegments.first == 'invite') {
      final String codeFromPath = uri.pathSegments[1];
      ref.read(pendingInviteCodeProvider.notifier).store(codeFromPath);
      talker.info('[DeepLink] Stored invite code for auth flow');
    }
  }

  /// Handles `/reset#token=<TOKEN>` or `/reset?token=<TOKEN>` deep links.
  bool _tryHandleResetLink(Uri uri) {
    if (uri.pathSegments.firstOrNull != 'reset') {
      return false;
    }

    // Token can be in query params or fragment (web app uses hash: #token=xxx).
    var token = uri.queryParameters['token'];
    if (token == null && uri.fragment.isNotEmpty) {
      final fragmentParams = Uri.splitQueryString(uri.fragment);
      token = fragmentParams['token'];
    }

    if (token == null || token.isEmpty) {
      talker.warning('[DeepLink] Reset link missing token');
      return false;
    }

    talker.info('[DeepLink] Password reset token received');
    ref.read(loginViewModelProvider.notifier).setResetToken(token);

    // Navigate to login screen if not already there.
    ref.read(fluxerRouterProvider).go('/login');

    return true;
  }

  void processPendingDeepLink() {
    final pending = _pendingDeepLink;
    _pendingDeepLink = null;
    if (pending != null) {
      _processDeepLink(pending);
    }
  }

  /// Routes an in-app path (e.g. from a push notification tap).
  void handlePath(String path) {
    if (path.isEmpty || !path.startsWith('/')) {
      return;
    }
    final Uri uri = Uri(path: path);
    talker.info('[DeepLink] Push path: $path');
    _handleDeepLink(uri);
  }

  void _processDeepLink(Uri uri) {
    final bool ready = isPendingNavigationReady(
      isAuthenticated: ref.read(authStateProvider),
      isGatewayReady: ref.read(gatewayReadyProvider),
      isConnectionFailed: ref.read(gatewayConnectionFailedProvider),
    );
    if (!ready) {
      final String path = uri.hasQuery ? '${uri.path}?${uri.query}' : uri.path;
      ref.read(pendingPushNotificationPathProvider.notifier).store(path);
      return;
    }
    final router = ref.read(fluxerRouterProvider);
    final segments = uri.pathSegments;

    if (segments.isEmpty) {
      return;
    }

    switch (segments.first) {
      case 'invite' when segments.length >= 2:
        router.go(RoutePaths.inviteLink(segments[1]));
      case 'gift' when segments.length >= 2:
        router.go(RoutePaths.giftLink(segments[1]));
      case 'users' when segments.length >= 2:
        talker.info('[DeepLink] User profile: ${segments[1]}');
      case 'settings' when segments.length >= 2 && segments[1] == 'user':
        _handleUserSettingsDeepLink(uri);
      case 'notifications' when segments.length == 1:
        router.go(RoutePaths.notificationsPath);
      case 'you' when segments.length == 1:
        router.go(RoutePaths.youPath);
      case 'channels':
        _handleChannelDeepLink(router, segments);
      default:
        talker.warning('[DeepLink] Unknown deep link path: ${uri.path}');
    }
  }

  void _handleUserSettingsDeepLink(Uri uri) {
    final UserSettingsDeepLinkTarget? target = parseUserSettingsDeepLink(uri);
    if (target == null) {
      return;
    }
    final BuildContext? context = rootNavigatorKey.currentContext;
    if (context == null || !context.mounted) {
      talker.warning(
        '[DeepLink] Cannot open user settings: no navigator context',
      );
      return;
    }
    talker.info(
      '[DeepLink] Opening user settings'
      '${target.section == null ? '' : ' (${target.section!.name})'}',
    );
    unawaited(openUserSettingsDeepLinkFromContext(context, target));
  }

  void _handleChannelDeepLink(GoRouter router, List<String> segments) {
    if (segments.length >= 2 && segments[1] == '@me') {
      if (segments.length >= 4) {
        unawaited(
          navigateToChannelJumpLinkVia(
            ref: ref,
            link: MessageJumpLink(
              scope: '@me',
              channelId: segments[2],
              messageId: segments[3],
            ),
          ),
        );
        return;
      }
      if (segments.length >= 3) {
        unawaited(
          navigateToChannelJumpLinkVia(
            ref: ref,
            link: ChannelJumpLink(scope: '@me', channelId: segments[2]),
          ),
        );
        return;
      }
      return;
    }
    final ChannelJumpLink? link = channelJumpLinkFromPathSegments(segments);
    if (link != null) {
      unawaited(navigateToChannelJumpLinkVia(ref: ref, link: link));
      return;
    }
    if (segments.length >= 2) {
      router.go(RoutePaths.guild(segments[1]));
    }
  }
}
