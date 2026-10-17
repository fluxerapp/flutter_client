import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_leave_path.dart';

void main() {
  group('shellChatLeavePath', () {
    test('guild channel returns guild root from route', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          channelByIdProvider(
            'channel-1',
          ).overrideWith((ref) => Stream<Channel?>.value(null)),
        ],
      );
      addTearDown(container.dispose);
      expect(
        shellChatLeavePath(
          container,
          RoutePaths.guildChannel('guild-1', 'channel-1'),
        ),
        RoutePaths.guild('guild-1'),
      );
    });

    test('dm channel returns me from route', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      expect(
        shellChatLeavePath(container, RoutePaths.dmChannel('dm-1')),
        RoutePaths.me,
      );
    });

    test('favorites channel returns favorites root', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      expect(
        shellChatLeavePath(container, RoutePaths.favoritesChannel('fav-1')),
        RoutePaths.favoritesBase,
      );
    });
  });
}
