import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/utils/emoji_asset_cache.dart';
import 'package:fluxer_markdown/src/widgets/emoji_asset_image.dart';

final List<int> _svg = utf8.encode(
  '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1 1"> '
  '<rect width="1" height="1"/></svg>',
);

const String _grinning = 'https://test.invalid/1f600.svg';

const String _crying = 'https://test.invalid/1f622.svg';

class _FakeNetwork extends HttpOverrides {
  _FakeNetwork({this.statuses = const <int>[]});

  final List<int> statuses;
  final List<Uri> requests = <Uri>[];

  @override
  HttpClient createHttpClient(SecurityContext? context) => _FakeClient(this);

  _FakeResponse respond(Uri url) {
    final index = requests.length;
    requests.add(url);
    final status = index < statuses.length ? statuses[index] : HttpStatus.ok;
    return _FakeResponse(status, status == HttpStatus.ok ? _svg : const []);
  }
}

class _FakeClient implements HttpClient {
  _FakeClient(this.network);

  final _FakeNetwork network;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async =>
      _FakeRequest(network.respond(url));

  @override
  void close({bool force = false}) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeRequest implements HttpClientRequest {
  _FakeRequest(this.response);

  final _FakeResponse response;

  @override
  final HttpHeaders headers = _FakeHeaders();

  @override
  Future<HttpClientResponse> close() async => response;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeHeaders implements HttpHeaders {
  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeResponse implements HttpClientResponse {
  _FakeResponse(this.statusCode, this.body);

  @override
  final int statusCode;

  final List<int> body;

  @override
  Future<void> forEach(void Function(List<int>) action) async {
    if (body.isNotEmpty) {
      action(body);
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Widget _emoji(String url) => MaterialApp(
  home: CachedEmojiAssetImage(
    url: url,
    size: 22,
    fallback: const Text('fallback'),
  ),
);

void main() {
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  Directory? tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('emoji_bytes_cache_test');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'getTemporaryDirectory') {
            return tempDir?.path;
          }
          return null;
        });
  });

  tearDown(() async {
    HttpOverrides.global = null;
    await EmojiAssetCache.clearCacheForTesting();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    await tempDir?.delete(recursive: true);
    tempDir = null;
  });

  testWidgets('a second mount of a loaded emoji shows the image on its first '
      'frame', (tester) async {
    final network = _FakeNetwork();
    HttpOverrides.global = network;
    await tester.runAsync(() async {
      await EmojiAssetCache.clearCacheForTesting();
      final load = EmojiAssetCache.loadBytes(_grinning);
      await tester.pumpWidget(_emoji(_grinning));
      await load;
    });
    await tester.pumpWidget(const SizedBox());

    await tester.pumpWidget(_emoji(_grinning));

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(network.requests, hasLength(1));
  });

  testWidgets('the bytes cache evicts the least recently used emoji past its '
      'bound', (tester) async {
    HttpOverrides.global = _FakeNetwork();
    String url(int i) => 'https://test.invalid/$i.svg';
    await tester.runAsync(() async {
      await EmojiAssetCache.clearCacheForTesting();
      for (var i = 0; i < EmojiAssetCache.maxMemoryEntries; i++) {
        await EmojiAssetCache.loadBytes(url(i));
      }
      EmojiAssetCache.peekBytes(url(0));

      await EmojiAssetCache.loadBytes(url(EmojiAssetCache.maxMemoryEntries));
    });

    expect(EmojiAssetCache.peekBytes(url(0)), isNotNull);
    expect(EmojiAssetCache.peekBytes(url(1)), isNull);
    expect(EmojiAssetCache.peekBytes(url(2)), isNotNull);
  });

  testWidgets('a failed emoji load is retried on the next mount', (
    tester,
  ) async {
    final network = _FakeNetwork(statuses: <int>[HttpStatus.notFound]);
    HttpOverrides.global = network;
    await tester.runAsync(() async {
      await EmojiAssetCache.clearCacheForTesting();
      final load = EmojiAssetCache.loadBytes(_crying);
      await tester.pumpWidget(_emoji(_crying));
      await expectLater(load, throwsA(isA<HttpException>()));
    });
    await tester.pump();
    expect(find.text('fallback'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());

    await tester.runAsync(() async {
      final load = EmojiAssetCache.loadBytes(_crying);
      await tester.pumpWidget(_emoji(_crying));
      await load;
    });
    await tester.pump();

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(network.requests, hasLength(2));
  });
}
