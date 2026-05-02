import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/deep_links/deep_link_handler.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStartup extends _$AppStartup {
  @override
  Future<void> build() async {
    try {
      debugPrint('[AppStartup] Starting…');
      await _validateAndRestore();
      debugPrint('[AppStartup] Completed');
    } on Exception catch (e, st) {
      debugPrint('[AppStartup] Unhandled error during startup: $e\n$st');
      rethrow;
    }
  }

  Future<void> retry() async {
    await _validateAndRestore();
  }

  Future<void> _validateAndRestore() async {
    await Future.wait<void>([
      EmojiRegistry.preload(),
      ref.read(appRuntimeInfoProvider.future),
    ]);
    unawaited(EmojiSpriteSheet.preload());
    final database = ref.read(fluxerDatabaseProvider);
    debugPrint('[AppStartup] Database obtained, querying session…');

    var session = await database.authSessionDao.getActiveSession();
    debugPrint('[AppStartup] Session: ${session != null ? 'found' : 'none'}');

    if (session == null) {
      return;
    }

    // Validate the session and try fallback sessions on 401.
    while (session != null) {
      ref.read(fluxerAuthTokenProvider.notifier).setToken(session.token);

      try {
        final client = ref.read(fluxerClientProvider);
        final user = await client.users.getCurrentUser();

        // Cache user data for account selector.
        await database.authSessionDao.updateUserData(
          userId: session.userId,
          username: user.username,
          discriminator: user.discriminator,
          avatar: user.avatar,
        );
        ref
            .read(currentUserPremiumTypeProvider.notifier)
            .set(user.premiumType?.json ?? 0);
        break; // Session is valid.
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          debugPrint(
            '[AppStartup] Session invalid for ${session.userId}, '
            'trying next…',
          );
          await database.authSessionDao.markInvalid(session.userId);
          session = await database.authSessionDao.getActiveSession();
          continue;
        }
        // Other errors — server unreachable, proceed authenticated.
        debugPrint('[AppStartup] Server unreachable: $e');
        break;
      }
    }

    if (session == null) {
      ref.read(fluxerAuthTokenProvider.notifier).setToken(null);
      return;
    }

    ref.read(authStateProvider.notifier).setAuthenticated(value: true);
    ref.read(currentUserIdProvider.notifier).set(session.userId);
    await ref.read(themePreferenceProvider.notifier).load(session.userId);
    await ref.read(appearancePreferencesProvider.notifier).load(session.userId);
    await ref.read(chatPreferencesProvider.notifier).load(session.userId);

    ref
      ..read(gatewayConnectBindingProvider)
      ..read(gatewayEventListenerProvider)
      ..read(gatewayStateListenerProvider)
      ..read(connectivityListenerProvider);

    ref.read(deepLinkHandlerProvider.notifier).processPendingDeepLink();

    debugPrint(
      '[AppStartup] Session restored '
      'for user ${session.userId}',
    );
  }
}
