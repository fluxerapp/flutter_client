import 'package:flutter/material.dart';
import 'package:fluxer_app/core/observability/fluxer_route_trace_observer.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/router/channel_persistence_observer.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/pre_reconnecting_location_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/router/shell_popup_route_observer.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/login_screen.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:fluxer_app/features/chat/presentation/channel_layout.dart';
import 'package:fluxer_app/features/discovery/presentation/discovery_desktop_shell.dart';
import 'package:fluxer_app/features/discovery/presentation/discovery_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/dm/presentation/dm_layout.dart';
import 'package:fluxer_app/features/favorites/presentation/favorites_layout.dart';
import 'package:fluxer_app/features/guilds/presentation/pages/invite_accept_page.dart';
import 'package:fluxer_app/features/notifications/presentation/notifications_page.dart';
import 'package:fluxer_app/features/profile/presentation/profile_page.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/pages/guild/guild_settings_nav_page.dart';
import 'package:fluxer_app/features/settings/presentation/pages/guild/settings_audit_log_page.dart';
import 'package:fluxer_app/features/settings/presentation/pages/guild/settings_bans_page.dart';
import 'package:fluxer_app/features/settings/presentation/pages/guild/settings_moderation_page.dart';
import 'package:fluxer_app/features/settings/presentation/pages/guild/settings_overview_page.dart';
import 'package:fluxer_app/features/shell/presentation/app_layout.dart';
import 'package:fluxer_app/core/router/shell_transition_page.dart';
import 'package:fluxer_app/features/shell/presentation/reconnecting_screen.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/navigation/shell_transition_policy.dart';
import 'package:fluxer_app/features/shell/presentation/splash_screen.dart';
import 'package:fluxer_app/features/shell/presentation/stub_screen.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fluxer_app/features/voice/presentation/dm_voice_call_fullscreen_page.dart'
    deferred as dm_voice_call;
import 'package:fluxer_app/features/settings/presentation/guild_settings_modal.dart'
    deferred as guild_settings;

export 'package:fluxer_app/core/router/shell_navigator_keys.dart';

part 'fluxer_router.g.dart';

int _guildSettingsTabIndex(String? tab) {
  return switch (tab) {
    'overview' => 0,
    'roles' => 1,
    'emoji' => 2,
    'stickers' => 3,
    'moderation' => 4,
    'audit-log' => 5,
    'webhooks' => 6,
    'discovery' => 7,
    'members' => 8,
    'invites' => 9,
    'bans' => 10,
    _ => 0,
  };
}

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  bool build() => false;

  // Auth transitions are imperative events from startup/login/logout flows.
  // ignore: use_setters_to_change_properties
  void setAuthenticated({required bool value}) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class CurrentUserId extends _$CurrentUserId {
  @override
  String? build() => null;

  // The active user id is assigned once a session is restored.
  // ignore: use_setters_to_change_properties
  void set(String id) {
    state = id;
  }
}

@Riverpod(keepAlive: true)
class CurrentUserPremiumType extends _$CurrentUserPremiumType {
  @override
  int build() => 0;

  // Premium type mirrors the current user profile payload.
  // ignore: use_setters_to_change_properties
  void set(int type) {
    state = type;
  }
}

@Riverpod(keepAlive: true)
class ServerReachable extends _$ServerReachable {
  @override
  bool build() => true;

