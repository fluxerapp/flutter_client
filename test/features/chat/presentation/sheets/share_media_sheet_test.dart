import 'package:cross_file/cross_file.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/share_media_sheet.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _userId = 'user_1';
const String _guildId = 'guild_1';

UserSettingsViewState _userSettings() => const UserSettingsViewState(
  userId: _userId,
  username: 'user',
  displayName: 'user',
  discriminator: '0001',
  avatar: null,
  avatarColor: null,
  memberSince: null,
  status: 'online',
  messageDisplayCompact: false,
  developerMode: false,
  trustedDomains: <String>[],
);

class _FakeGuilds extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: <Guild>[Guild(id: _guildId, name: 'Owned', ownerId: _userId)],
  );
}

class _FakeUser extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => _userSettings();
}

class _FakeDms extends DmViewModel {
  @override
  DmViewState build() => DmViewState(
    conversations: <DmConversation>[
      DmConversation(
        id: 'dm_alice',
        type: 1,
        recipientId: 'recip_alice',
        recipientName: 'Alice',
        lastMessage: '',
        lastMessageTime: DateTime(2020),
      ),
    ],
    friendsList: const <Friend>[],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FakeToast extends Toast {
  @override
  List<ToastEntry> build() => const <ToastEntry>[];
}

class _FakeSlowmodeTracker extends SlowmodeTracker {
  @override
  Map<String, int> build() => const <String, int>{};
}

Future<FluxerDatabase> _seedDb() async {
  final FluxerDatabase db = openTestDatabase();
  Future<void> channel(String id, int type) => db.channelDao.upsertChannel(
    ChannelsCompanion.insert(
      id: id,
      guildId: _guildId,
      name: id,
      type: Value(type),
    ),
  );
  await channel('general', 0);
  await channel('voice-room', 2);
  return db;
}

const List<Channel> _seededChannels = <Channel>[
  Channel(id: 'general', guildId: _guildId, name: 'general'),
  Channel(
    id: 'voice-room',
    guildId: _guildId,
    name: 'voice-room',
    type: ChannelType.guildVoice,
  ),
];

Widget _app(
  FluxerDatabase db, {
  required List<XFile> files,
  String? initialMessage,
  List<Override> extraOverrides = const <Override>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(db),
      allGuildEmojisForPickerProvider.overrideWith(
        (ref) => Stream<List<GuildEmojiEntry>>.value(const []),
      ),
      allChannelsProvider.overrideWith(
        (ref) => Stream<List<Channel>>.value(_seededChannels),
      ),
      guildListViewModelProvider.overrideWith(_FakeGuilds.new),
      userSettingsViewModelProvider.overrideWith(_FakeUser.new),
      dmViewModelProvider.overrideWith(_FakeDms.new),
      maxMessageLengthProvider.overrideWithValue(2000),
      premiumMaxMessageLengthProvider.overrideWithValue(4000),
      toastProvider.overrideWith(_FakeToast.new),
      slowmodeTrackerProvider.overrideWith(_FakeSlowmodeTracker.new),
      ...extraOverrides,
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) => Center(
            child: ElevatedButton(
              onPressed: () => showShareMediaSheet(
                context,
                files: files,
                initialMessage: initialMessage,
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> _openSheet(
  WidgetTester tester,
  FluxerDatabase db, {
  List<XFile> files = const <XFile>[],
  String? initialMessage,
}) async {
  final List<XFile> resolvedFiles = files.isEmpty
      ? <XFile>[XFile('/tmp/photo.jpg')]
      : files;
  await tester.pumpWidget(
    _app(db, files: resolvedFiles, initialMessage: initialMessage),
  );
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

Future<void> _ensureDestinationVisible(
  WidgetTester tester,
  String destinationName,
) async {
  final Finder destination = find.text(destinationName);
  if (destination.evaluate().isNotEmpty) {
    return;
  }
  final Finder listView = find.byType(ListView);
  for (int attempt = 0; attempt < 8; attempt++) {
    if (destination.evaluate().isNotEmpty) {
      return;
    }
    if (listView.evaluate().isEmpty) {
      break;
    }
    await tester.drag(listView, const Offset(0, -200));
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

void main() {
  group('showShareMediaSheet', () {
    testWidgets('renders the share sheet title and destinations', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      expect(find.text(testL10n.shareMediaTitle), findsOneWidget);
      expect(find.text('general'), findsOneWidget);
      await _ensureDestinationVisible(tester, 'voice-room');
      expect(find.text('voice-room'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
    });

    testWidgets('send button is disabled until a destination is selected', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      final Finder sendButton = find.widgetWithText(
        FluxerButton,
        testL10n.shareMediaSendButton,
      );
      expect(tester.widget<FluxerButton>(sendButton).onPressedAsync, isNull);

      await tester.tap(find.text('general'));
      await tester.pump();

      expect(tester.widget<FluxerButton>(sendButton).onPressedAsync, isNotNull);
    });

    testWidgets('filters destinations by search query', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      await tester.enterText(find.byType(TextField).first, 'gen');
      await tester.pump();

      expect(find.text('general'), findsOneWidget);
      expect(find.text('voice-room'), findsNothing);
      expect(find.text('Alice'), findsNothing);
    });

    testWidgets('pre-fills shared text in the message field', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db, initialMessage: 'Hello from Safari');

      expect(find.text('Hello from Safari'), findsOneWidget);
    });
  });
}
