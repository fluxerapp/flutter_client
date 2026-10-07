// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
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
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/friends/data/friend_repository.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/moderation/data/report_flow_repository.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_option_list.dart';
import 'package:fluxer_app/features/moderation/providers/report_flow_provider.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_security_login.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/providers/webauthn_credentials_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_warning_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/message_item_test_overrides.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/report_flow_test_walks.dart';
import '../../../helpers/test_l10n.dart';

const String _authorId = '123456789012345678';
const String _webhookId = '987654321098765432';

class _Post {
  _Post(this.path, this.body);

  final String path;
  final Map<String, dynamic> body;
}

class _Reply {
  const _Reply(this.status, this.body);

  final int status;
  final Map<String, Object> body;
}

class _FlowServer implements HttpClientAdapter {
  _FlowServer({Map<String, String>? flowBodies})
    : flowBodies =
          flowBodies ??
          <String, String>{
            for (final ReportFlowTargetType target
                in ReportFlowTargetType.values)
              '/reports/flows/${target.wireValue}': File(
                'test/fixtures/report_flows/${target.wireValue}_in_app.json',
              ).readAsStringSync(),
          };

  final Map<String, String> flowBodies;
  final List<String> gets = <String>[];
  final List<Map<String, dynamic>> getQueries = <Map<String, dynamic>>[];
  final List<_Post> posts = <_Post>[];
  final List<_Reply> replies = <_Reply>[];
  int failingLoads = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.method == 'GET') {
      gets.add(options.path);
      getQueries.add(options.queryParameters);
      if (failingLoads > 0) {
        failingLoads--;
        return _json(500, <String, Object>{'code': 'INTERNAL_SERVER_ERROR'});
      }
      return ResponseBody.fromString(
        flowBodies[options.path]!,
        200,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>['application/json'],
        },
      );
    }
    final List<int> bytes = <int>[];
    await requestStream?.forEach(bytes.addAll);
    posts.add(
      _Post(
        options.path,
        jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>,
      ),
    );
    final _Reply reply = replies.isEmpty
        ? const _Reply(200, <String, Object>{
            'report_id': '1',
            'status': 'pending',
            'reported_at': '2026-10-03T00:00:00Z',
          })
        : replies.removeAt(0);
    return _json(reply.status, reply.body);
  }

  ResponseBody _json(int status, Map<String, Object> body) {
    return ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _FakeFriendRepository implements FriendRepository {
  final List<String> blocked = <String>[];

  @override
  Future<void> blockUser(String userId) async {
    blocked.add(userId);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeUserSettings extends UserSettingsViewModel {
  _FakeUserSettings(this._initial);

  final UserSettingsViewState _initial;

  @override
  UserSettingsViewState build() => _initial;

  @visibleForTesting
  UserSettingsViewState get account => state;

  set account(UserSettingsViewState next) => state = next;
}

UserSettingsViewState _account({String? email, bool verified = false}) {
  return kMessageItemTestUserSettings.copyWith(
    isProfileLoaded: true,
    email: email,
    verified: verified,
  );
}

const String _accountEmail = 'tester@example.com';

Message _message({
  String? webhookId,
  bool authorIsBot = false,
  String content = 'plain words',
}) {
  return Message(
    id: '222222222222222222',
    channelId: '111111111111111111',
    authorId: webhookId ?? _authorId,
    authorName: webhookId == null ? 'Alice' : 'Harbor Bulletin',
    authorIsBot: authorIsBot,
    webhookId: webhookId,
    content: content,
    timestamp: DateTime(2026, 1, 1, 12),
  );
}

const IarUserContext _profile = IarUserContext(
  userId: _authorId,
  username: 'alice#8885',
  displayName: 'Alice',
  avatarUrl: null,
);

IarContext _targetFor(ReportFlowTargetType target) =>
    target == ReportFlowTargetType.message
    ? IarMessageContext(message: _message(), guildId: null)
    : _profile;

class _Harness {
  _Harness(
    this.tester, {
    _FlowServer? server,
    Set<String>? blockedIds,
    UserSettingsViewState account = kMessageItemTestUserSettings,
  }) : server = server ?? _FlowServer(),
       blockedIds = blockedIds ?? <String>{},
       settings = _FakeUserSettings(account);

  final WidgetTester tester;
  final _FlowServer server;
  final Set<String> blockedIds;
  final _FakeUserSettings settings;
  final _FakeFriendRepository friends = _FakeFriendRepository();

  Future<void> open(IarContext target, {Locale locale = kTestLocale}) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.example.test/v1'))
      ..httpClientAdapter = server;
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          instanceRuntimeConfigOverride(),
          advancedPreferencesProvider.overrideWithValue(
            const AdvancedPreferencesState(),
          ),
          appearancePreferencesProvider.overrideWithValue(
            const AppearancePreferencesState(),
          ),
          androidAnimatorDurationDisabledProvider.overrideWith(
            (ref) => Stream<bool>.value(false),
          ),
          userSettingsViewModelProvider.overrideWith(() => settings),
          webauthnCredentialsViewModelProvider.overrideWithValue(
            const WebauthnCredentialsViewState(),
          ),
          use12HourTimeFormatProvider.overrideWithValue(false),
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          contextualGuildIdProvider.overrideWithValue(null),
          instanceFeatureEnabledProvider(
            LimitKeys.featureGlobalExpressions,
          ).overrideWithValue(false),
          isMessageSavedProvider(
            '222222222222222222',
          ).overrideWith((ref) => Stream.value(false)),
          favoriteMemesProvider.overrideWith(
            (ref) => Stream<List<FavoriteMeme>>.value(const <FavoriteMeme>[]),
          ),
          messageTranslationAvailableProvider.overrideWith(
            (ref) => Future<bool>.value(false),
          ),
          reportFlowRepositoryProvider.overrideWithValue(
            ReportFlowRepository(dio),
          ),
          blockedUserIdsProvider.overrideWithValue(blockedIds),
          friendRepositoryProvider.overrideWithValue(friends),
        ],
        child: MaterialApp(
          locale: locale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: TextButton(
                  onPressed: () => openReportFlow(context, iarContext: target),
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await settle();
  }

  Future<void> settle() async {
    for (int i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    await tester.pumpAndSettle();
  }

  Future<void> tapKey(String key) async {
    final Finder finder = find.byKey(ValueKey<String>(key));
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await settle();
  }

  Future<void> option(String id) => tapKey('report-flow-option-$id');

  Future<void> item(String id) => tapKey('report-flow-item-$id');

  Future<void> next() => tapKey('report-flow-next');

  Future<void> back() => tapKey('report-flow-back');

  Future<void> submit() => tapKey('report-flow-submit');

  Future<void> act(Map<String, Object> action) async {
    final Object? optionId = action['option_id'];
    final Object? itemIds = action['item_ids'];
    if (optionId is String) {
      await option(optionId);
    } else if (itemIds is List<String>) {
      for (final String itemId in itemIds) {
        await item(itemId);
      }
      await next();
    } else {
      await next();
    }
  }

  List<ToastEntry> toasts() => ProviderScope.containerOf(
    tester.element(find.byType(Scaffold).first),
  ).read(toastProvider);

  bool buttonEnabled(String key) {
    final FluxerButton button = tester.widget<FluxerButton>(
      find.byKey(ValueKey<String>(key)),
    );
    return button.onPressed != null;
  }
}

List<String> _optionKeys(WidgetTester tester) {
  return find
      .byWidgetPredicate(
        (Widget widget) =>
            widget.key is ValueKey<String> &&
            (widget.key! as ValueKey<String>).value.startsWith(
              'report-flow-option-',
            ),
      )
      .evaluate()
      .map(
        (Element element) => (element.widget.key! as ValueKey<String>).value
            .substring('report-flow-option-'.length),
      )
      .toList();
}

ScrollPosition _sheetScroll(WidgetTester tester, String title) => tester
    .state<ScrollableState>(
      find
          .ancestor(of: find.text(title), matching: find.byType(Scrollable))
          .first,
    )
    .position;

List<String> _mockLaunches(WidgetTester tester) {
  const MethodChannel channel = MethodChannel(
    'plugins.flutter.io/url_launcher',
  );
  final List<String> launched = <String>[];
  tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
    MethodCall call,
  ) async {
    if (call.method == 'launch') {
      launched.add((call.arguments as Map<Object?, Object?>)['url']! as String);
    }
    return true;
  });
  addTearDown(
    () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      null,
    ),
  );
  return launched;
}

Finder _iconIn(String optionId, IconData icon) => find.descendant(
  of: find.byKey(ValueKey<String>('report-flow-option-$optionId')),
  matching: find.byWidgetPredicate(
    (Widget widget) => widget is PhosphorIcon && widget.icon == icon,
  ),
);

void main() {
  final FluxerLocalizations l10n = testL10n;

  group('every walk', () {
    for (final ReportFlowTestWalk walk in <ReportFlowTestWalk>[
      ...messageTestWalks,
      ...userTestWalks,
    ]) {
      messageItemTestWidgets(walk.name, (tester) async {
        final _Harness harness = _Harness(tester);
        await harness.open(_targetFor(walk.target));
        for (final Map<String, Object> action in walk.actions) {
          await harness.act(action);
        }

        switch (walk.ending) {
          case ReportFlowTestEnding.submitted:
            expect(find.text(l10n.reportFlowSummaryTitle), findsOneWidget);
            expect(
              find.text(l10n.reportFlowUrgentBanner),
              walk.urgent ? findsOneWidget : findsNothing,
            );
            expect(
              find.text(
                walk.target == ReportFlowTargetType.message
                    ? l10n.reportFlowSelectedMessage
                    : l10n.reportFlowSelectedUser,
              ),
              findsOneWidget,
            );
            for (final String label
                in walk.categoryLabels ?? const <String>[]) {
              expect(find.text(label), findsWidgets);
            }
            expect(harness.server.posts, isEmpty);
            await harness.submit();
            final _Post post = harness.server.posts.single;
            expect(
              post.path,
              '/reports/flows/${walk.target.wireValue}/submissions',
            );
            expect(post.body['steps'], walk.postedSteps);
            expect(post.body['locale'], 'en-US');
            expect(
              post.body['revision_hash'],
              loadReportFlowFixture(walk.target).revisionHash,
            );
            expect(find.text(l10n.reportFlowThankYouTitle), findsOneWidget);
            expect(
              find.text(l10n.reportFlowThankYouBody('Fluxer')),
              findsOneWidget,
            );
          case ReportFlowTestEnding.thanks:
            expect(
              find.text(l10n.reportFlowThankYouNoReportTitle),
              findsOneWidget,
            );
            expect(find.text(l10n.reportFlowThankYouTitle), findsNothing);
            expect(
              find.text(l10n.reportFlowThankYouNoReportBody),
              walk.shortThanks ? findsNothing : findsOneWidget,
            );
            expect(
              find.text(l10n.reportFlowThankYouNoReportBodyShort),
              walk.shortThanks ? findsOneWidget : findsNothing,
            );
            expect(harness.server.posts, isEmpty);
          case ReportFlowTestEnding.notice:
            expect(find.text("We can't act on this yet"), findsOneWidget);
            expect(
              find.byKey(const ValueKey<String>('report-flow-done')),
              findsOneWidget,
            );
            expect(
              find.byKey(const ValueKey<String>('report-flow-back')),
              findsNothing,
            );
            expect(harness.server.posts, isEmpty);
        }
        if (walk.ending != ReportFlowTestEnding.submitted) {
          await harness.tapKey('report-flow-done');
          expect(find.text(l10n.reportFlowThankYouTitle), findsNothing);
          expect(find.text(l10n.reportFlowThankYouNoReportTitle), findsNothing);
          expect(harness.server.posts, isEmpty);
        }
      });
    }
  });

  group('message screens', () {
    messageItemTestWidgets('S1 shows the preview and every row in order', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));

      expect(harness.server.gets, <String>['/reports/flows/message']);
      expect(harness.server.getQueries.single, <String, Object>{
        'surface': 'in_app',
        'locale': 'en-US',
      });
      expect(find.text('Report message'), findsOneWidget);
      expect(
        find.text(
          'Pick the closest match. You can check everything before it is sent.',
        ),
        findsOneWidget,
      );
      expect(find.byType(MessageItem), findsOneWidget);
      expect(_optionKeys(tester), <String>[
        'abuse',
        'private_info',
        'violence_misinfo',
        'spam',
        'something_else',
        'dislike',
        'dsa',
      ]);
      expect(_iconIn('dsa', PhosphorIconsBold.arrowSquareOut), findsOneWidget);
      expect(_iconIn('spam', PhosphorIconsBold.caretRight), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-back')),
        findsNothing,
      );

      await harness.option('abuse');
      expect(find.byType(MessageItem), findsNothing);
      expect(
        find.byKey(const ValueKey<String>('report-flow-back')),
        findsOneWidget,
      );
      await harness.back();
      expect(find.text('Report message'), findsOneWidget);
    });

    messageItemTestWidgets('S6 Next waits for a tick and Back keeps ticks', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('private_info');

      expect(harness.buttonEnabled('report-flow-next'), isFalse);
      await harness.item('email');
      expect(harness.buttonEnabled('report-flow-next'), isTrue);
      await harness.item('phone');
      await harness.next();
      expect(find.text('Email address'), findsOneWidget);
      expect(find.text('Phone number'), findsOneWidget);
      expect(find.text('Email address, Phone number'), findsNothing);

      await harness.back();
      final Iterable<Checkbox> boxes = tester.widgetList<Checkbox>(
        find.byType(Checkbox),
      );
      expect(boxes.where((Checkbox box) => box.value ?? false), hasLength(2));
      expect(harness.buttonEnabled('report-flow-next'), isTrue);
    });

    messageItemTestWidgets('a checklist answer lists one item per row', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('private_info');
      await harness.item('legal_name');
      await harness.item('address');
      await harness.item('threat_to_share');
      await harness.next();

      expect(find.text(l10n.reportFlowSummaryTitle), findsOneWidget);
      for (final String label in <String>[
        "Sharing someone's private details",
        'Real or legal name',
        'Home address or workplace',
        'They are threatening to share it',
      ]) {
        expect(find.text(label), findsOneWidget);
      }
    });

    messageItemTestWidgets('a long preview scrolls inside its frame', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(
        IarMessageContext(
          message: _message(
            content: List<String>.generate(
              40,
              (int index) => 'Line ${index + 1} of a long post.',
            ).join('\n\n'),
          ),
          guildId: null,
        ),
      );

      final Finder scrollbar = find.byType(Scrollbar);
      expect(scrollbar, findsOneWidget);
      expect(tester.widget<Scrollbar>(scrollbar).thumbVisibility, isTrue);
      final ScrollPosition preview = tester
          .state<ScrollableState>(
            find.descendant(of: scrollbar, matching: find.byType(Scrollable)),
          )
          .position;
      expect(preview.maxScrollExtent, greaterThan(0));
      expect(tester.getSize(scrollbar).height, lessThanOrEqualTo(220));
    });

    for (final Locale locale in const <Locale>[
      Locale('en'),
      Locale('de'),
      Locale('ar'),
    ]) {
      messageItemTestWidgets(
        'a $locale step opens at the top after the last one was scrolled',
        (tester) async {
          final _Harness harness = _Harness(tester);
          await harness.open(
            _targetFor(ReportFlowTargetType.message),
            locale: locale,
          );
          await harness.option('something_else');
          await tester.ensureVisible(
            find.byKey(const ValueKey<String>('report-flow-option-other')),
          );
          await tester.pumpAndSettle();
          expect(
            _sheetScroll(tester, 'What else is going on?').pixels,
            greaterThan(0),
          );

          await harness.option('self_harm');

          const String title = 'What did they say or share?';
          expect(find.text(title), findsOneWidget);
          expect(_sheetScroll(tester, title).pixels, 0);
        },
      );
    }

    messageItemTestWidgets('the crisis line opens without a link warning', (
      tester,
    ) async {
      final List<String> launched = _mockLaunches(tester);
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('something_else');
      await harness.option('self_harm');
      await harness.option('crisis_lines');

      expect(find.byType(ExternalLinkWarningSheet), findsNothing);
      expect(launched, <String>['https://befrienders.org']);
      expect(find.text('What did they say or share?'), findsOneWidget);
    });

    messageItemTestWidgets('the urgent banner shows on an urgent screen', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('abuse');
      expect(find.text(l10n.reportFlowUrgentBanner), findsNothing);
      await harness.option('sexual');
      expect(find.text(l10n.reportFlowUrgentBanner), findsOneWidget);
    });

    messageItemTestWidgets('the summary links the community guidelines', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');

      expect(find.text(l10n.reportFlowCommunityGuidelinesLink), findsOneWidget);
      expect(find.text(l10n.reportFlowDisclaimerNoLink), findsNothing);
    });

    messageItemTestWidgets(
      'the summary guidelines link opens without a link warning',
      (tester) async {
        final List<String> launched = _mockLaunches(tester);
        final _Harness harness = _Harness(tester);
        await harness.open(_targetFor(ReportFlowTargetType.message));
        await harness.option('spam');

        await tester.tap(find.text(l10n.reportFlowCommunityGuidelinesLink));
        await tester.pumpAndSettle();

        expect(find.byType(ExternalLinkWarningSheet), findsNothing);
        expect(launched, <String>[
          'http://localhost:8088/marketing/guidelines',
        ]);
      },
    );

    messageItemTestWidgets(
      'without a guidelines page the disclaimer has no link',
      (tester) async {
        final Map<String, Object?> json =
            jsonDecode(
                  File(
                    'test/fixtures/report_flows/message_in_app.json',
                  ).readAsStringSync(),
                )
                as Map<String, Object?>;
        json['guidelines_url'] = null;
        final _Harness harness = _Harness(
          tester,
          server: _FlowServer(
            flowBodies: <String, String>{
              '/reports/flows/message': jsonEncode(json),
            },
          ),
        );
        await harness.open(_targetFor(ReportFlowTargetType.message));
        await harness.option('spam');

        expect(find.text(l10n.reportFlowDisclaimerNoLink), findsOneWidget);
        expect(find.text(l10n.reportFlowCommunityGuidelinesLink), findsNothing);
      },
    );
  });

  group('UI locale', () {
    const Map<String, (Locale, String)> cases = <String, (Locale, String)>{
      'Traditional Chinese': (
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        'zh-TW',
      ),
      'Latin American Spanish': (Locale('es', '419'), 'es-419'),
    };
    for (final MapEntry<String, (Locale, String)> entry in cases.entries) {
      final (Locale locale, String wireValue) = entry.value;
      messageItemTestWidgets(
        'a ${entry.key} UI loads and submits the flow as $wireValue',
        (tester) async {
          final _Harness harness = _Harness(tester);
          await harness.open(
            _targetFor(ReportFlowTargetType.message),
            locale: locale,
          );

          expect(harness.server.getQueries.single, <String, Object>{
            'surface': 'in_app',
            'locale': wireValue,
          });
          await harness.option('spam');
          await harness.submit();

          expect(harness.server.posts.single.body['locale'], wireValue);
        },
      );
    }
  });

  group('user profile screens', () {
    messageItemTestWidgets('P1 intro, P2 checklist and Back to the intro', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_profile);

      expect(harness.server.gets, <String>['/reports/flows/user']);
      expect(find.text('Report profile'), findsOneWidget);
      expect(find.text(l10n.reportFlowSelectedUser), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('alice#8885'), findsOneWidget);
      expect(find.text('Learn more'), findsOneWidget);
      expect(_optionKeys(tester), <String>['learn_more']);
      expect(
        _iconIn('learn_more', PhosphorIconsBold.arrowSquareOut),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey<String>('report-flow-back')),
        findsNothing,
      );
      expect(harness.buttonEnabled('report-flow-next'), isTrue);

      await harness.next();
      expect(
        find.text('Which parts of their profile are a problem?'),
        findsOneWidget,
      );
      expect(find.text('What they use as avatar and banner'), findsOneWidget);
      expect(harness.buttonEnabled('report-flow-next'), isFalse);

      await harness.back();
      expect(find.text(l10n.reportFlowSelectedUser), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-back')),
        findsNothing,
      );
    });

    messageItemTestWidgets('P3 rows are in order with the DSA link last', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_profile);
      await harness.next();
      await harness.item('photo');
      await harness.next();

      expect(find.text("What's wrong with their profile?"), findsOneWidget);
      expect(_optionKeys(tester), <String>[
        'abuse',
        'hate_violence',
        'impersonation',
        'spam',
        'something_else',
        'dsa',
      ]);
    });
  });

  group('thank-you screen', () {
    messageItemTestWidgets('Block turns into Blocked', (tester) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('dislike');

      expect(find.text(l10n.reportFlowMoreYouCanDo), findsOneWidget);
      expect(find.text(l10n.reportFlowBlockName('Alice')), findsOneWidget);
      await tester.tap(find.text(l10n.reportFlowBlockButton));
      await harness.settle();
      await tester.tap(
        find.widgetWithText(FluxerButton, l10n.userProfileBlockUser),
      );
      await harness.settle();

      expect(harness.friends.blocked, <String>[_authorId]);
      expect(find.text(l10n.reportFlowBlockedButton), findsOneWidget);
      expect(find.text(l10n.reportFlowBlockButton), findsNothing);
    });

    for (final Locale locale in const <Locale>[
      Locale('en'),
      Locale('de'),
      Locale('ar'),
    ]) {
      messageItemTestWidgets(
        'a $locale no-report ending past the first screen uses the short body',
        (tester) async {
          final FluxerLocalizations strings = lookupFluxerLocalizations(locale);
          final _Harness harness = _Harness(tester);
          await harness.open(
            _targetFor(ReportFlowTargetType.message),
            locale: locale,
          );
          await harness.option('abuse');
          await harness.option('rude_language');

          expect(
            find.text(strings.reportFlowThankYouNoReportBodyShort),
            findsOneWidget,
          );
          expect(
            find.text(strings.reportFlowThankYouNoReportBody),
            findsNothing,
          );
          expect(
            strings.reportFlowThankYouNoReportBody,
            startsWith(strings.reportFlowThankYouNoReportBodyShort),
          );
        },
      );
    }

    messageItemTestWidgets('a webhook author gets no Block row', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(
        IarMessageContext(
          message: _message(webhookId: _webhookId, authorIsBot: true),
          guildId: null,
        ),
      );
      await harness.option('dislike');

      expect(find.text(l10n.reportFlowThankYouNoReportBody), findsOneWidget);
      expect(find.text(l10n.reportFlowMoreYouCanDo), findsNothing);
    });

    messageItemTestWidgets('a bot author keeps the Block row', (tester) async {
      final _Harness harness = _Harness(tester);
      await harness.open(
        IarMessageContext(message: _message(authorIsBot: true), guildId: null),
      );
      await harness.option('dislike');

      expect(find.text(l10n.reportFlowBlockName('Alice')), findsOneWidget);
      await tester.tap(find.text(l10n.reportFlowBlockButton));
      await harness.settle();
      await tester.tap(
        find.widgetWithText(FluxerButton, l10n.userProfileBlockUser),
      );
      await harness.settle();

      expect(harness.friends.blocked, <String>[_authorId]);
      expect(find.text(l10n.reportFlowBlockedButton), findsOneWidget);
    });

    messageItemTestWidgets('an already blocked user gets no Block row', (
      tester,
    ) async {
      final _Harness harness = _Harness(
        tester,
        blockedIds: <String>{_authorId},
      );
      await harness.open(_profile);
      await harness.next();
      await harness.item('name');
      await harness.next();
      await harness.option('spam');
      await harness.option('spam_profile');
      await harness.submit();

      expect(find.text(l10n.reportFlowThankYouBody('Fluxer')), findsOneWidget);
      expect(find.text(l10n.reportFlowMoreYouCanDo), findsNothing);
    });
  });

  group('webhook and bot messages', () {
    messageItemTestWidgets(
      'a webhook message shows the webhook and files a report without Block',
      (tester) async {
        final _Harness harness = _Harness(tester);
        await harness.open(
          IarMessageContext(
            message: _message(webhookId: _webhookId, authorIsBot: true),
            guildId: null,
          ),
        );

        final Finder preview = find.byType(MessageItem);
        expect(
          find.descendant(of: preview, matching: find.text('Harbor Bulletin')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: preview,
            matching: find.text(l10n.userTagBot.toUpperCase()),
          ),
          findsOneWidget,
        );

        await harness.option('spam');
        expect(find.text('Harbor Bulletin'), findsOneWidget);
        await harness.submit();

        final _Post post = harness.server.posts.single;
        expect(post.path, '/reports/flows/message/submissions');
        expect(post.body['channel_id'], '111111111111111111');
        expect(post.body['message_id'], '222222222222222222');
        expect(
          find.text(l10n.reportFlowThankYouBody('Fluxer')),
          findsOneWidget,
        );
        expect(find.text(l10n.reportFlowMoreYouCanDo), findsNothing);
        expect(harness.friends.blocked, isEmpty);
      },
    );

    messageItemTestWidgets(
      'a bot message shows the bot tag and offers Block after filing',
      (tester) async {
        final _Harness harness = _Harness(tester);
        await harness.open(
          IarMessageContext(
            message: _message(authorIsBot: true),
            guildId: null,
          ),
        );

        final Finder preview = find.byType(MessageItem);
        expect(
          find.descendant(of: preview, matching: find.text('Alice')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: preview,
            matching: find.text(l10n.userTagBot.toUpperCase()),
          ),
          findsOneWidget,
        );

        await harness.option('spam');
        await harness.submit();

        expect(
          harness.server.posts.single.body['message_id'],
          '222222222222222222',
        );
        expect(
          find.text(l10n.reportFlowThankYouBody('Fluxer')),
          findsOneWidget,
        );
        expect(find.text(l10n.reportFlowBlockName('Alice')), findsOneWidget);
      },
    );

    test('only a user author can be blocked', () {
      expect(
        IarMessageContext(message: _message(), guildId: null).blockableUserId,
        _authorId,
      );
      expect(
        IarMessageContext(
          message: _message(authorIsBot: true),
          guildId: null,
        ).blockableUserId,
        _authorId,
      );
      expect(
        IarMessageContext(
          message: _message(webhookId: _webhookId, authorIsBot: true),
          guildId: null,
        ).blockableUserId,
        isNull,
      );
      expect(_profile.blockableUserId, _authorId);
    });
  });

  group('errors', () {
    messageItemTestWidgets('already reported turns Submit into Done', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      harness.server.replies.add(
        const _Reply(409, <String, Object>{
          'code': 'CONFLICT',
          'message': 'Conflict.',
        }),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');
      await harness.submit();

      expect(find.text(l10n.reportFlowAlreadyReported), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-submit')),
        findsNothing,
      );
      await harness.tapKey('report-flow-done');
      expect(find.text(l10n.reportFlowSummaryTitle), findsNothing);
    });

    messageItemTestWidgets('an already reported profile names the profile', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      harness.server.replies.add(
        const _Reply(409, <String, Object>{
          'code': 'CONFLICT',
          'message': 'Conflict.',
        }),
      );
      await harness.open(_profile);
      await harness.next();
      await harness.item('name');
      await harness.next();
      await harness.option('spam');
      await harness.option('spam_profile');
      await harness.submit();

      expect(find.text(l10n.reportFlowAlreadyReportedProfile), findsOneWidget);
    });

    messageItemTestWidgets('rate limits show an inline note', (tester) async {
      final _Harness harness = _Harness(tester);
      harness.server.replies.add(
        const _Reply(429, <String, Object>{
          'code': 'RATE_LIMITED',
          'message': 'Slow down.',
          'retry_after': 1,
        }),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');
      await harness.submit();

      expect(find.text(l10n.reportFlowRateLimited), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-submit')),
        findsOneWidget,
      );
    });

    messageItemTestWidgets('rule rejections show the API message', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      harness.server.replies.add(
        const _Reply(400, <String, Object>{
          'code': 'CANNOT_REPORT_OWN_MESSAGE',
          'message': 'You cannot report your own message.',
        }),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');
      await harness.submit();

      expect(find.text('You cannot report your own message.'), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-submit')),
        findsNothing,
      );
      expect(
        find.byKey(const ValueKey<String>('report-flow-done')),
        findsOneWidget,
      );
    });

    messageItemTestWidgets('a deleted message ends with Done', (tester) async {
      final _Harness harness = _Harness(tester);
      harness.server.replies.add(
        const _Reply(404, <String, Object>{
          'code': 'UNKNOWN_MESSAGE',
          'message': 'Unknown message',
        }),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');
      await harness.submit();

      expect(find.text('Unknown message'), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-submit')),
        findsNothing,
      );
      await harness.tapKey('report-flow-done');
      expect(find.text(l10n.reportFlowSummaryTitle), findsNothing);
      expect(harness.server.posts, hasLength(1));
    });

    messageItemTestWidgets('an outdated form refetches and restarts', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      harness.server.replies.add(
        const _Reply(409, <String, Object>{
          'code': 'REPORT_FLOW_OUTDATED',
          'message': 'Outdated.',
        }),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('abuse');
      await harness.option('threat');
      await harness.option('violent_threat');
      await harness.submit();

      expect(harness.server.gets, hasLength(2));
      expect(
        harness.toasts().map((ToastEntry entry) => entry.toast.message),
        contains(l10n.reportFlowOutdated),
      );
      expect(find.text('Report message'), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('report-flow-back')),
        findsNothing,
      );
    });

    messageItemTestWidgets('reopening after a load failure loads again', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      harness.server.failingLoads = 1;
      await harness.open(_profile);
      expect(find.text(l10n.reportFlowLoadFailed), findsOneWidget);

      Navigator.of(tester.element(find.text(l10n.reportFlowLoadFailed))).pop();
      await harness.settle();
      await tester.tap(find.text('open'));
      await harness.settle();

      expect(harness.server.gets, hasLength(2));
      expect(find.text(l10n.reportFlowLoadFailed), findsNothing);
      expect(find.text(l10n.reportFlowSelectedUser), findsOneWidget);
    });

    messageItemTestWidgets('a loaded flow is reused when reopened', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester);
      await harness.open(_profile);
      expect(find.text(l10n.reportFlowSelectedUser), findsOneWidget);

      Navigator.of(
        tester.element(find.text(l10n.reportFlowSelectedUser)),
      ).pop();
      await harness.settle();
      await tester.tap(find.text('open'));
      await harness.settle();

      expect(harness.server.gets, hasLength(1));
      expect(find.text(l10n.reportFlowSelectedUser), findsOneWidget);
    });

    messageItemTestWidgets('a load failure offers Try again', (tester) async {
      final _Harness harness = _Harness(tester);
      harness.server.failingLoads = 1;
      await harness.open(_profile);

      expect(find.text(l10n.reportFlowLoadFailed), findsOneWidget);
      expect(find.text('Report profile'), findsOneWidget);
      await tester.tap(find.text(l10n.reportFlowTryAgain));
      await harness.settle();

      expect(harness.server.gets, hasLength(2));
      expect(find.text(l10n.reportFlowSelectedUser), findsOneWidget);
    });
  });

  group('account gate', () {
    const ValueKey<String> submitKey = ValueKey<String>('report-flow-submit');

    messageItemTestWidgets('an unclaimed account is blocked with no POST', (
      tester,
    ) async {
      final _Harness harness = _Harness(tester, account: _account());
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');

      expect(find.text(l10n.reportFlowAccountSetupRequired), findsOneWidget);
      expect(find.text(l10n.claimAccount), findsOneWidget);
      expect(harness.buttonEnabled('report-flow-submit'), isFalse);
      await harness.submit();
      expect(harness.server.posts, isEmpty);
      expect(find.text(l10n.reportFlowSummaryTitle), findsOneWidget);

      await harness.tapKey('report-flow-account-setup');
      expect(find.byType(ClaimAccountSheet), findsOneWidget);
      expect(harness.server.posts, isEmpty);
    });

    messageItemTestWidgets('the unverified notice opens security settings', (
      tester,
    ) async {
      final _Harness harness = _Harness(
        tester,
        account: _account(email: _accountEmail),
      );
      await harness.open(_profile);
      await harness.next();
      await harness.item('name');
      await harness.next();
      await harness.option('spam');
      await harness.option('spam_profile');

      expect(find.text(l10n.reportFlowAccountSetupRequired), findsOneWidget);
      expect(find.text(l10n.channelComposerBarrierVerifyEmail), findsOneWidget);
      expect(harness.buttonEnabled('report-flow-submit'), isFalse);
      await harness.submit();
      expect(harness.server.posts, isEmpty);

      await harness.tapKey('report-flow-account-setup');
      expect(find.byType(UserSecurityLogin), findsOneWidget);
    });

    messageItemTestWidgets('a claimed and verified account submits', (
      tester,
    ) async {
      final _Harness harness = _Harness(
        tester,
        account: _account(email: _accountEmail, verified: true),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');

      expect(find.text(l10n.reportFlowAccountSetupRequired), findsNothing);
      await harness.submit();
      expect(harness.server.posts, hasLength(1));
      expect(find.text(l10n.reportFlowThankYouTitle), findsOneWidget);
    });

    messageItemTestWidgets('Submit unlocks once the account is verified', (
      tester,
    ) async {
      final _Harness harness = _Harness(
        tester,
        account: _account(email: _accountEmail),
      );
      await harness.open(_targetFor(ReportFlowTargetType.message));
      await harness.option('spam');
      expect(harness.buttonEnabled('report-flow-submit'), isFalse);

      harness.settings.account = _account(email: _accountEmail, verified: true);
      await harness.settle();

      expect(find.text(l10n.reportFlowAccountSetupRequired), findsNothing);
      await harness.submit();
      expect(harness.server.posts, hasLength(1));
      expect(find.text(l10n.reportFlowThankYouTitle), findsOneWidget);
    });

    messageItemTestWidgets(
      'a restriction that loads before the tap stops the submission',
      (tester) async {
        final _Harness harness = _Harness(tester);
        await harness.open(_targetFor(ReportFlowTargetType.message));
        await harness.option('spam');
        expect(harness.buttonEnabled('report-flow-submit'), isTrue);

        harness.settings.account = _account();
        await tester.tap(find.byKey(submitKey));
        await harness.settle();

        expect(harness.server.posts, isEmpty);
        expect(find.text(l10n.reportFlowAccountSetupRequired), findsOneWidget);
        expect(harness.buttonEnabled('report-flow-submit'), isFalse);
      },
    );

    for (final (String code, int status, String action)
        in <(String, int, String)>[
          (
            'REPORT_EMAIL_VERIFICATION_REQUIRED',
            403,
            l10n.channelComposerBarrierVerifyEmail,
          ),
          ('UNCLAIMED_ACCOUNT_CANNOT_SUBMIT_REPORTS', 400, l10n.claimAccount),
        ]) {
      messageItemTestWidgets(
        'an unknown profile posts and $code shows the notice',
        (tester) async {
          final _Harness harness = _Harness(tester);
          harness.server.replies.add(
            _Reply(status, <String, Object>{
              'code': code,
              'message': 'Finish setting up your account.',
            }),
          );
          await harness.open(_targetFor(ReportFlowTargetType.message));
          await harness.option('spam');
          expect(find.text(l10n.reportFlowAccountSetupRequired), findsNothing);

          await harness.submit();

          expect(harness.server.posts, hasLength(1));
          expect(find.text(l10n.reportFlowSummaryTitle), findsOneWidget);
          expect(
            find.text(l10n.reportFlowAccountSetupRequired),
            findsOneWidget,
          );
          expect(find.text(action), findsOneWidget);
          expect(find.text('Finish setting up your account.'), findsNothing);
          expect(find.text(l10n.reportFlowSubmitFailed), findsNothing);
          expect(harness.buttonEnabled('report-flow-submit'), isTrue);

          await harness.submit();
          expect(harness.server.posts, hasLength(2));
          expect(find.text(l10n.reportFlowThankYouTitle), findsOneWidget);
        },
      );
    }
  });

  group('DSA link prefill', () {
    test('a message report links the message', () {
      expect(
        reportFlowLinkUrl(
          'http://localhost:8088/report',
          IarMessageContext(message: _message(), guildId: '333'),
        ),
        'http://localhost:8088/report?type=message&message_link=http%3A%2F%2Flocalhost%3A8088%2Fchannels%2F333%2F111111111111111111%2F222222222222222222',
      );
      expect(
        Uri.parse(
          reportFlowLinkUrl(
            'https://web.fluxer.app/report',
            IarMessageContext(message: _message(), guildId: null),
          ),
        ).queryParameters['message_link'],
        'https://web.fluxer.app/channels/@me/111111111111111111/222222222222222222',
      );
    });

    test('a profile report passes the user id', () {
      expect(
        reportFlowLinkUrl('https://web.fluxer.app/report', _profile),
        'https://web.fluxer.app/report?type=user&user_id=$_authorId',
      );
    });

    test('other links open as served', () {
      expect(
        reportFlowLinkUrl('https://befrienders.org', _profile),
        'https://befrienders.org',
      );
    });
  });
}