  // Gateway reachability is driven by connection lifecycle events.
  // ignore: use_setters_to_change_properties
  void setReachable({required bool value}) {
    state = value;
  }
}

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
    ..listen(
      gatewayConnectionFailedProvider,
      (_, _) => refreshNotifier.notify(),
    )
    ..listen(gatewayReadyProvider, (_, _) => refreshNotifier.notify())
    ..listen(appStartupProvider, (_, _) => refreshNotifier.notify())
    ..listen(accountManagerProvider, (_, _) => refreshNotifier.notify())
    ..listen(
      addAccountInstanceGuardProvider,
      (_, _) => refreshNotifier.notify(),
    );

  void setShellPopupOverlay({required bool hasOverlay}) {
    ref
        .read(shellHasPopupOverlayProvider.notifier)
        .setHasOverlay(value: hasOverlay);
  }

  ShellPopupRouteObserver createShellPopupRouteObserver() {
    return ShellPopupRouteObserver(setShellPopupOverlay);
  }

  final rootShellPopupRouteObserver = createShellPopupRouteObserver();
  final homeShellPopupRouteObserver = createShellPopupRouteObserver();
  final notificationsShellPopupRouteObserver = createShellPopupRouteObserver();
  final youShellPopupRouteObserver = createShellPopupRouteObserver();
  final routeTraceObserver = FluxerRouteTraceObserver();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: refreshNotifier,
    observers: [
      ChannelPersistenceObserver(db),
      rootShellPopupRouteObserver,
      routeTraceObserver,
    ],
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isOnLoading = location == '/loading';

      final isAuthenticated = ref.read(authStateProvider);
      final isConnectionFailed = ref.read(gatewayConnectionFailedProvider);
      final isGatewayReady = ref.read(gatewayReadyProvider);
      final isStartupComplete = ref.read(appStartupProvider) is AsyncData;
      final isAccountSwitching = ref.read(accountManagerProvider).isSwitching;
      final bool isAddingAccount =
          ref.read(addAccountInstanceGuardProvider) != null;

      if (isAccountSwitching) {
        return isOnLoading ? null : '/loading';
      }

      // Still starting up — stay on splash.
      if (!isStartupComplete) {
        return isOnLoading ? null : '/loading';
      }

      final isLoggingIn = location == '/login';
      final isOnReconnecting = location == '/reconnecting';

      if (isAuthenticated && isConnectionFailed && !isOnReconnecting) {
        ref
            .read(preReconnectingLocationProvider.notifier)
            .remember(path: state.uri.path, query: state.uri.query);
        return '/reconnecting';
      }

      // Authenticated but gateway hasn't delivered READY yet — stay on splash.
      if (isAuthenticated &&
          !isGatewayReady &&
          !isOnReconnecting &&
          !isAddingAccount) {
        return isOnLoading ? null : '/loading';
      }

      if (isOnLoading) {
        if (!isAuthenticated) {
          return '/login';
        }
        return RoutePaths.me;
      }

      if (!isAuthenticated) {
        ref.read(preReconnectingLocationProvider.notifier).clear();
      }
      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }
      if (isAuthenticated && !isConnectionFailed && isLoggingIn) {
        return RoutePaths.me;
      }
      if (isAuthenticated &&
          !isConnectionFailed &&
          isOnReconnecting &&
          isGatewayReady) {
        return ref
            .read(preReconnectingLocationProvider.notifier)
            .takeOrDefault();
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
        pageBuilder: (context, state) {
          final String code = state.pathParameters['code'] ?? '';
          return shellFadeTransitionPage(
            key: state.pageKey,
            child: InviteAcceptPage(code: code),
          );
        },
      ),
      GoRoute(
        path: '/gift/:code',
        name: RouteNames.gift,
        // TODO(M0n7y5): show gift modal.
        redirect: (context, state) => RoutePaths.me,
      ),
      GoRoute(
        path: '/theme/:themeId',
        name: RouteNames.themePreview,
        // TODO(M0n7y5): show theme preview.
        redirect: (context, state) => RoutePaths.me,
      ),

      // Guild settings (pushed on root navigator)
      GoRoute(
        path: '/settings/guild/:guildId',
        name: RouteNames.guildSettings,
        parentNavigatorKey: rootNavigatorKey,
        redirect: (BuildContext context, GoRouterState state) {
          final String? tab = state.uri.queryParameters['tab'];
          if (tab == null || tab.isEmpty || !isMobileLayout(context)) {
            return null;
          }
          final String guildId = state.pathParameters['guildId'] ?? '';
          return guildSettingsTabPathFromQuery(guildId, tab);
        },
        pageBuilder: (BuildContext context, GoRouterState state) {
          final String guildId = state.pathParameters['guildId'] ?? '';
          if (isMobileLayout(context)) {
            return shellMobileRootPushTransitionPage(
              context: context,
              key: state.pageKey,
              child: GuildSettingsNavPage(guildId: guildId),
            );
          }
          return shellFadeTransitionPage(
            key: state.pageKey,
            child: FutureBuilder<void>(
              future: guild_settings.loadLibrary(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Scaffold(
                    body: Center(child: FluxerLoadingSpinner()),
                  );
                }
                return guild_settings.GuildSettingsModal(
                  guildId: guildId,
                  initialTab: guildSettingsTabFromIndex(
                    _guildSettingsTabIndex(state.uri.queryParameters['tab']),
                  ),
                );
              },
            ),
          );
        },
      ),

      // Guild settings tab pages (full-screen on mobile, slide-over on desktop)
      GoRoute(
        path: '/settings/guild/:guildId/overview',
        name: RouteNames.guildSettingsOverview,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => shellMobileRootPushTransitionPage(
          context: context,
          key: state.pageKey,
          child: SettingsOverviewPage(
            guildId: state.pathParameters['guildId'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/settings/guild/:guildId/moderation',
        name: RouteNames.guildSettingsModeration,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => shellMobileRootPushTransitionPage(
          context: context,
          key: state.pageKey,
          child: SettingsModerationPage(
            guildId: state.pathParameters['guildId'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/settings/guild/:guildId/audit-log',
        name: RouteNames.guildSettingsAuditLog,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => shellMobileRootPushTransitionPage(
          context: context,
          key: state.pageKey,
          child: SettingsAuditLogPage(
            guildId: state.pathParameters['guildId'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/settings/guild/:guildId/bans',
        name: RouteNames.guildSettingsBans,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => shellMobileRootPushTransitionPage(
          context: context,
          key: state.pageKey,
          child: SettingsBansPage(
            guildId: state.pathParameters['guildId'] ?? '',
          ),
        ),
      ),

      // Discover (root navigator — slide on mobile, inline shell on desktop)
      GoRoute(
        path: '/channels/@discover',
        name: RouteNames.discover,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) {
          if (isMobileLayout(context)) {
            return shellMobileRootPushPage(
              context: context,
              key: state.pageKey,
              child: const DiscoveryLayout(),
            );
          }
          return shellFadeTransitionPage(
            key: state.pageKey,
            child: const DiscoveryDesktopShell(),
          );
        },
      ),

      // Main app shell
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) =>
            shellFadeTransitionPage(
              key: state.pageKey,
              child: AppLayout(navigationShell: navigationShell),
              duration: ShellTransitionPolicy.shellEntryDuration,
            ),
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            navigatorKey: homeBranchNavigatorKey,
            observers: [homeShellPopupRouteObserver],
            routes: [
              // /channels/@me
              GoRoute(
                path: '/channels/@me',
                name: RouteNames.dms,
                pageBuilder: (context, state) => shellFadeTransitionPage(
                  key: state.pageKey,
                  child: const DMLayout(),
                ),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    name: RouteNames.dmChannel,
                    pageBuilder: (context, state) => shellSlideTransitionPage(
                      key: state.pageKey,
                      parallaxOutgoing: true,
                      child: DMLayout(
                        channelId: state.pathParameters['channelId'],
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'call',
                        name: RouteNames.dmChannelCall,
                        parentNavigatorKey: rootNavigatorKey,
                        pageBuilder: (context, state) =>
                            shellMobileRootPushTransitionPage(
                              context: context,
                              key: state.pageKey,
                              child: FutureBuilder<void>(
                                future: dm_voice_call.loadLibrary(),
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<void> snapshot,
                                    ) {
                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return const Scaffold(
                                          body: Center(
                                            child: FluxerLoadingSpinner(),
                                          ),
                                        );
                                      }
                                      return dm_voice_call.DmVoiceCallFullscreenPage(
                                        channelId:
                                            state.pathParameters['channelId'] ??
                                            '',
                                      );
                                    },
                              ),
                            ),
                      ),
                      GoRoute(
                        path: ':messageId',
                        name: RouteNames.dmMessage,
                        pageBuilder: (context, state) =>
                            shellSlideTransitionPage(
                              key: state.pageKey,
                              parallaxOutgoing: true,
                              child: DMLayout(
                                channelId: state.pathParameters['channelId'],
                                targetMessageId:
                                    state.pathParameters['messageId'],
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
                redirect: (context, state) async {
                  if (state.uri.path != RoutePaths.favoritesBase) {
                    return null;
                  }
                  if (isMobileLayout(context)) {
                    return null;
                  }
                  final db = ref.read(fluxerDatabaseProvider);
                  final channels = await db.favoriteChannelsDao
                      .watchChannels()
                      .first;
                  if (channels.isEmpty) {
                    return null;
                  }
                  final settings = await db.favoriteChannelsDao.getSettings();
                  final hideMuted = settings.hideMuted;
                  for (final favorite in channels) {
                    if (!hideMuted || favorite.guildId == null) {
                      return RoutePaths.favoritesChannel(favorite.channelId);
                    }
                  }
                  return RoutePaths.favoritesChannel(channels.first.channelId);
                },
                pageBuilder: (context, state) => shellFadeTransitionPage(
                  key: state.pageKey,
                  child: const FavoritesLayout(),
                ),
                routes: [
                  GoRoute(
                    path: ':channelId',
                    name: RouteNames.favoritesChannel,
                    pageBuilder: (context, state) => shellSlideTransitionPage(
                      key: state.pageKey,
                      parallaxOutgoing: true,
                      child: FavoritesLayout(
                        channelId: state.pathParameters['channelId'],
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: ':messageId',
                        name: RouteNames.favoritesMessage,
                        pageBuilder: (context, state) =>
                            shellSlideTransitionPage(
                              key: state.pageKey,
                              parallaxOutgoing: true,
                              child: FavoritesLayout(
                                channelId: state.pathParameters['channelId'],
                                messageId: state.pathParameters['messageId'],
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              // /channels/:guildId
              GoRoute(
                path: '/channels/:guildId',
                name: RouteNames.guild,
                redirect: (context, state) {
                  return resolveGuildRootRedirect(
                    guildId: state.pathParameters['guildId'],
                    fullPath: state.uri.path,
                    isMobile: isMobileLayout(context),
                    db: ref.read(fluxerDatabaseProvider),
                  );
                },
                pageBuilder: (context, state) => shellFadeTransitionPage(
                  key: state.pageKey,
                  child: Scaffold(
                    backgroundColor: context.colors.backgroundPrimary,
                    body: Center(
                      child: ChatLoadingSpinner(
                        reason: ChatSpinnerReason.panelNotReady,
                        color: context.colors.brandPrimary,
                      ),
                    ),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'members',
                    name: RouteNames.guildMembers,
                    pageBuilder: (context, state) => shellSlideTransitionPage(
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
                      return shellSlideTransitionPage(
                        key: state.pageKey,
                        parallaxOutgoing: true,
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
                          return shellSlideTransitionPage(
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
                pageBuilder: (context, state) => shellFadeTransitionPage(
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
                pageBuilder: (context, state) => shellFadeTransitionPage(
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
            navigatorKey: notificationsBranchNavigatorKey,
            observers: [notificationsShellPopupRouteObserver],
            routes: [
              GoRoute(
                path: '/notifications',
                name: RouteNames.notifications,
                pageBuilder: (context, state) => shellFadeTransitionPage(
                  key: state.pageKey,
                  child: const NotificationsPage(),
                ),
              ),
            ],
          ),

          // Branch 2: You
          StatefulShellBranch(
            navigatorKey: youBranchNavigatorKey,
            observers: [youShellPopupRouteObserver],
            routes: [
              GoRoute(
                path: '/you',
                name: RouteNames.you,
                pageBuilder: (context, state) => shellFadeTransitionPage(
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
