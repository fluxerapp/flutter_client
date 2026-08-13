import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_list_typing_indicator.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../helpers/test_l10n.dart';

const String _kTyperUserId = '123456789012345678';
const String _kBlockedUserId = '123456789012345679';

void main() {
  group('ChannelListTypingIndicator', () {
    setUp(() {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
    });

    tearDown(() {
      VisibilityDetectorController.instance.updateInterval = const Duration(
        milliseconds: 500,
      );
    });
    testWidgets('shows dots only in indicatorOnly mode', (tester) async {
      await _runTypingIndicatorTest(tester, () async {
        await _pumpIndicator(
          tester,
          mode: ChannelTypingIndicatorMode.indicatorOnly,
        );
        container
            .read(typingIndicatorsProvider.notifier)
            .addTyping('c1', _kTyperUserId);
        await tester.pump();

        expect(find.byType(FluxerLoadingSpinner), findsOneWidget);
        expect(find.byType(FluxerAvatarStack), findsNothing);
      });
    });

    testWidgets('shows dots and avatar stack in avatars mode', (tester) async {
      await _runTypingIndicatorTest(tester, () async {
        await _pumpIndicator(tester, mode: ChannelTypingIndicatorMode.avatars);
        container
            .read(typingIndicatorsProvider.notifier)
            .addTyping('c1', _kTyperUserId);
        await tester.pump();

        expect(find.byType(FluxerLoadingSpinner), findsOneWidget);
        expect(find.byType(FluxerAvatarStack), findsOneWidget);
      });
    });

    testWidgets('renders nothing in hidden mode', (tester) async {
      await _runTypingIndicatorTest(tester, () async {
        await _pumpIndicator(tester, mode: ChannelTypingIndicatorMode.hidden);
        container
            .read(typingIndicatorsProvider.notifier)
            .addTyping('c1', _kTyperUserId);
        await tester.pump();

        expect(find.byType(FluxerLoadingSpinner), findsNothing);
        expect(find.byType(FluxerAvatarStack), findsNothing);
      });
    });

    testWidgets('hides on selected channel when showSelected is false', (
      tester,
    ) async {
      await _runTypingIndicatorTest(tester, () async {
        await _pumpIndicator(
          tester,
          mode: ChannelTypingIndicatorMode.avatars,
          isSelected: true,
        );
        container
            .read(typingIndicatorsProvider.notifier)
            .addTyping('c1', _kTyperUserId);
        await tester.pump();

        expect(find.byType(FluxerLoadingSpinner), findsNothing);
      });
    });

    testWidgets('shows on selected channel when showSelected is true', (
      tester,
    ) async {
      await _runTypingIndicatorTest(tester, () async {
        await _pumpIndicator(
          tester,
          mode: ChannelTypingIndicatorMode.avatars,
          isSelected: true,
          showSelectedChannelTypingIndicator: true,
        );
        container
            .read(typingIndicatorsProvider.notifier)
            .addTyping('c1', _kTyperUserId);
        await tester.pump();

        expect(find.byType(FluxerLoadingSpinner), findsOneWidget);
      });
    });

    testWidgets('hides when the only typer is blocked', (tester) async {
      await _runTypingIndicatorTest(tester, () async {
        await _pumpIndicator(
          tester,
          mode: ChannelTypingIndicatorMode.avatars,
          blockedUserIds: {_kBlockedUserId},
        );
        container
            .read(typingIndicatorsProvider.notifier)
            .addTyping('c1', _kBlockedUserId);
        await tester.pump();

        expect(find.byType(FluxerLoadingSpinner), findsNothing);
      });
    });
  });
}

late ProviderContainer container;

Future<void> _runTypingIndicatorTest(
  WidgetTester tester,
  Future<void> Function() body,
) async {
  try {
    await body();
  } finally {
    container.read(typingIndicatorsProvider.notifier).clearAll();
  }
}

Future<void> _pumpIndicator(
  WidgetTester tester, {
  required ChannelTypingIndicatorMode mode,
  bool isSelected = false,
  bool showSelectedChannelTypingIndicator = false,
  Set<String> blockedUserIds = const {},
}) async {
  container = ProviderContainer(
    overrides: [
      currentUserIdProvider.overrideWithValue('me'),
      appearancePreferencesProvider.overrideWith(
        () => _TestAppearancePreferences(
          mode: mode,
          showSelectedChannelTypingIndicator:
              showSelectedChannelTypingIndicator,
        ),
      ),
      blockedUserIdsProvider.overrideWithValue(blockedUserIds),
      for (final String userId in <String>{
        _kTyperUserId,
        _kBlockedUserId,
        ...blockedUserIds,
      })
        guildUserDisplayProvider((userId, 'g1')).overrideWith(
          (ref) => AsyncValue.data(
            GuildUserDisplay(
              displayName: 'User $userId',
              avatarUrl: null,
              avatarColor: null,
              accountDisplayName: 'User $userId',
            ),
          ),
        ),
    ],
  );
  addTearDown(container.dispose);

  final colorTheme = buildDarkColorTheme();
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
        home: Scaffold(
          body: ChannelListTypingIndicator(
            channelId: 'c1',
            guildId: 'g1',
            isSelected: isSelected,
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

class _TestAppearancePreferences extends AppearancePreferences {
  _TestAppearancePreferences({
    required this.mode,
    required this.showSelectedChannelTypingIndicator,
  });

  final ChannelTypingIndicatorMode mode;
  final bool showSelectedChannelTypingIndicator;

  @override
  AppearancePreferencesState build() => AppearancePreferencesState(
    channelTypingIndicatorMode: mode,
    showSelectedChannelTypingIndicator: showSelectedChannelTypingIndicator,
  );
}
