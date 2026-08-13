import 'dart:async';

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
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_popout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

// ---------------------------------------------------------------------------
// Source media detection helpers (pure)
// ---------------------------------------------------------------------------

Message _message({
  String channelId = 'c1',
  List<Embed> embeds = const <Embed>[],
  List<Attachment> attachments = const <Attachment>[],
  List<MessageSnapshot> snapshots = const <MessageSnapshot>[],
}) {
  return Message(
    id: 'm1',
    channelId: channelId,
    authorId: 'a1',
    authorName: 'Author',
    content: 'hi',
    timestamp: DateTime(2020),
    embeds: embeds,
    attachments: attachments,
    messageSnapshots: snapshots,
  );
}

const Embed _embed = Embed(type: EmbedType.link);
const Attachment _attachment = Attachment(
  id: 'att1',
  filename: 'pic.png',
  url: 'https://cdn/pic.png',
);
MessageSnapshot _snapshot({
  List<Embed> embeds = const <Embed>[],
  List<Attachment> attachments = const <Attachment>[],
}) {
  return MessageSnapshot(
    timestamp: DateTime(2020),
    embeds: embeds,
    attachments: attachments,
  );
}

// ---------------------------------------------------------------------------
// Widget-test fixtures
// ---------------------------------------------------------------------------

const String _userId = 'user_1';
const String _guildId = 'guild_1';

/// Drives a dependency-triggered reload (not a refresh) of the overridden
/// destinations provider in the no-flicker regression test.
class _ReloadTrigger extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final NotifierProvider<_ReloadTrigger, int> _reloadTriggerProvider =
    NotifierProvider<_ReloadTrigger, int>(_ReloadTrigger.new);

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
  await channel('source-chan', 0);
  await channel('general', 0);
  await channel('voice-room', 2);
  return db;
}

const List<Channel> _seededChannels = <Channel>[
  Channel(id: 'source-chan', guildId: _guildId, name: 'source-chan'),
  Channel(id: 'general', guildId: _guildId, name: 'general'),
  Channel(
    id: 'voice-room',
    guildId: _guildId,
    name: 'voice-room',
    type: ChannelType.guildVoice,
  ),
];

