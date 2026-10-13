import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

void _noop() {}

Widget _overlay({required bool showUnreadBar}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(
      body: MessageListOverlay(
        body: const SizedBox.expand(),
        showUnreadBar: showUnreadBar,
        unreadCount: 3,
        isEstimated: false,
        unreadSince: null,
        onJumpToUnread: _noop,
        onMarkRead: _noop,
        showLoadErrorBar: false,
        loadErrorRetryInFlight: false,
        onRetryLoadMessages: _noop,
        scaleRatio: 1,
      ),
    ),
  );
}

Future<void> _pump(WidgetTester tester, {required bool showUnreadBar}) {
  return tester.pumpWidget(
    ProviderScope(
      overrides: [use12HourTimeFormatProvider.overrideWithValue(false)],
      child: _overlay(showUnreadBar: showUnreadBar),
    ),
  );
}

double _barOpacity(WidgetTester tester) => tester
    .widget<FadeTransition>(
      find
          .ancestor(
            of: find.byType(MessageListNewMessagesBar),
            matching: find.byType(FadeTransition),
          )
          .first,
    )
    .opacity
    .value;

void main() {
  testWidgets('unread bar fades in and out instead of cutting', (tester) async {
    await _pump(tester, showUnreadBar: false);
    expect(find.byType(MessageListNewMessagesBar), findsNothing);

    await _pump(tester, showUnreadBar: true);
    await tester.pump(FluxerMotionTheme.normalDuration ~/ 2);
    expect(_barOpacity(tester), inExclusiveRange(0, 1));

    await tester.pumpAndSettle();
    expect(_barOpacity(tester), 1);

    await _pump(tester, showUnreadBar: false);
    await tester.pump(FluxerMotionTheme.normalDuration ~/ 2);
    expect(find.byType(MessageListNewMessagesBar), findsOneWidget);
    expect(_barOpacity(tester), inExclusiveRange(0, 1));

    await tester.pumpAndSettle();
    expect(find.byType(MessageListNewMessagesBar), findsNothing);
  });
}
