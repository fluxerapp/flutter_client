import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import '../../../../helpers/test_l10n.dart';

Widget _buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  group('visibleGuildIconPeekActions', () {
    test('includes mark as read only when guild has unread', () {
      expect(
        visibleGuildIconPeekActions(hasUnread: true),
        <GuildIconPeekAction>[
          GuildIconPeekAction.markAsRead,
          GuildIconPeekAction.notifications,
          GuildIconPeekAction.moreOptions,
        ],
      );
      expect(
        visibleGuildIconPeekActions(hasUnread: false),
        <GuildIconPeekAction>[
          GuildIconPeekAction.notifications,
          GuildIconPeekAction.moreOptions,
        ],
      );
    });
  });

  group('shouldCancelGuildPeekHold', () {
    test('returns false until vertical movement exceeds hold threshold', () {
      const Offset start = Offset(10, 20);
      expect(
        shouldCancelGuildPeekHold(
          pointerDownPosition: start,
          currentPosition: const Offset(10, 23),
        ),
        isFalse,
      );
      expect(
        shouldCancelGuildPeekHold(
          pointerDownPosition: start,
          currentPosition: const Offset(10, 24),
        ),
        isTrue,
      );
    });
  });

  group('shouldSuppressPeekForDrag', () {
    test('returns false until vertical movement exceeds threshold', () {
      const Offset start = Offset(10, 20);
      expect(
        shouldSuppressPeekForDrag(
          pointerDownPosition: start,
          currentPosition: const Offset(15, 25),
        ),
        isFalse,
      );
      expect(
        shouldSuppressPeekForDrag(
          pointerDownPosition: start,
          currentPosition: const Offset(10, 33),
        ),
        isTrue,
      );
    });
  });

  group('GuildIconPeekMenuPanel', () {
    Future<void> pumpPanel(
      WidgetTester tester, {
      required bool hasUnread,
    }) async {
      final Map<GuildIconPeekAction, GlobalKey> itemKeys =
          <GuildIconPeekAction, GlobalKey>{
            for (final GuildIconPeekAction action in GuildIconPeekAction.values)
              action: GlobalKey(),
          };
      await tester.pumpWidget(
        _buildTestApp(
          GuildIconPeekMenuPanel(
            guildName: 'Test Guild',
            hasUnread: hasUnread,
            itemKeys: itemKeys,
          ),
        ),
      );
    }

    testWidgets('shows mark as read when guild has unread', (tester) async {
      await pumpPanel(tester, hasUnread: true);
      expect(find.text('Mark as Read'), findsOneWidget);
      expect(find.text('Notification Settings'), findsOneWidget);
      expect(find.text('More Options'), findsOneWidget);
    });

    testWidgets('hides mark as read when guild has no unread', (tester) async {
      await pumpPanel(tester, hasUnread: false);
      expect(find.text('Mark as Read'), findsNothing);
      expect(find.text('Notification Settings'), findsOneWidget);
      expect(find.text('More Options'), findsOneWidget);
    });
  });

  group('hitTestPeekAction', () {
    testWidgets('returns action under global pointer position', (tester) async {
      final Map<GuildIconPeekAction, GlobalKey> itemKeys =
          <GuildIconPeekAction, GlobalKey>{
            for (final GuildIconPeekAction action in GuildIconPeekAction.values)
              action: GlobalKey(),
          };
      await tester.pumpWidget(
        _buildTestApp(
          Center(
            child: GuildIconPeekMenuPanel(
              guildName: 'Test Guild',
              hasUnread: false,
              itemKeys: itemKeys,
            ),
          ),
        ),
      );
      final BuildContext notificationsContext =
          itemKeys[GuildIconPeekAction.notifications]!.currentContext!;
      final RenderBox notificationsBox =
          notificationsContext.findRenderObject()! as RenderBox;
      final Offset center = notificationsBox.localToGlobal(
        notificationsBox.size.center(Offset.zero),
      );
      expect(
        hitTestPeekAction(
          globalPosition: center,
          itemKeys: itemKeys,
          visibleActions: visibleGuildIconPeekActions(hasUnread: false),
        ),
        GuildIconPeekAction.notifications,
      );
    });
  });
}
