import 'package:flutter/material.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/channel_persistence_observer.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/login_screen.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/channel_layout.dart';
import 'package:fluxer_app/features/dm/presentation/dm_layout.dart';
import 'package:fluxer_app/features/notifications/presentation/notifications_page.dart';
import 'package:fluxer_app/features/profile/presentation/profile_page.dart';
import 'package:fluxer_app/features/settings/presentation/guild_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/app_layout.dart';
import 'package:fluxer_app/features/shell/presentation/reconnecting_screen.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/splash_screen.dart';
import 'package:fluxer_app/features/shell/presentation/stub_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fluxer_router.g.dart';

CustomTransitionPage<void> _fadeTransitionPage({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(milliseconds: 150),
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

CustomTransitionPage<void> _slideTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

int _guildSettingsTabIndex(String? tab) {
  return switch (tab) {
    'overview' => 0,
    'roles' => 1,
    'emoji' => 3,
    'stickers' => 4,
    'members' => 6,
    'channels' => 7,
    'bans' => 8,
    _ => 0,
  };
}

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  bool build() => false;

  void setAuthenticated({required bool value}) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class CurrentUserId extends _$CurrentUserId {
  @override
  String? build() => null;

  void set(String id) {
    state = id;
  }
}

@Riverpod(keepAlive: true)
class CurrentUserPremiumType extends _$CurrentUserPremiumType {
  @override
  int build() => 0;

  void set(int type) {
    state = type;
  }

  bool get isPremium => state > 0;
}

@Riverpod(keepAlive: true)
class ServerReachable extends _$ServerReachable {
  @override
  bool build() => true;

  void setReachable({required bool value}) {
    state = value;
  }
}

/// Whether the gateway READY event has been fully processed.
///
/// Starts as `false` and is set to `true` after the READY handler commits
/// all initial data to the database. The router gates navigation to the
/// main UI on this provider so the user never sees empty screens.
@Riverpod(keepAlive: true)
class GatewayReady extends _$GatewayReady {
  @override
  bool build() => false;

  void setReady() {
    state = true;
  }

  void reset() {
    state = false;
  }
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeBranchKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _notificationsBranchKey = GlobalKey<NavigatorState>(
  debugLabel: 'notifications',
);
final _youBranchKey = GlobalKey<NavigatorState>(debugLabel: 'you');

class _RouterRefreshNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

@Riverpod(keepAlive: true)
GoRouter fluxerRouter(Ref ref) {
  final refreshNotifier = _RouterRefreshNotifier();
  final db = ref.read(fluxerDatabaseProvider);

  ref
    ..listen(authStateProvider, (_, _) => refreshNotifier.notify())
    ..listen(serverReachableProvider, (_, _) => refreshNotifier.notify())
    ..listen(gatewayReadyProvider, (_, _) => refreshNotifier.notify())
    ..listen(appStartupProvider, (_, _) => refreshNotifier.notify());

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: refreshNotifier,
    observers: [ChannelPersistenceObserver(db)],
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isOnLoading = location == '/loading';

      final isAuthenticated = ref.read(authStateProvider);
      final isReachable = ref.read(serverReachableProvider);
      final isGatewayReady = ref.read(gatewayReadyProvider);
      final isStartupComplete = ref.read(appStartupProvider) is AsyncData;

      // Still starting up — stay on splash.
      if (!isStartupComplete) {
        return isOnLoading ? null : '/loading';
      }

      // Authenticated but gateway hasn't delivered READY yet — stay on splash.
      if (isAuthenticated && !isGatewayReady) {
        return isOnLoading ? null : '/loading';
      }

      if (isOnLoading) {
        if (!isAuthenticated) {
          return '/login';
        }
        if (!isReachable) {
          return '/reconnecting';
        }
        return RoutePaths.me;
      }

      final isLoggingIn = location == '/login';
      final isOnReconnecting = location == '/reconnecting';

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }
      if (isAuthenticated && !isReachable && !isOnReconnecting) {
        return '/reconnecting';
      }
      if (isAuthenticated && isReachable && (isLoggingIn || isOnReconnecting)) {
        return RoutePaths.me;
      }

      return null;
    },
    routes: [
      // Auth / startup routes
      GoRoute(
        path: '/loading',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/reconnecting',
        name: RouteNames.reconnecting,
        builder: (context, state) => const ReconnectingScreen(),
      ),

      // Deep link routes
      GoRoute(
        path: '/invite/:code',
        name: RouteNames.invite,
        redirect: (context, state) => RoutePaths.me, // TODO: show invite modal
      ),
      GoRoute(
        path: '/gift/:code',
        name: RouteNames.gift,
        redirect: (context, state) => RoutePaths.me, // TODO: show gift modal
      ),
      GoRoute(
        path: '/theme/:themeId',
        name: RouteNames.themePreview,
        redirect: (context, state) => RoutePaths.me, // TODO: show theme preview
      ),

      // Guild settings (pushed on root navigator)
      GoRoute(
        path: '/settings/guild/:guildId',
        name: RouteNames.guildSettings,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => GuildSettingsModal(
          guildId: state.pathParameters['guildId'] ?? '',
          initialTab: _guildSettingsTabIndex(state.uri.queryParameters['tab']),
        ),
      ),

      // Main app shell
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => _fadeTransitionPage(
          key: state.pageKey,
          child: AppLayout(navigationShell: navigationShell),
          duration: const Duration(milliseconds: 550),
        ),
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            navigatorKey: _homeBranchKey,
            routes: [
              // /channels/@me
              GoRoute(
                path: '/channels/@me',
                name: RouteNames.dms,
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: const DMLayout(),
                ),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    name: RouteNames.dmChannel,
                    pageBuilder: (context, state) => _slideTransitionPage(
                      key: state.pageKey,
                      child: DMLayout(
                        channelId: state.pathParameters['channelId'],
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: ':messageId',
                        name: RouteNames.dmMessage,
                        pageBuilder: (context, state) => _slideTransitionPage(
                          key: state.pageKey,
                          child: DMLayout(
                            channelId: state.pathParameters['channelId'],
                            targetMessageId: state.pathParameters['messageId'],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // /channels/@favorites
              GoRoute(
                path: '/channels/@favorites',
                name: RouteNames.favorites,
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: const StubScreen(
                    title: 'Favorites',
                    icon: PhosphorIconsFill.star,
                  ),
                ),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    name: RouteNames.favoritesChannel,
                    pageBuilder: (context, state) => _slideTransitionPage(
                      key: state.pageKey,
                      child: const StubScreen(
                        title: 'Favorites',
                        icon: PhosphorIconsFill.star,
                      ),
                    ),
                  ),
                ],
              ),
              // /channels/:guildId
              GoRoute(
                path: '/channels/:guildId',
                name: RouteNames.guild,
                redirect: (context, state) async {
                  final guildId = state.pathParameters['guildId'];
                  if (guildId == null) {
                    return RoutePaths.me;
                  }
                  // Already on a child route -/don't redirect.
                  final fullPath = state.uri.path;
                  if (RegExp('^/channels/[^/]+/.+').hasMatch(fullPath)) {
                    return null;
                  }
                  // On mobile, show the channel sidebar instead of
                  // auto-selecting a channel.
                  if (isMobileLayout(context)) {
                    return null;
                  }
                  final db = ref.read(fluxerDatabaseProvider);
                  final lastChannelId = await db.guildLastChannelDao
                      .getLastChannel(guildId);
                  if (lastChannelId != null) {
                    return RoutePaths.guildChannel(guildId, lastChannelId);
                  }
                  final channelState = ref.read(channelListViewModelProvider);
                  final firstChannel = channelState.categories
                      .expand((c) => c.channels)
                      .firstOrNull;
                  if (firstChannel != null) {
                    return RoutePaths.guildChannel(guildId, firstChannel.id);
                  }
                  return null;
                },
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: Scaffold(
                    backgroundColor: context.colors.backgroundPrimary,
                    body: const Center(child: Text('Select a channel')),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'members',
                    name: RouteNames.guildMembers,
                    pageBuilder: (context, state) => _slideTransitionPage(
                      key: state.pageKey,
                      child: const StubScreen(
                        title: 'Members',
                        icon: PhosphorIconsFill.users,
                      ),
                    ),
                  ),
                  GoRoute(
                    path: ':channelId',
                    name: RouteNames.channel,
                    pageBuilder: (context, state) {
                      final guildId = state.pathParameters['guildId']!;
                      final channelId = state.pathParameters['channelId']!;
                      return _slideTransitionPage(
                        key: state.pageKey,
                        child: ChannelLayout(
                          guildId: guildId,
                          channelId: channelId,
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: ':messageId',
                        name: RouteNames.message,
                        pageBuilder: (context, state) {
                          final guildId = state.pathParameters['guildId']!;
                          final channelId = state.pathParameters['channelId']!;
                          final messageId = state.pathParameters['messageId']!;
                          return _slideTransitionPage(
                            key: state.pageKey,
                            child: ChannelLayout(
                              guildId: guildId,
                              channelId: channelId,
                              messageId: messageId,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              // /bookmarks
              GoRoute(
                path: '/bookmarks',
                name: RouteNames.bookmarks,
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: const StubScreen(
                    title: 'Bookmarks',
                    icon: PhosphorIconsFill.bookmarkSimple,
                  ),
                ),
              ),
              // /mentions
              GoRoute(
                path: '/mentions',
                name: RouteNames.mentions,
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: const StubScreen(
                    title: 'Mentions',
                    icon: PhosphorIconsFill.at,
                  ),
                ),
              ),
            ],
          ),

          // Branch 1: Notifications
          StatefulShellBranch(
            navigatorKey: _notificationsBranchKey,
            routes: [
              GoRoute(
                path: '/notifications',
                name: RouteNames.notifications,
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: const NotificationsPage(),
                ),
              ),
            ],
          ),

          // Branch 2: You
          StatefulShellBranch(
            navigatorKey: _youBranchKey,
            routes: [
              GoRoute(
                path: '/you',
                name: RouteNames.you,
                pageBuilder: (context, state) => _fadeTransitionPage(
                  key: state.pageKey,
                  child: const ProfilePage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
