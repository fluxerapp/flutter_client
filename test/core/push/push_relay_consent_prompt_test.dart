import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_prompt_provider.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_provider.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_sheet.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/test_l10n.dart';

final String _relayUrl = fcmRelayUrl(appId: 'stable', deviceToken: 'tok');
const String _ntfyUrl = 'https://ntfy.sh/UP0123456789abcdef';

Future<ProviderContainer> _launch({bool official = false}) async {
  final ProviderContainer container = ProviderContainer(
    overrides: [isActiveInstanceOfficialProvider.overrideWithValue(official)],
  );
  await container.read(pushRelayConsentProvider.notifier).load();
  return container;
}

Future<bool> _sync(
  ProviderContainer container, {
  String userId = 'user-1',
  String? relayUrl,
}) {
  final FutureProvider<bool> probe = FutureProvider<bool>(
    (Ref ref) =>
        ensurePushRelayConsent(ref, relayUrl ?? _relayUrl, userId: userId),
  );
  return container.read(probe.future);
}

Future<bool?> _answerSheet(
  WidgetTester tester, {
  required Future<void> Function(GoRouter router) answer,
}) async {
  final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();
  final GoRouter router = GoRouter(
    navigatorKey: rootKey,
    initialLocation: '/channels',
    routes: [
      GoRoute(
        path: '/channels',
        builder: (_, _) => const Scaffold(body: Text('shell')),
      ),
      GoRoute(
        path: '/loading',
        builder: (_, _) => const Scaffold(body: Text('loading')),
      ),
    ],
  );
  addTearDown(router.dispose);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
  bool? result = true;
  var completed = false;
  unawaited(
    showPushRelayConsentSheet(rootKey.currentContext!).then((bool? value) {
      result = value;
      completed = true;
    }),
  );
  await tester.pumpAndSettle();
  expect(find.text(testL10n.pushRelayConsentTitle), findsWidgets);
  await answer(router);
  await tester.pumpAndSettle();
  expect(completed, isTrue);
  return result;
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test(
    'asks on a self-hosted instance with the relay and no consent',
    () async {
      final ProviderContainer container = await _launch();
      addTearDown(container.dispose);

      expect(await _sync(container), isFalse);
      expect(container.read(pushRelayConsentPromptProvider), isTrue);
    },
  );

  test('does not ask once consent exists', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'push_relay_consent_granted': true,
    });
    final ProviderContainer container = await _launch();
    addTearDown(container.dispose);

    expect(await _sync(container), isTrue);
    expect(container.read(pushRelayConsentPromptProvider), isFalse);
  });

  test('does not ask an account that declined, but asks another', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'push_relay_consent_declined_users': <String>['user-1'],
    });
    final ProviderContainer container = await _launch();
    addTearDown(container.dispose);

    expect(await _sync(container), isFalse);
    expect(container.read(pushRelayConsentPromptProvider), isFalse);

    expect(await _sync(container, userId: 'user-2'), isFalse);
    expect(container.read(pushRelayConsentPromptProvider), isTrue);
  });

  test('does not ask when the instance does not use the relay', () async {
    final ProviderContainer official = await _launch(official: true);
    addTearDown(official.dispose);
    expect(await _sync(official), isTrue);
    expect(official.read(pushRelayConsentPromptProvider), isFalse);

    final ProviderContainer unifiedPush = await _launch();
    addTearDown(unifiedPush.dispose);
    expect(await _sync(unifiedPush, relayUrl: _ntfyUrl), isTrue);
    expect(unifiedPush.read(pushRelayConsentPromptProvider), isFalse);
  });

  test('a decline stored by an older version does not block asking', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'push_relay_consent_granted': false,
    });
    final ProviderContainer container = await _launch();
    addTearDown(container.dispose);

    expect(await _sync(container), isFalse);
    expect(container.read(pushRelayConsentPromptProvider), isTrue);
  });

  test(
    'turning the setting off declines for every signed-in account',
    () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        'push_relay_consent_granted': true,
      });
      final ProviderContainer container = await _launch();
      addTearDown(container.dispose);

      await container
          .read(pushRelayConsentProvider.notifier)
          .revoke(userIds: <String>{'user-1', 'user-2'});

      final ProviderContainer relaunch = await _launch();
      addTearDown(relaunch.dispose);
      expect(relaunch.read(pushRelayConsentProvider), isFalse);
      expect(await _sync(relaunch), isFalse);
      expect(await _sync(relaunch, userId: 'user-2'), isFalse);
      expect(relaunch.read(pushRelayConsentPromptProvider), isFalse);
      expect(await _sync(relaunch, userId: 'user-3'), isFalse);
      expect(relaunch.read(pushRelayConsentPromptProvider), isTrue);
    },
  );

  testWidgets('a sheet removed by a redirect asks again on the next launch', (
    WidgetTester tester,
  ) async {
    final bool? result = await _answerSheet(
      tester,
      answer: (GoRouter router) async => router.go('/loading'),
    );
    expect(result, isNull);

    final ProviderContainer first = await _launch();
    await _sync(first);
    final Set<String>? userIds = first
        .read(pushRelayConsentPromptProvider.notifier)
        .beginPresentation();
    await recordPushRelayConsentSheetResult(
      consent: first.read(pushRelayConsentProvider.notifier),
      agreed: result,
      userIds: userIds!,
    );
    first.dispose();

    final ProviderContainer relaunch = await _launch();
    addTearDown(relaunch.dispose);
    expect(await _sync(relaunch), isFalse);
    expect(relaunch.read(pushRelayConsentPromptProvider), isTrue);
  });

  testWidgets('"Not now" is remembered for the account that was asked', (
    WidgetTester tester,
  ) async {
    final bool? result = await _answerSheet(
      tester,
      answer: (GoRouter router) async {
        await tester.tap(find.text(testL10n.pushRelayConsentDecline));
      },
    );
    expect(result, isFalse);

    final ProviderContainer first = await _launch();
    await _sync(first);
    final Set<String>? userIds = first
        .read(pushRelayConsentPromptProvider.notifier)
        .beginPresentation();
    expect(userIds, <String>{'user-1'});
    await recordPushRelayConsentSheetResult(
      consent: first.read(pushRelayConsentProvider.notifier),
      agreed: result,
      userIds: userIds!,
    );
    first.dispose();

    final ProviderContainer relaunch = await _launch();
    addTearDown(relaunch.dispose);
    expect(await _sync(relaunch), isFalse);
    expect(relaunch.read(pushRelayConsentPromptProvider), isFalse);
    expect(await _sync(relaunch, userId: 'user-2'), isFalse);
    expect(relaunch.read(pushRelayConsentPromptProvider), isTrue);
  });

  testWidgets('agreeing turns the relay on for the whole device', (
    WidgetTester tester,
  ) async {
    final bool? result = await _answerSheet(
      tester,
      answer: (GoRouter router) async {
        await tester.tap(find.text(testL10n.pushRelayConsentAgree));
      },
    );
    expect(result, isTrue);

    final ProviderContainer first = await _launch();
    await recordPushRelayConsentSheetResult(
      consent: first.read(pushRelayConsentProvider.notifier),
      agreed: result,
      userIds: <String>{'user-1'},
    );
    first.dispose();

    final ProviderContainer relaunch = await _launch();
    addTearDown(relaunch.dispose);
    expect(await _sync(relaunch, userId: 'user-2'), isTrue);
    expect(relaunch.read(pushRelayConsentPromptProvider), isFalse);
  });
}
