import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/presentation/thread_sidebar_tile.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' show UserNotificationSettings;

import '../../../helpers/pump_fluxer_app.dart';

const Channel _thread = Channel(
  id: 't1',
  guildId: 'g1',
  name: 'thread',
  type: ChannelType.publicThread,
  parentId: 'c1',
);

class _Appearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();
}

Future<void> _pumpTile(WidgetTester tester, UnreadState unread) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(
    pumpFluxerApp(
      overrides: [
        activeChannelIdProvider.overrideWithValue(null),
        appearancePreferencesProvider.overrideWith(_Appearance.new),
        mutedChannelIdsProvider(
          'g1',
        ).overrideWithValue(const AsyncData<Set<String>>(<String>{})),
        channelUnreadProvider(
          't1',
        ).overrideWith((Ref ref) => Stream<UnreadState>.value(unread)),
        threadMembershipProvider('t1').overrideWith(
          (Ref ref) => Stream<ThreadMembership?>.value(
            const ThreadMembership(flags: 0, muted: false),
          ),
        ),
      ],
      child: const Scaffold(
        body: ThreadSidebarTile(thread: _thread, guildId: 'g1', isLast: true),
      ),
    ),
  );
  await pumpFluxerFramesQuick(tester);
}

void main() {
  testWidgets('a thread in a muted community still shows its mentions', (
    tester,
  ) async {
    await _pumpTile(
      tester,
      const UnreadState(
        hasUnread: true,
        mentionCount: 1,
        unreadBadgesLevel: UserNotificationSettings.noMessages,
      ),
    );

    expect(find.byType(FluxerBadge), findsOneWidget);
  });
}
