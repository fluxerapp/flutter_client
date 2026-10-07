@Tags(<String>['slow'])
library;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/moderation/data/report_flow_repository.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/domain/report_restriction.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/moderation/providers/report_flow_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../helpers/instance_runtime_config_override.dart';
import '../helpers/message_item_test_overrides.dart';
import '../helpers/open_test_database.dart';
import '../helpers/test_l10n.dart';

final String? _harnessUrl = Platform.environment['HARNESS_API_URL'];

const ValueKey<String> _submitKey = ValueKey<String>('report-flow-submit');
const ValueKey<String> _noticeKey = ValueKey<String>(
  'report-flow-account-notice',
);

class _Account {
  _Account(Map<String, dynamic> json, {this.inGuild = true})
    : userId = json['user_id'] as String,
      token = json['token'] as String;

  final bool inGuild;

  final String userId;
  final String token;
}

class _GatedAccount {
  const _GatedAccount(this.label, this.restriction, this.action);

  final String label;
  final ReportRestriction restriction;
  final String Function(FluxerLocalizations l10n) action;
}

class _Seed {
  _Seed(Map<String, dynamic> json)
    : reporter = _Account(json['reporter'] as Map<String, dynamic>),
      unverified = _Account(
        json['unverified_reporter'] as Map<String, dynamic>,
      ),
      targetId = (json['target'] as Map<String, dynamic>)['user_id'] as String,
      guildId = (json['guild'] as Map<String, dynamic>)['guild_id'] as String;

  final _Account reporter;
  final _Account unverified;
  final String targetId;
  final String guildId;
}

class _LiveUserSettings extends UserSettingsViewModel {
  _LiveUserSettings(this._userId);

  final String _userId;

  @override
  UserSettingsViewState build() => UserSettingsViewState(
    userId: _userId,
    username: 'reporter',
    displayName: 'Reporter',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
  );
}

const MethodChannel _pathProvider = MethodChannel(
  'plugins.flutter.io/path_provider',
);

HttpClient _realHttpClient() {
  final HttpOverrides? overrides = HttpOverrides.current;
  HttpOverrides.global = null;
  try {
    return HttpClient();
  } finally {
    HttpOverrides.global = overrides;
  }
}

Dio _liveDio(String baseUrl, {String? token}) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      persistentConnection: false,
      headers: <String, Object>{'authorization': ?token},
    ),
  )..httpClientAdapter = IOHttpClientAdapter(createHttpClient: _realHttpClient);
}

final Dio _harness = _liveDio(_harnessUrl ?? '');

class _Run {
  _Run(this.tester, this.seed, this.account) {
    dio = _liveDio('$_harnessUrl/v1', token: account.token);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (options.method == 'POST') {
            posts.add(options.path);
          }
          handler.next(options);
        },
      ),
    );
  }

  final WidgetTester tester;
  final _Seed seed;
  final _Account account;
  late final Dio dio;
  final List<String> posts = <String>[];

  Future<T> live<T>(Future<T> Function() body) async {
    final T? result = await tester.runAsync(body);
    return result as T;
  }

  Future<List<Map<String, dynamic>>> reports() {
    return live(() async {
      final Response<Map<String, dynamic>> response = await _harness
          .get<Map<String, dynamic>>(
            '/__harness/reports',
            queryParameters: <String, String>{'reporter_id': account.userId},
          );
      return (response.data!['reports'] as List<dynamic>)
          .cast<Map<String, dynamic>>();
    });
  }

  UserSettingsViewModel get _settings => ProviderScope.containerOf(
    tester.element(find.text('open')),
  ).read(userSettingsViewModelProvider.notifier);

  Future<ReportRestriction?> loadProfile() async {
    final UserSettingsViewModel settings = _settings;
    await live(settings.loadProfile);
    await tester.pumpAndSettle();
    return getReportRestriction(
      ProviderScope.containerOf(
        tester.element(find.text('open')),
      ).read(userSettingsViewModelProvider),
    );
  }

  Future<void> pump() async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
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
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          contextualGuildIdProvider.overrideWithValue(null),
          fluxerClientProvider.overrideWithValue(
            FluxerClient(dio, baseUrl: dio.options.baseUrl),
          ),
          reportFlowRepositoryProvider.overrideWithValue(
            ReportFlowRepository(dio),
          ),
          userSettingsViewModelProvider.overrideWith(
            () => _LiveUserSettings(account.userId),
          ),
          blockedUserIdsProvider.overrideWithValue(const <String>{}),
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
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: TextButton(
                  onPressed: () => openReportFlow(
                    context,
                    iarContext: IarUserContext(
                      userId: seed.targetId,
                      username: 'target',
                      displayName: 'Jordan Target',
                      avatarUrl: null,
                      guildId: account.inGuild ? seed.guildId : null,
                    ),
                  ),
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> waitFor(Finder finder) async {
    for (int i = 0; i < 400 && finder.evaluate().isEmpty; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 25)),
      );
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(finder, findsWidgets);
    await tester.pumpAndSettle();
  }

  Future<void> tapKey(String key) async {
    final Finder finder = find.byKey(ValueKey<String>(key));
    await waitFor(finder);
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> walkToSummary() async {
    await tester.tap(find.text('open'));
    await tapKey('report-flow-next');
    await tapKey('report-flow-item-name');
    await tapKey('report-flow-next');
    await tapKey('report-flow-option-spam');
    await tapKey('report-flow-option-spam_profile');
    await waitFor(find.byKey(_submitKey));
  }

  bool get submitEnabled =>
      tester.widget<FluxerButton>(find.byKey(_submitKey)).onPressed != null;
}

