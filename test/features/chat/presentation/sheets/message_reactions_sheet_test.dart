import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_reactors_provider.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _kChannelId = '100';
const String _kMessageId = '200';
const String _kBizoId = '9000';
const String _kFullestId = '1000';

UserPartialResponse _user(String id, String username) => UserPartialResponse(
  id: id,
  username: username,
  discriminator: '0',
  globalName: null,
  avatar: null,
  avatarColor: null,
  flags: 0,
);

class _FakeReactors extends MessageReactors {
  _FakeReactors(this.users);

  final List<UserPartialResponse> users;

  @override
  Future<MessageReactorsState> build({
    required String channelId,
    required String messageId,
    required String emoji,
  }) async => MessageReactorsState(users: users, hasMore: false);
}

class _FakeUserNoteViewModel extends UserNoteViewModel {
  @override
  Stream<String?> build({required String userId}) =>
      Stream<String?>.value(null);
}

Message _message(List<Reaction> reactions) => Message(
  id: _kMessageId,
  channelId: _kChannelId,
  authorId: '1',
  authorName: 'Author',
  content: 'hi',
  timestamp: DateTime.utc(2026),
  reactions: reactions,
);

List<Override> _overrides(Map<String, List<UserPartialResponse>> byEmoji) {
  return <Override>[
    instanceRuntimeConfigOverride(),
    fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
    contextualGuildIdProvider.overrideWithValue(null),
    for (final MapEntry<String, List<UserPartialResponse>> entry
        in byEmoji.entries)
      messageReactorsProvider(
        channelId: _kChannelId,
        messageId: _kMessageId,
        emoji: entry.key,
      ).overrideWith(() => _FakeReactors(entry.value)),
    userPresenceProvider(_kBizoId).overrideWith(
      (Ref ref) => Stream<User?>.value(
        const User(
          id: _kBizoId,
          username: 'bizo',
          discriminator: '0',
          bot: false,
          system: false,
          status: 'online',
          mobile: false,
        ),
      ),
    ),
    userNoteViewModelProvider(
      userId: _kBizoId,
    ).overrideWith(_FakeUserNoteViewModel.new),
  ];
}

Future<void> _openSheet(
  WidgetTester tester, {
  required List<Reaction> reactions,
  required Map<String, List<UserPartialResponse>> byEmoji,
}) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: _overrides(byEmoji),
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Builder(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () => unawaited(
                  showMessageReactionsSheet(
                    context,
                    message: _message(reactions),
                  ),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(EmojiRegistry.preload);

  testWidgets('reactors keep the order the API returns', (
    WidgetTester tester,
  ) async {
    await _openSheet(
      tester,
      reactions: const <Reaction>[
        Reaction(emoji: 'fluxer', emojiId: '55', count: 2),
      ],
      byEmoji: <String, List<UserPartialResponse>>{
        'fluxer:55': <UserPartialResponse>[
          _user(_kBizoId, 'bizo'),
          _user(_kFullestId, 'fullest'),
        ],
      },
    );

    final double bizoY = tester.getTopLeft(find.text('bizo')).dy;
    final double fullestY = tester.getTopLeft(find.text('fullest')).dy;
    expect(bizoY, lessThan(fullestY));
    await releaseTestWidgetTree(tester);
  });

  testWidgets('shows the selected custom emoji name and follows the tab', (
    WidgetTester tester,
  ) async {
    final EmojiEntry thumbsUpEntry = EmojiRegistry.entryByName('thumbsup')!;
    final String thumbsUp = thumbsUpEntry.surrogates;
    await _openSheet(
      tester,
      reactions: <Reaction>[
        const Reaction(emoji: 'TrollFace', emojiId: '55', count: 1),
        Reaction(emoji: thumbsUp, count: 1),
      ],
      byEmoji: <String, List<UserPartialResponse>>{
        'TrollFace:55': <UserPartialResponse>[_user(_kBizoId, 'bizo')],
        thumbsUp: <UserPartialResponse>[_user(_kFullestId, 'fullest')],
      },
    );

    expect(find.text(':TrollFace:'), findsOneWidget);

    await tester.tap(find.text('1').last);
    await tester.pumpAndSettle();

    expect(find.text(':TrollFace:'), findsNothing);
    expect(find.text(':${thumbsUpEntry.primaryName}:'), findsOneWidget);
    expect(find.text('fullest'), findsOneWidget);
    await releaseTestWidgetTree(tester);
  });

  test('names unicode reactions by their shortcode with skin tone', () {
    final EmojiEntry thumbsUp = EmojiRegistry.entryByName('thumbsup')!;
    expect(
      reactionEmojiName(Reaction(emoji: thumbsUp.surrogates, count: 1)),
      ':${thumbsUp.primaryName}:',
    );
    expect(
      reactionEmojiName(Reaction(emoji: thumbsUp.skinSurrogates[1], count: 1)),
      ':${thumbsUp.primaryName}::skin-tone-2:',
    );
  });

  testWidgets('tapping a reactor opens their profile', (
    WidgetTester tester,
  ) async {
    await _openSheet(
      tester,
      reactions: const <Reaction>[
        Reaction(emoji: 'fluxer', emojiId: '55', count: 1),
      ],
      byEmoji: <String, List<UserPartialResponse>>{
        'fluxer:55': <UserPartialResponse>[_user(_kBizoId, 'bizo')],
      },
    );

    expect(find.byType(UserProfileView), findsNothing);
    await tester.tap(find.text('bizo'));
    await tester.pumpAndSettle();

    final UserProfileView view = tester.widget(find.byType(UserProfileView));
    expect(view.userId, _kBizoId);
    await releaseTestWidgetTree(tester);
  });
}
