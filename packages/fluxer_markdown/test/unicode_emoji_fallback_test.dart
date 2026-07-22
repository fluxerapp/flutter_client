import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:markdown/markdown.dart' as md;

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

String _testUnicodeEmojiUrl(String unicode) {
  return 'https://test.invalid/emoji-${unicode.codeUnits.join('-')}.svg';
}

String _noopCustomEmojiUrl({
  required String id,
  required bool animated,
  required int size,
}) => '';

void main() {
  const baseStyle = TextStyle(fontSize: 16, height: 1.375);
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

  Future<void> pumpEmojiWidget(
    WidgetTester tester, {
    required String surrogate,
    required String name,
  }) async {
    final element = md.Element.text(FluxerUnicodeEmojiToneSyntax.tag, name)
      ..attributes['surrogate'] = surrogate;
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FluxerEmojiWidget(
              element: element,
              baseStyle: baseStyle,
              unicodeEmojiUrlBuilder: _testUnicodeEmojiUrl,
              customEmojiUrlBuilder: _noopCustomEmojiUrl,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });
  }

  testWidgets('falls back to system emoji when Twemoji load fails', (
    tester,
  ) async {
    final overrides = _StatusCodeHttpOverrides(statusCode: 404);
    HttpOverrides.global = overrides;

    await pumpEmojiWidget(tester, surrogate: '😀', name: 'grinning');

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

  testWidgets('falls back to system emoji when Twemoji SVG is invalid', (
    tester,
  ) async {
    HttpOverrides.global = _StatusCodeHttpOverrides(
      statusCode: 200,
      body: Uint8List.fromList('not an svg'.codeUnits),
    );

    await pumpEmojiWidget(tester, surrogate: '👍', name: 'thumbsup');

    expect(find.byType(SystemEmojiFallback), findsOneWidget);
  });
}
