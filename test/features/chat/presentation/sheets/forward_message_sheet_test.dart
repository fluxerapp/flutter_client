// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_popout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

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

const String _userId = 'user_1';
const String _guildId = 'guild_1';

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
  _FakeGuilds(this._guilds);

  final List<Guild> _guilds;

  @override
  GuildListViewState build() => GuildListViewState(guilds: _guilds);
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
  List<Channel>? allChannels,
  List<Guild>? guilds,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(db),
      allGuildEmojisForPickerProvider.overrideWith(
        (ref) => Stream<List<GuildEmojiEntry>>.value(const []),
      ),
      allChannelsProvider.overrideWith(
        (ref) => Stream<List<Channel>>.value(allChannels ?? _seededChannels),
      ),
      guildListViewModelProvider.overrideWith(
        () => _FakeGuilds(
          guilds ??
              const <Guild>[
                Guild(id: _guildId, name: 'Owned', ownerId: _userId),
              ],
        ),
      ),
      userSettingsViewModelProvider.overrideWith(_FakeUser.new),
      dmViewModelProvider.overrideWith(_FakeDms.new),
      maxMessageLengthProvider.overrideWithValue(2000),
      premiumMaxMessageLengthProvider.overrideWithValue(4000),
      ...extraOverrides,
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
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

  group('shouldNavigateAfterForward', () {
    test('is true for a single destination', () {
      expect(shouldNavigateAfterForward(1), isTrue);
    });

    test('is false for no destinations or multiple destinations', () {
      expect(shouldNavigateAfterForward(0), isFalse);
      expect(shouldNavigateAfterForward(2), isFalse);
    });
  });

  group('forwardCommentComposerChannelId', () {
    test('is null when nothing is selected', () {
      expect(forwardCommentComposerChannelId(const <String>{}), isNull);
    });

    test('returns the most recently selected destination', () {
      expect(forwardCommentComposerChannelId(<String>['src', 'dest']), 'dest');
      expect(forwardCommentComposerChannelId(<String>['dest']), 'dest');
    });
  });

  group('forwardDestinationRoute', () {
    test('uses the guild channel path when a guild id is present', () {
      expect(
        forwardDestinationRoute(channelId: 'general', guildId: _guildId),
        RoutePaths.guildChannel(_guildId, 'general'),
      );
    });

    test('uses the DM path when guild id is missing', () {
      expect(
        forwardDestinationRoute(channelId: 'dm_alice'),
        RoutePaths.dmChannel('dm_alice'),
      );
      expect(
        forwardDestinationRoute(channelId: 'dm_alice', guildId: ''),
        RoutePaths.dmChannel('dm_alice'),
      );
    });
  });

  group('showForwardMessageSheet', () {
    testWidgets('does not throw when the host context is unmounted', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      late BuildContext captured;
      await tester.pumpWidget(
        _app(
          db,
          _message(channelId: 'source-chan'),
          onOpen: (BuildContext context) => captured = context,
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();

      await showForwardMessageSheet(
        captured,
        message: _message(channelId: 'source-chan'),
      );
      expect(find.text(testL10n.forwardMessageTitle), findsNothing);
    });

    testWidgets('renders destinations including the source channel', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      expect(find.text('general'), findsOneWidget);
      await _ensureDestinationVisible(tester, 'source-chan');
      expect(find.text('source-chan'), findsOneWidget);
      await _ensureDestinationVisible(tester, 'voice-room');
      expect(find.text('voice-room'), findsOneWidget);
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

    testWidgets('includes the source channel when searching by its name', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      await tester.enterText(find.byType(TextField).first, 'source-chan');
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(ListView),
          matching: find.text('source-chan'),
        ),
        findsOneWidget,
      );
      expect(find.text('general'), findsNothing);
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
      await _ensureDestinationVisible(tester, 'source-chan');
      expect(find.text('source-chan'), findsOneWidget);
    });

    testWidgets('surfaces the comment counter past the 80% threshold', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      expect(find.text('100'), findsNothing);

      await tester.enterText(find.byType(TextField).last, 'a' * 1900);
      await tester.pump();

      expect(find.text('100'), findsOneWidget);
    });
  });

  group('comment typing', () {
    testWidgets('keeps typing when a hardware keyboard hides the soft one', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);
      final Finder field = find.byType(TextField).last;
      await tester.showKeyboard(field);
      tester.view.viewInsets = const FakeViewPadding(bottom: 300);
      addTearDown(tester.view.resetViewInsets);
      await tester.pumpAndSettle();

      tester.view.viewInsets = FakeViewPadding.zero;
      await tester.pumpAndSettle();
      final EditableText editable = tester.widget<EditableText>(
        find.descendant(of: field, matching: find.byType(EditableText)),
      );
      expect(editable.focusNode.hasFocus, isTrue);

      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: 'abc',
          selection: TextSelection.collapsed(offset: 3),
        ),
      );
      await tester.pump();
      expect(editable.controller.text, 'abc');
    });
  });

  group('comment mention context', () {
    testWidgets(
      'uses the selected destination channel, not the source channel',
      (WidgetTester tester) async {
        const String destGuildId = 'guild_dest';
        const Channel destChat = Channel(
          id: 'dest-chat',
          guildId: destGuildId,
          name: 'dest-chat',
        );
        const Channel destSecret = Channel(
          id: 'dest-secret',
          guildId: destGuildId,
          name: 'dest-secret',
        );
        final FluxerDatabase db = await _seedDb();
        Future<void> seedDest(Channel channel) => db.channelDao.upsertChannel(
          ChannelsCompanion.insert(
            id: channel.id,
            guildId: destGuildId,
            name: channel.name,
            type: const Value(0),
          ),
        );
        await seedDest(destChat);
        await seedDest(destSecret);

        await tester.pumpWidget(
          _app(
            db,
            _message(channelId: 'source-chan'),
            allChannels: <Channel>[..._seededChannels, destChat, destSecret],
            guilds: const <Guild>[
              Guild(id: _guildId, name: 'Owned', ownerId: _userId),
              Guild(id: destGuildId, name: 'Other', ownerId: _userId),
            ],
            extraOverrides: <Override>[
              channelListViewModelProvider.overrideWithValue(
                const ChannelListState(
                  guild: Guild(id: _guildId, name: 'Owned', ownerId: _userId),
                  categories: <ChannelCategory>[
                    ChannelCategory(
                      id: 'text',
                      name: 'Text',
                      channels: _seededChannels,
                    ),
                  ],
                  selectedChannelId: 'source-chan',
                ),
              ),
            ],
          ),
        );
        await tester.tap(find.text('Open'));
        await tester.pumpAndSettle();

        ComposerAutocompleteField field = tester.widget(
          find.byType(ComposerAutocompleteField),
        );
        expect(field.channelId, isNull);

        await _ensureDestinationVisible(tester, 'dest-chat');
        await tester.tap(find.text('dest-chat'));
        await tester.pump();

        field = tester.widget(find.byType(ComposerAutocompleteField));
        expect(field.channelId, 'dest-chat');

        await tester.enterText(find.byType(TextField).last, '#');
        await tester.pump(const Duration(milliseconds: 350));
        await tester.pump();

        expect(find.byType(ComposerAutocompletePanelBody), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(ComposerAutocompletePanelBody),
            matching: find.text('dest-secret'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ComposerAutocompletePanelBody),
            matching: find.text('general'),
          ),
          findsNothing,
        );
      },
    );
  });

  group('comment emoji picker', () {
    testWidgets('renders an inline emoji button, not a desktop popout', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      await _openSheet(tester, db);

      expect(find.byType(FluxerEmojiPickerPopout), findsNothing);

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

  group('successful send', () {
    testWidgets('closes without waiting for the forward to be delivered', (
      WidgetTester tester,
    ) async {
      final FluxerDatabase db = await _seedDb();
      final List<_ForwardCall> forwards = <_ForwardCall>[];
      final _RecordingRouter router = _RecordingRouter();

      await tester.pumpWidget(
        _app(
          db,
          _message(channelId: 'source-chan'),
          extraOverrides: <Override>[
            fluxerRouterProvider.overrideWithValue(router),
            currentRevealSideProvider.overrideWith(_MainRevealSide.new),
            chatViewModelProvider.overrideWith(
              () => _FakeChatViewModel(forwards),
            ),
            shouldShowMatureContentGateProvider(
              'general',
            ).overrideWith((ref) => false),
          ],
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('general'));
      await tester.pump();
      await tester.tap(
        find.text(testL10n.forwardSendButton(1, kForwardSelectionLimit)),
      );
      await tester.pumpAndSettle();

      expect(forwards, hasLength(1));
      expect(forwards.single.sourceMessageId, 'm1');
      expect(forwards.single.destinationChannelIds, <String>['general']);
      expect(forwards.single.delivered.isCompleted, isFalse);
      expect(find.text(testL10n.forwardMessageTitle), findsNothing);
      expect(router.locations, <String>[
        RoutePaths.guildChannel(_guildId, 'general'),
      ]);
    });
  });
}

class _ForwardCall {
  _ForwardCall({
    required this.sourceMessageId,
    required this.destinationChannelIds,
  });

  final String sourceMessageId;
  final List<String> destinationChannelIds;
  final Completer<void> delivered = Completer<void>();
}

class _MainRevealSide extends CurrentRevealSide {
  @override
  RevealSide build() => RevealSide.main;
}

class _RecordingRouter extends Fake implements GoRouter {
  final List<String> locations = <String>[];

  @override
  void go(String location, {Object? extra}) {
    locations.add(location);
  }
}

class _FakeChatViewModel extends ChatViewModel {
  _FakeChatViewModel([this.forwards = const <_ForwardCall>[]]);

  final List<_ForwardCall> forwards;

  @override
  ChatViewState build() => const ChatViewState(
    channelId: 'source-chan',
    messages: <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {}

  @override
  Future<void> forwardMessage({
    required String sourceChannelId,
    required String sourceMessageId,
    required List<String> destinationChannelIds,
    String? sourceGuildId,
    List<String>? attachmentIds,
    List<int>? embedIndices,
    String? comment,
  }) {
    final _ForwardCall call = _ForwardCall(
      sourceMessageId: sourceMessageId,
      destinationChannelIds: destinationChannelIds,
    );
    forwards.add(call);
    return call.delivered.future;
  }
}
