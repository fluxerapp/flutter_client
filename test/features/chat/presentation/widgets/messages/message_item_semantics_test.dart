import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/message_item_test_overrides.dart';
import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

Message _message({String content = 'hello world'}) => Message(
  id: '1',
  channelId: 'c1',
  authorId: '123456789012345678',
  authorName: 'Webhook',
  webhookId: 'wh1',
  content: content,
  timestamp: DateTime.utc(2026, 1, 1, 12),
);

const MessageRenderSettings _settings = MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
);

Future<void> _pumpApp(WidgetTester tester, Widget child) {
  final colorTheme = buildDarkColorTheme();
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(_database),
        instanceRuntimeConfigOverride(),
        ...messageItemTestProviderOverrides(),
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
        home: Scaffold(body: child),
      ),
    ),
  );
}

late FluxerDatabase _database;

void main() {
  setUp(() {
    _database = openTestDatabase();
  });

  messageItemTestWidgets('exposes author and content in semantics label', (
    tester,
  ) async {
    await _pumpApp(
      tester,
      MessageItem(message: _message(), renderSettings: _settings),
    );
    await tester.pump();
    await tester.pumpAndSettle();

    expect(
      find.bySemanticsLabel(RegExp('Webhook.*hello world')),
      findsOneWidget,
    );
  });

  messageItemTestWidgets(
    'the semantics label follows an edit of the same message',
    (tester) async {
      await _pumpApp(
        tester,
        MessageItem(message: _message(), renderSettings: _settings),
      );
      await tester.pumpAndSettle();

      await _pumpApp(
        tester,
        MessageItem(
          message: _message(content: 'edited words'),
          renderSettings: _settings,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.bySemanticsLabel(RegExp('Webhook.*edited words')),
        findsOneWidget,
      );
      expect(find.bySemanticsLabel(RegExp('hello world')), findsNothing);
    },
  );

  messageItemTestWidgets('reaction chips expose emoji and count labels', (
    tester,
  ) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await _pumpApp(
      tester,
      MessageReactionsBar(
        reactions: const <Reaction>[
          Reaction(emoji: '👍', count: 3, hasReacted: true),
        ],
        channelId: 'c1',
        onReactionTap: (_, {emojiId, animated = false}) {},
        isMobile: true,
      ),
    );

    expect(find.bySemanticsLabel('👍, 3'), findsOneWidget);
    handle.dispose();
  });
}
