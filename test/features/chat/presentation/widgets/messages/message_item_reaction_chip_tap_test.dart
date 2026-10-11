// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/double_tap_reaction_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

Message _message() {
  return Message(
    id: 'm1',
    channelId: 'c1',
    authorId: '123456789012345678',
    authorName: 'Alice',
    content: 'hello',
    timestamp: DateTime(2026, 1, 1, 12),
    reactions: const [
      Reaction(emoji: '😀', count: 2),
      Reaction(emoji: '🎉', count: 3),
    ],
  );
}

const MessageRenderSettings _settings = MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: true,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
);

class _PushObserver extends NavigatorObserver {
  final List<Route<dynamic>> pushed = <Route<dynamic>>[];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushed.add(route);
  }
}

Widget _app(Widget child, {NavigatorObserver? observer}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceRuntimeConfigOverride(),
      use12HourTimeFormatProvider.overrideWithValue(false),
      fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
      contextualGuildIdProvider.overrideWithValue(null),
      instanceFeatureEnabledProvider(
        LimitKeys.featureGlobalExpressions,
      ).overrideWithValue(false),
      appearancePreferencesProvider.overrideWithValue(
        const AppearancePreferencesState(),
      ),
      isMessageSavedProvider('m1').overrideWith((ref) => Stream.value(false)),
      favoriteMemesProvider.overrideWith(
        (ref) => Stream<List<FavoriteMeme>>.value(const <FavoriteMeme>[]),
      ),
      messageTranslationAvailableProvider.overrideWith(
        (ref) => Future<bool>.value(false),
      ),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      navigatorObservers: <NavigatorObserver>[?observer],
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('tapping two reaction chips quickly toggles both, fixes #3780', (
    tester,
  ) async {
    final List<String> reacted = <String>[];
    await tester.pumpWidget(
      _app(
        MessageItem(
          message: _message(),
          renderSettings: _settings,
          onReaction:
              (String emoji, {String? emojiId, bool animated = false}) =>
                  reacted.add(emoji),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.text('2'));
    await tester.pump(const Duration(milliseconds: 80));
    await tester.tap(find.text('3'));
    await tester.pump(const Duration(seconds: 1));

    expect(reacted, <String>['😀', '🎉']);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('double tapping the message body still quick reacts', (
    tester,
  ) async {
    final List<String> reacted = <String>[];
    await tester.pumpWidget(
      _app(
        MessageItem(
          message: _message(),
          renderSettings: _settings,
          onReaction:
              (String emoji, {String? emojiId, bool animated = false}) =>
                  reacted.add(emoji),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(find.text('hello', findRichText: true));
    await tester.pump(const Duration(milliseconds: 80));
    await tester.tap(find.text('hello', findRichText: true));
    await tester.pump(const Duration(seconds: 1));

    expect(reacted, <String>[kDefaultDoubleTapReactionName]);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('tapping the author opens the profile without the double '
      'tap wait', (tester) async {
    final _PushObserver observer = _PushObserver();
    await tester.pumpWidget(
      _app(
        MessageItem(
          message: _message(),
          renderSettings: _settings,
          onReaction:
              (String emoji, {String? emojiId, bool animated = false}) {},
        ),
        observer: observer,
      ),
    );
    await tester.pump();
    final int before = observer.pushed.length;

    await tester.tap(find.text('Alice'));
    await tester.pump();

    expect(observer.pushed.length, before + 1);
    await releaseTestWidgetTree(tester);
  });
}
