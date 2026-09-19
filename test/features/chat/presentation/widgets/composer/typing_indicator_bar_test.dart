import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../helpers/test_l10n.dart';

const String _kTyperUserId = 'user-1';

late ProviderContainer container;

Future<void> _pumpTypingIndicatorBar(
  WidgetTester tester, {
  required bool compact,
}) async {
  container = ProviderContainer(
    overrides: [
      chatViewModelProvider.overrideWithValue(_chatState()),
      currentUserIdProvider.overrideWithValue('me'),
      contextualGuildIdProvider.overrideWithValue('guild-1'),
      blockedUserIdsProvider.overrideWithValue(const <String>{}),
      guildUserDisplayProvider((_kTyperUserId, 'guild-1')).overrideWith(
        (ref) => const AsyncValue.data(
          GuildUserDisplay(
            displayName: 'Typer',
            avatarUrl: null,
            avatarColor: null,
            accountDisplayName: 'Typer',
          ),
        ),
      ),
    ],
  );
  addTearDown(container.dispose);

  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: MediaQuery(
          data: const MediaQueryData(disableAnimations: true),
          child: Scaffold(body: TypingIndicatorBar(compact: compact)),
        ),
      ),
    ),
  );
  container
      .read(typingIndicatorsProvider.notifier)
      .addTyping('channel-1', _kTyperUserId);
  await tester.pump();
}

ChatViewState _chatState() {
  return const ChatViewState(
    channelId: 'channel-1',
    messages: <Message>[],
    replyingTo: null,
    replyMentioning: true,
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
}

void main() {
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  testWidgets('wide typing indicator uses spinner without pill chrome', (
    WidgetTester tester,
  ) async {
    await _pumpTypingIndicatorBar(tester, compact: false);

    expect(find.byType(ChatLoadingSpinner), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is DecoratedBox &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).borderRadius ==
                BorderRadius.circular(16),
      ),
      findsNothing,
    );
    container.read(typingIndicatorsProvider.notifier).clearAll();
  });

  testWidgets('typing indicator label avoids bounded text clipping', (
    WidgetTester tester,
  ) async {
    await _pumpTypingIndicatorBar(tester, compact: false);

    expect(find.textContaining('is typing'), findsOneWidget);
    expect(find.byType(FluxerBoundedTextClip), findsNothing);
    container.read(typingIndicatorsProvider.notifier).clearAll();
  });

  testWidgets('wide typing indicator uses circular avatar outline rings', (
    WidgetTester tester,
  ) async {
    await _pumpTypingIndicatorBar(tester, compact: false);

    final FluxerAvatarStack stack = tester.widget<FluxerAvatarStack>(
      find.byType(FluxerAvatarStack),
    );
    expect(stack.outlineColor, isNotNull);
    expect(stack.size, 12);
    expect(stack.overlap, -4);
    expect(stack.outlineWidth, 1);
    expect(
      tester
          .widgetList<DecoratedBox>(find.byType(DecoratedBox))
          .map((DecoratedBox box) => box.decoration)
          .whereType<BoxDecoration>()
          .where(
            (BoxDecoration decoration) =>
                decoration.shape == BoxShape.circle &&
                decoration.color == stack.outlineColor,
          )
          .length,
      greaterThan(0),
    );
    container.read(typingIndicatorsProvider.notifier).clearAll();
  });

  testWidgets('compact typing indicator keeps the loading spinner', (
    WidgetTester tester,
  ) async {
    await _pumpTypingIndicatorBar(tester, compact: true);

    expect(find.byType(ChatLoadingSpinner), findsOneWidget);
    expect(
      tester
          .widget<FluxerAvatarStack>(find.byType(FluxerAvatarStack))
          .outlineColor,
      isNotNull,
    );
    container.read(typingIndicatorsProvider.notifier).clearAll();
  });
}