Widget _app(
  FluxerDatabase db,
  Message message, {
  void Function(BuildContext context)? onOpen,
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
              onPressed: () => onOpen == null
                  ? showForwardMessageSheet(context, message: message)
                  : onOpen(context),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> _openSheet(WidgetTester tester, FluxerDatabase db) async {
  await tester.pumpWidget(_app(db, _message(channelId: 'source-chan')));
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
  group('messageHasForwardableEmbeds', () {
    test('is false for a plain message', () {
      expect(messageHasForwardableEmbeds(_message()), isFalse);
    });

    test('is true when the message carries embeds directly', () {
      expect(
        messageHasForwardableEmbeds(_message(embeds: const <Embed>[_embed])),
        isTrue,
      );
    });

    test('is true when only a forwarded snapshot carries embeds', () {
      expect(
        messageHasForwardableEmbeds(
          _message(
            snapshots: <MessageSnapshot>[
              _snapshot(embeds: const <Embed>[_embed]),
            ],
          ),
        ),
        isTrue,
      );
    });
  });

  group('messageHasForwardableAttachments', () {
    test('is false for a plain message', () {
      expect(messageHasForwardableAttachments(_message()), isFalse);
    });

    test('is true when the message carries attachments directly', () {
      expect(
        messageHasForwardableAttachments(
          _message(attachments: const <Attachment>[_attachment]),
        ),
        isTrue,
      );
    });

    test('is true when only a forwarded snapshot carries attachments', () {
      expect(
        messageHasForwardableAttachments(
          _message(
            snapshots: <MessageSnapshot>[
              _snapshot(attachments: const <Attachment>[_attachment]),
            ],
          ),
        ),
        isTrue,
      );
    });

    test('embeds and attachments are detected independently', () {
      final Message embedsOnly = _message(embeds: const <Embed>[_embed]);
      expect(messageHasForwardableEmbeds(embedsOnly), isTrue);
      expect(messageHasForwardableAttachments(embedsOnly), isFalse);
    });
  });

  group('showForwardMessageSheet', () {
    testWidgets('renders destinations and excludes the source channel', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      expect(find.text('general'), findsOneWidget);
      await _ensureDestinationVisible(tester, 'voice-room');
      expect(find.text('voice-room'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      // The source channel is never a forward destination.
      expect(find.text('source-chan'), findsNothing);
    });

    testWidgets('updates the send count as destinations are selected', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      expect(
        find.text(testL10n.forwardSendButton(0, kForwardSelectionLimit)),
        findsOneWidget,
      );

      await tester.tap(find.text('general'));
      await tester.pump();
      expect(
        find.text(testL10n.forwardSendButton(1, kForwardSelectionLimit)),
        findsOneWidget,
      );

      await tester.tap(find.text('Alice'));
      await tester.pump();
      expect(
        find.text(testL10n.forwardSendButton(2, kForwardSelectionLimit)),
        findsOneWidget,
      );

      // Tapping again deselects.
      await tester.tap(find.text('general'));
      await tester.pump();
      expect(
        find.text(testL10n.forwardSendButton(1, kForwardSelectionLimit)),
        findsOneWidget,
      );
    });

    testWidgets('filters the destination list by search query', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      await tester.enterText(find.byType(TextField).first, 'voice');
      await tester.pump();

      expect(find.text('voice-room'), findsOneWidget);
      expect(find.text('general'), findsNothing);
      expect(find.text('Alice'), findsNothing);
    });

    testWidgets('keeps the destination list visible while it reloads', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();

      const ForwardDestination general = ForwardDestination(
        channelId: 'general',
        displayName: 'general',
        kind: ForwardDestinationKind.guildText,
        guildId: _guildId,
        guildName: 'Owned',
      );
      final Completer<List<ForwardDestination>> reloadGate =
          Completer<List<ForwardDestination>>();
      Future<List<ForwardDestination>> Function() source = () =>
          Future<List<ForwardDestination>>.value(const <ForwardDestination>[
            general,
          ]);

      await tester.pumpWidget(
        _app(
          db,
          _message(channelId: 'source-chan'),
          extraOverrides: <Override>[
            forwardDestinationsProvider(
              sourceChannelId: 'source-chan',
              sourceHasEmbeds: false,
              sourceHasAttachments: false,
            ).overrideWith((ref) {
              ref.watch(_reloadTriggerProvider);
              return source();
            }),
          ],
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('general'), findsOneWidget);

      // A forward mutates channels/DMs that the provider watches, so it reloads
      // while the recompute is still pending. The retained list must stay
      // visible instead of flashing the loading spinner (web parity).
      source = () => reloadGate.future;
      ProviderScope.containerOf(
        tester.element(find.text('general')),
        listen: false,
      ).read(_reloadTriggerProvider.notifier).bump();
      await tester.pump();

      expect(find.byType(FluxerLoadingSpinner), findsNothing);
      expect(find.text('general'), findsOneWidget);

      reloadGate.complete(const <ForwardDestination>[general]);
      await tester.pumpAndSettle();
    });
  });

  group('showForwardMediaSheet & comment counter', () {
    testWidgets('showForwardMediaSheet opens the destination picker', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await tester.pumpWidget(
        _app(
          db,
          _message(channelId: 'source-chan'),
          onOpen: (BuildContext context) => showForwardMediaSheet(
            context,
            sourceChannelId: 'source-chan',
            sourceMessageId: 'm1',
            attachmentIds: const <String>['att1'],
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('general'), findsOneWidget);
      // The source channel is never a forward destination.
      expect(find.text('source-chan'), findsNothing);
    });

    testWidgets('surfaces the comment counter past the 80% threshold', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      // Below 80% of the 2000-char limit the counter stays hidden.
      expect(find.text('100'), findsNothing);

      await tester.enterText(find.byType(TextField).last, 'a' * 1900);
      await tester.pump();

      // 1900/2000 leaves 100 remaining, now surfaced by the counter.
      expect(find.text('100'), findsOneWidget);
    });
  });

  group('comment emoji picker', () {
    testWidgets('renders an inline emoji button, not a desktop popout', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      // Issue 2: the comment affordance is not the anchored desktop popout.
      expect(find.byType(FluxerEmojiPickerPopout), findsNothing);

      // Issue 1: the emoji button lives inside the comment input field.
      final Finder smiley = find.byWidgetPredicate(
        (Widget widget) =>
            widget is PhosphorIcon && widget.icon == PhosphorIconsFill.smiley,
      );
      expect(smiley, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(ComposerAutocompleteField),
          matching: smiley,
        ),
        findsOneWidget,
      );
    });
  });
}
