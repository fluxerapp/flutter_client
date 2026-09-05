import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/shell_transition_page.dart';

void main() {
  test('guild chat page key is stable across channels in the same guild', () {
    expect(guildChatPageKey('guild-1'), guildChatPageKey('guild-1'));
    expect(guildChatPageKey('guild-1'), isNot(guildChatPageKey('guild-2')));
  });

  test('dm and favorites chat page keys are stable', () {
    expect(kDmChatPageKey, const ValueKey<String>('dm-chat'));
    expect(kFavoritesChatPageKey, const ValueKey<String>('favorites-chat'));
  });

  test('only the dm channel route uses the stable chat page key', () {
    const ValueKey<String> routeKey = ValueKey<String>('route');
    expect(
      dmShellPageKeyForRoute(
        routeName: RouteNames.dmChannel,
        routePageKey: routeKey,
      ),
      kDmChatPageKey,
    );
    expect(
      dmShellPageKeyForRoute(routeName: RouteNames.dms, routePageKey: routeKey),
      routeKey,
    );
    expect(
      dmShellPageKeyForRoute(
        routeName: RouteNames.dmMessage,
        routePageKey: routeKey,
      ),
      routeKey,
    );
  });
}
