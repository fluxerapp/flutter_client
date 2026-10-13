// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter/gestures.dart';
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
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

const String _currentUserId = '123456789012345678';

Message _failedMessage() {
  return Message(
    id: 'm1',
    channelId: 'c1',
    authorId: _currentUserId,
    authorName: 'Alice',
    content: 'hello there',
    timestamp: DateTime(2026, 1, 1, 12),
    deliveryState: MessageDeliveryState.failed,
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

class _FixedModality extends InputModalityNotifier {
  _FixedModality({required this.touchPrimary});

  final bool touchPrimary;

  @override
  bool build() => touchPrimary;
}

Widget _app(Widget child, {required bool touchPrimary}) {
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
      inputModalityProvider.overrideWith(
        () => _FixedModality(touchPrimary: touchPrimary),
      ),
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
  );
}

Offset _contentCenter(WidgetTester tester) {
  final RenderParagraph paragraph = tester.allRenderObjects
      .whereType<RenderParagraph>()
      .firstWhere(
        (RenderParagraph candidate) =>
            candidate.text.toPlainText().contains('hello there'),
      );
  return paragraph.localToGlobal(paragraph.size.center(Offset.zero));
}

void main() {
  testWidgets('tapping a failed message opens retry and delete on touch', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    int retries = 0;
    await tester.pumpWidget(
      _app(
        MessageItem(
          message: _failedMessage(),
          currentUserId: _currentUserId,
          renderSettings: _settings,
          onRetry: () => retries++,
        ),
        touchPrimary: true,
      ),
    );
    await tester.pump();

    expect(
      find.text(testL10n.chatMessageFailedToSendTapForOptions),
      findsOneWidget,
    );

    await tester.tapAt(_contentCenter(tester));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text(testL10n.retry), findsOneWidget);
    expect(find.text(testL10n.chatMessageDeleteFailed), findsOneWidget);

    await tester.tap(find.text(testL10n.retry));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(retries, 1);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('hovering a failed message shows retry and delete on desktop', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    int retries = 0;
    int deletes = 0;
    await tester.pumpWidget(
      _app(
        MessageItem(
          message: _failedMessage(),
          currentUserId: _currentUserId,
          renderSettings: _settings,
          onRetry: () => retries++,
          onDeleteFailed: () => deletes++,
        ),
        touchPrimary: false,
      ),
    );
    await tester.pump();

    expect(find.text(testL10n.chatMessageFailedToSend), findsOneWidget);
    expect(
      find.text(testL10n.chatMessageFailedToSendTapForOptions),
      findsNothing,
    );

    final TestGesture mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
    );
    await mouse.addPointer(location: Offset.zero);
    addTearDown(mouse.removePointer);
    await mouse.moveTo(_contentCenter(tester));
    await tester.pump();

    expect(find.byTooltip(testL10n.chatMessageReply), findsNothing);
    await tester.tap(find.byTooltip(testL10n.retry));
    await tester.pump();
    expect(retries, 1);

    await mouse.moveTo(_contentCenter(tester));
    await tester.pump();
    await tester.tap(find.byTooltip(testL10n.chatMessageDeleteFailed));
    await tester.pump();
    expect(deletes, 1);
    await releaseTestWidgetTree(tester);
  });
}
