// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart' as widgets;
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
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

Message _message(String content) {
  return Message(
    id: 'm1',
    channelId: 'c1',
    authorId: '123456789012345678',
    authorName: 'Alice',
    content: content,
    timestamp: DateTime(2026, 1, 1, 12),
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

TextSpan? _spanWithText(WidgetTester tester, String text) {
  for (final Widget widget in tester.widgetList(
    find.textContaining(text, findRichText: true),
  )) {
    if (widget is! widgets.RichText) {
      continue;
    }
    TextSpan? found;
    widget.text.visitChildren((InlineSpan span) {
      if (span is TextSpan && span.text == text) {
        found = span;
        return false;
      }
      return true;
    });
    if (found != null) {
      return found;
    }
  }
  return null;
}

Offset _textCenter(WidgetTester tester, String text) {
  final RenderParagraph paragraph = tester.renderObject<RenderParagraph>(
    find.textContaining(text, findRichText: true).first,
  );
  final int start = paragraph.text.toPlainText().indexOf(text);
  final List<TextBox> boxes = paragraph.getBoxesForSelection(
    TextSelection(baseOffset: start, extentOffset: start + text.length),
  );
  return paragraph.localToGlobal(boxes.first.toRect().center);
}

Future<void> _pumpMessage(
  WidgetTester tester,
  String content, {
  NavigatorObserver? observer,
}) async {
  await tester.pumpWidget(
    _app(
      MessageItem(
        message: _message(content),
        renderSettings: _settings,
        onReaction: (String emoji, {String? emojiId, bool animated = false}) {},
      ),
      observer: observer,
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('tapping a user mention opens the profile without the double '
      'tap wait', (tester) async {
    final _PushObserver observer = _PushObserver();
    await _pumpMessage(tester, '<@123456789012345678> hi', observer: observer);
    final int before = observer.pushed.length;

    await tester.tap(find.textContaining('@').first);
    await tester.pump();

    expect(observer.pushed.length, before + 1);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('tapping a link opens it without the double tap wait', (
    tester,
  ) async {
    final _PushObserver observer = _PushObserver();
    await _pumpMessage(tester, 'https://example.com', observer: observer);
    final int before = observer.pushed.length;

    await tester.tap(find.text('https://example.com', findRichText: true));
    await tester.pump();

    expect(observer.pushed.length, before + 1);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('tapping a spoiler reveals it without the double tap wait', (
    tester,
  ) async {
    await _pumpMessage(tester, 'see ||secret|| end');
    expect(
      _spanWithText(tester, 'secret')?.recognizer,
      isA<TapGestureRecognizer>(),
    );

    await tester.tapAt(_textCenter(tester, 'secret'));
    await tester.pump();

    expect(_spanWithText(tester, 'secret')?.recognizer, isNull);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('double tapping plain message text still quick reacts', (
    tester,
  ) async {
    final List<String> reacted = <String>[];
    await tester.pumpWidget(
      _app(
        MessageItem(
          message: _message('hello'),
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

    expect(reacted, hasLength(1));
    await releaseTestWidgetTree(tester);
  });
}
