import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' show Locale;

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/accept_language_interceptor.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';

class _RecordingAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];

  String? get lastAcceptLanguage =>
      requests.last.headers[kAcceptLanguageHeader] as String?;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{'ok': true}),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _IdleInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return const InstanceSelectorState(
      instanceUrl: 'https://a.example/api',
      status: InstanceDiscoveryStatus.success,
      recentInstances: <RecentInstance>[],
      requiresDiscovery: false,
    );
  }
}

ProviderContainer _container() {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      userSettingsStatusProvider.overrideWithValue(null),
      fluxerClientPropertiesProvider.overrideWithValue(
        buildFluxerClientProperties(),
      ),
      instanceSelectorProvider.overrideWith(_IdleInstanceSelector.new),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void _setSystemLocale(ProviderContainer container, Locale locale) {
  container.read(systemLocalesProvider.notifier).updateFromPlatform(<Locale>[
    locale,
  ]);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('sends the app locale as a language tag', () async {
    final Map<Locale, String> cases = <Locale, String>{
      const Locale('de'): 'de',
      const Locale('nb'): 'nb',
      const Locale('en', 'GB'): 'en-GB',
      const Locale('es', '419'): 'es-419',
      const Locale('pt', 'BR'): 'pt-BR',
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'):
          'zh-Hant',
    };
    for (final MapEntry<Locale, String> entry in cases.entries) {
      final _RecordingAdapter adapter = _RecordingAdapter();
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://a.example/api'))
        ..httpClientAdapter = adapter
        ..interceptors.add(
          AcceptLanguageInterceptor(readLocale: () => entry.key),
        );

      await dio.get<dynamic>('/users/@me');

      expect(adapter.lastAcceptLanguage, entry.value);
    }
  });

  test('keeps a header the request already sets', () async {
    final _RecordingAdapter adapter = _RecordingAdapter();
    int reads = 0;
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://a.example/api'))
      ..httpClientAdapter = adapter
      ..interceptors.add(
        AcceptLanguageInterceptor(
          readLocale: () {
            reads++;
            return const Locale('de');
          },
        ),
      );

    await dio.get<dynamic>(
      '/users/@me',
      options: Options(headers: <String, Object>{'accept-language': 'fr'}),
    );

    expect(adapter.lastAcceptLanguage, 'fr');
    expect(reads, 0);

    await dio.get<dynamic>('/users/@me');

    expect(adapter.lastAcceptLanguage, 'de');
    expect(reads, 1);
  });

  test('a locale change applies to the next request on the same Dio', () async {
    final ProviderContainer container = _container();
    _setSystemLocale(container, const Locale('de', 'DE'));
    final _RecordingAdapter adapter = _RecordingAdapter();
    final Dio dio = container.read(fluxerDioProvider)
      ..httpClientAdapter = adapter;

    await dio.get<dynamic>('/users/@me');
    expect(adapter.lastAcceptLanguage, 'de');

    _setSystemLocale(container, const Locale('sv', 'SE'));
    await dio.get<dynamic>('/users/@me');

    expect(adapter.lastAcceptLanguage, 'sv');
    expect(container.read(fluxerDioProvider), same(dio));
    expect(adapter.requests, hasLength(2));
  });

  test('a client held across a rebuild still sends the locale', () async {
    final ProviderContainer container = _container();
    _setSystemLocale(container, const Locale('de', 'DE'));
    final _RecordingAdapter adapter = _RecordingAdapter();
    final Dio held = container.read(authFluxerDioProvider)
      ..httpClientAdapter = adapter;

    container.invalidate(authFluxerDioProvider);
    expect(container.read(authFluxerDioProvider), isNot(same(held)));
    _setSystemLocale(container, const Locale('sv', 'SE'));

    await held.post<dynamic>('/auth/login', data: <String, Object>{});

    expect(adapter.lastAcceptLanguage, 'sv');
  });

  test('runs before every other interceptor on both clients', () async {
    final ProviderContainer container = _container();
    _setSystemLocale(container, const Locale('fr', 'FR'));

    for (final Dio dio in <Dio>[
      container.read(fluxerDioProvider),
      container.read(authFluxerDioProvider),
    ]) {
      final _RecordingAdapter adapter = _RecordingAdapter();
      dio.httpClientAdapter = adapter;
      final List<Interceptor> added = dio.interceptors
          .skip(Dio().interceptors.length)
          .toList();

      expect(added.first, isA<AcceptLanguageInterceptor>());
      expect(added.whereType<AcceptLanguageInterceptor>(), hasLength(1));
      expect(added.whereType<SessionAuthInterceptor>(), hasLength(1));

      await dio.post<dynamic>('/auth/register', data: <String, Object>{});

      expect(adapter.lastAcceptLanguage, 'fr');
    }
  });
}
