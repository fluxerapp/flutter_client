// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter/rendering.dart';
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

const String _linkLabel = 'example';
const String _linkUrl = 'https://example.com/page';

Message _message() {
  return Message(
    id: 'm1',
    channelId: 'c1',
    authorId: '123456789012345678',
    authorName: 'Alice',
    webhookId: 'wh1',
    content: 'plain [$_linkLabel]($_linkUrl)',
    timestamp: DateTime(2026, 1, 1, 12),
  );
}

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

Widget _app(Widget child) {
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
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

Future<void> _longPressWord(WidgetTester tester, String word) async {
  final RenderParagraph paragraph = tester.allRenderObjects
      .whereType<RenderParagraph>()
      .firstWhere(
        (RenderParagraph candidate) =>
            candidate.text.toPlainText().contains(word),
      );
  final int start = paragraph.text.toPlainText().indexOf(word);
  final List<TextBox> boxes = paragraph.getBoxesForSelection(
    TextSelection(baseOffset: start, extentOffset: start + word.length),
  );
  await tester.longPressAt(
    paragraph.localToGlobal(boxes.first.toRect().center),
  );
  await tester.pump();
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  testWidgets('long pressing a link offers link actions, fixes #773', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(MessageItem(message: _message(), renderSettings: _settings)),
    );
    await tester.pump();

    await _longPressWord(tester, _linkLabel);

    expect(find.text(testL10n.chatMessageCopyLink), findsOneWidget);
    expect(find.text(testL10n.chatMessageOpenLink), findsOneWidget);
  });

  testWidgets('long pressing plain text keeps the plain message actions', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(MessageItem(message: _message(), renderSettings: _settings)),
    );
    await tester.pump();

    await _longPressWord(tester, 'plain');

    expect(find.text(testL10n.chatMessageCopyLink), findsNothing);
    expect(find.text(testL10n.chatMessageReply), findsOneWidget);
  });
}