void main() {
  final bool skip = _harnessUrl == null || _harnessUrl!.isEmpty;
  final FluxerLocalizations l10n = testL10n;
  final Directory imageCache = Directory(
    'build/report_account_gate_live_cache',
  );
  late _Seed seed;
  late _Account unclaimed;

  setUpAll(() async {
    if (skip) {
      return;
    }
    TestWidgetsFlutterBinding.ensureInitialized();
    imageCache.createSync(recursive: true);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          _pathProvider,
          (MethodCall call) async => imageCache.path,
        );
    final Response<Map<String, dynamic>> response = await _harness
        .post<Map<String, dynamic>>(
          '/__harness/seed',
          data: <String, Object>{},
        );
    seed = _Seed(response.data!);
    final Response<Map<String, dynamic>> registered = await _harness
        .post<Map<String, dynamic>>(
          '/v1/auth/register',
          data: <String, Object>{
            'global_name': 'Unclaimed Reporter',
            'date_of_birth': '1990-01-01',
            'consent': true,
          },
        );
    unclaimed = _Account(registered.data!, inGuild: false);
  });

  tearDownAll(() {
    if (skip) {
      return;
    }
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_pathProvider, null);
    if (imageCache.existsSync()) {
      imageCache.deleteSync(recursive: true);
    }
  });

  group('report account gate against the harness API', () {
    for (final _GatedAccount gated in <_GatedAccount>[
      _GatedAccount(
        'an unverified',
        ReportRestriction.unverified,
        (l10n) => l10n.channelComposerBarrierVerifyEmail,
      ),
      _GatedAccount(
        'an unclaimed',
        ReportRestriction.unclaimed,
        (l10n) => l10n.claimAccount,
      ),
    ]) {
      _Account accountFor(ReportRestriction restriction) =>
          restriction == ReportRestriction.unclaimed
          ? unclaimed
          : seed.unverified;

      messageItemTestWidgets(
        '${gated.label} loaded profile blocks the summary with no POST',
        (tester) async {
          final _Run run = _Run(tester, seed, accountFor(gated.restriction));
          await run.pump();
          expect(await run.loadProfile(), gated.restriction);

          await run.walkToSummary();

          expect(find.byKey(_noticeKey), findsOneWidget);
          expect(
            find.text(l10n.reportFlowAccountSetupRequired),
            findsOneWidget,
          );
          expect(find.text(gated.action(l10n)), findsOneWidget);
          expect(run.submitEnabled, isFalse);
          await tester.tap(find.byKey(_submitKey));
          await tester.pumpAndSettle();
          expect(run.posts, isEmpty);
          expect(await run.reports(), isEmpty);
        },
        skip: skip,
      );

      messageItemTestWidgets(
        '${gated.label} unknown profile posts and the API rejection shows '
        'the notice',
        (tester) async {
          final _Run run = _Run(tester, seed, accountFor(gated.restriction));
          await run.pump();

          await run.walkToSummary();
          expect(find.byKey(_noticeKey), findsNothing);
          expect(run.submitEnabled, isTrue);

          await tester.tap(find.byKey(_submitKey));
          await run.waitFor(find.byKey(_noticeKey));

          expect(run.posts, <String>['/reports/flows/user/submissions']);
          expect(find.text(gated.action(l10n)), findsOneWidget);
          expect(find.text(l10n.reportFlowSummaryTitle), findsOneWidget);
          expect(await run.reports(), isEmpty);

          expect(await run.loadProfile(), gated.restriction);
          expect(run.submitEnabled, isFalse);
        },
        skip: skip,
      );
    }

    messageItemTestWidgets('a loaded verified profile submits the report', (
      tester,
    ) async {
      final _Run run = _Run(tester, seed, seed.reporter);
      await run.pump();
      expect(await run.loadProfile(), isNull);

      await run.walkToSummary();
      expect(find.byKey(_noticeKey), findsNothing);
      expect(run.submitEnabled, isTrue);

      await tester.tap(find.byKey(_submitKey));
      await run.waitFor(find.text(l10n.reportFlowThankYouTitle));

      expect(run.posts, <String>['/reports/flows/user/submissions']);
      final Map<String, dynamic> row = (await run.reports()).single;
      expect(row['reported_user_id'], seed.targetId);
    }, skip: skip);
  });
}
