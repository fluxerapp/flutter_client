import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

class _RecordingHttpHeaders implements HttpHeaders {
  final _values = <String, List<String>>{};

  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {
    _values[name] = [value.toString()];
  }

  @override
  void add(String name, Object value, {bool preserveHeaderCase = false}) {
    _values.putIfAbsent(name, () => []).add(value.toString());
  }

  @override
  List<String>? operator [](String name) => _values[name];

  @override
  String? value(String name) => _values[name]?.firstOrNull;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _StatusCodeHttpOverrides extends HttpOverrides {
  _StatusCodeHttpOverrides({
    required this.statusCode,
    this.body = const <int>[],
  });

  final int statusCode;
  final List<int> body;
  _StatusCodeHttpClient? lastClient;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    lastClient = _StatusCodeHttpClient(statusCode: statusCode, body: body);
    return lastClient!;
  }
}

class _StatusCodeHttpClient implements HttpClient {
  _StatusCodeHttpClient({required this.statusCode, required this.body});

  final int statusCode;
  final List<int> body;
  HttpHeaders? lastHeaders;

  @override
  bool autoUncompress = true;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    final request = _StatusCodeHttpClientRequest(
      statusCode: statusCode,
      body: body,
      headers: _RecordingHttpHeaders(),
    );
    lastHeaders = request.headers;
    return request;
  }

  @override
  void close({bool force = false}) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _StatusCodeHttpClientRequest implements HttpClientRequest {
  _StatusCodeHttpClientRequest({
    required this.statusCode,
    required this.body,
    required this.headers,
  });

  final int statusCode;
  final List<int> body;

  @override
  final HttpHeaders headers;

  @override
  Future<HttpClientResponse> close() async {
    return _StatusCodeHttpClientResponse(statusCode: statusCode, body: body);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _StatusCodeHttpClientResponse implements HttpClientResponse {
  _StatusCodeHttpClientResponse({required this.statusCode, required this.body});

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

void main() {
  const size = 20.0;
  Directory? tempDir;

  setUp(() async {
    HttpOverrides.global = null;
    TestWidgetsFlutterBinding.ensureInitialized();
    tempDir = await Directory.systemTemp.createTemp('emoji_cache_test');
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'getTemporaryDirectory') {
            return tempDir?.path;
          }
          return null;
        });
    await EmojiAssetCache.clearCacheForTesting();
  });

  tearDown(() async {
    HttpOverrides.global = null;
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    await EmojiAssetCache.clearCacheForTesting();
    final dir = tempDir;
    if (dir != null) {
      await dir.delete(recursive: true);
    }
    tempDir = null;
  });

  test('EmojiAssetCache.loadBytes throws on 404', () async {
    HttpOverrides.global = _StatusCodeHttpOverrides(statusCode: 404);
    await expectLater(
      EmojiAssetCache.loadBytes('https://test.invalid/emoji/1f600.svg'),
      throwsA(isA<HttpException>()),
    );
  });

  test('EmojiAssetCache.loadBytes returns bytes on 200', () async {
    final body = Uint8List.fromList('svg'.codeUnits);
    HttpOverrides.global = _StatusCodeHttpOverrides(
      statusCode: 200,
      body: body,
    );
    final bytes = await EmojiAssetCache.loadBytes(
      'https://test.invalid/emoji/1f600.svg',
    );
    expect(bytes, equals(body));
  });

  testWidgets('falls back to system emoji when Twemoji load fails', (
    tester,
  ) async {
    final overrides = _StatusCodeHttpOverrides(statusCode: 404);
    HttpOverrides.global = overrides;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UnicodeEmojiWidget(emoji: '😀', size: size),
        ),
      ),
    );
    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnicodeEmojiWidget(emoji: '😀', size: size),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });

    expect(find.byType(SystemEmojiFallback), findsOneWidget);
    expect(find.byType(SvgPicture), findsNothing);
    expect(
      overrides.lastClient?.lastHeaders?.value(HttpHeaders.userAgentHeader),
      contains('Mozilla/5.0'),
    );
    expect(
      overrides.lastClient?.lastHeaders?.value(HttpHeaders.acceptHeader),
      'image/svg+xml',
    );
    expect(
      overrides.lastClient?.lastHeaders?.value(
        HttpHeaders.acceptEncodingHeader,
      ),
      'identity',
    );
    expect(
      overrides.lastClient?.lastHeaders?.value(HttpHeaders.refererHeader),
      'https://web.fluxer.app/',
    );
    expect(overrides.lastClient?.lastHeaders?.value('Sec-Fetch-Dest'), 'image');
    expect(
      overrides.lastClient?.lastHeaders?.value('Sec-Fetch-Mode'),
      'no-cors',
    );
    expect(
      overrides.lastClient?.lastHeaders?.value('Sec-Fetch-Site'),
      'cross-site',
    );
  });

  testWidgets('renders Twemoji SVG when network returns valid SVG', (
    tester,
  ) async {
    const String svgMarkup = '''
<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 36">
<path d="M35.885 11.833c0-5.45-4.418-9.868-9.867-9.868-3.308 0-6.227 1.633-8.018 4.129-1.791-2.496-4.71-4.129-8.017-4.129-5.45 0-9.868 4.417-9.868 9.868 0 .772.098 1.52.266 2.241C1.751 22.587 11.216 31.568 18 34.034c6.783-2.466 16.249-11.447 17.617-19.959.17-.721.268-1.469 .268-2.242z" fill="#DD2E44"/>
</svg>''';
    final svg = Uint8List.fromList(svgMarkup.codeUnits);
    HttpOverrides.global = _StatusCodeHttpOverrides(statusCode: 200, body: svg);

    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnicodeEmojiWidget(emoji: '❤️', size: size),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });

    expect(find.byType(SvgPicture), findsOneWidget);
  });

  testWidgets('falls back to system emoji when asset format is unknown', (
    tester,
  ) async {
    HttpOverrides.global = _StatusCodeHttpOverrides(
      statusCode: 200,
      body: Uint8List.fromList('not an image'.codeUnits),
    );

    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnicodeEmojiWidget(emoji: '👍', size: size),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });

    expect(find.byType(SystemEmojiFallback), findsOneWidget);
  });

  testWidgets('renders WebP emoji asset when network returns WebP', (
    tester,
  ) async {
    final webp = Uint8List.fromList([
      0x52,
      0x49,
      0x46,
      0x46,
      0x24,
      0x00,
      0x00,
      0x00,
      0x57,
      0x45,
      0x42,
      0x50,
      0x56,
      0x50,
      0x38,
      0x20,
      0x18,
      0x00,
      0x00,
      0x00,
      0x30,
      0x01,
      0x00,
      0x9D,
      0x01,
      0x2A,
      0x01,
      0x00,
      0x01,
      0x00,
      0x02,
      0x00,
      0x34,
      0x25,
      0xA4,
      0x00,
      0x03,
      0x70,
      0x00,
      0xFE,
      0x07,
      0x00,
      0x00,
    ]);
    HttpOverrides.global = _StatusCodeHttpOverrides(
      statusCode: 200,
      body: webp,
    );

    await tester.runAsync(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnicodeEmojiWidget(emoji: '🐊', size: size),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });

    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(SystemEmojiFallback), findsNothing);
  });
}
