import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:markdown/markdown.dart' as md;
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

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    final headers = _RecordingHttpHeaders();
    return _StatusCodeHttpClientRequest(
      statusCode: statusCode,
      body: body,
      headers: headers,
    );
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
  Future<HttpClientResponse> close() async =>
      _StatusCodeHttpClientResponse(statusCode: statusCode, body: body);

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
    action(Uint8List.fromList(body));
  }

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  HttpHeaders get headers => _RecordingHttpHeaders();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  final svg = Uint8List.fromList(
    '<?xml version="1.0" encoding="utf-8"?><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 36"><path d="M35.885 11.833c0-5.45-4.418-9.868-9.867-9.868-3.308 0-6.227 1.633-8.018 4.129-1.791-2.496-4.71-4.129-8.017-4.129-5.45 0-9.868 4.417-9.868 9.868 0 .772.098 1.52.266 2.241C1.751 22.587 11.216 31.568 18 34.034c6.783-2.466 16.249-11.447 17.617-19.959.17-.721.268-1.469 .268-2.242z" fill="#DD2E44"/></svg>'
        .codeUnits,
  );

  setUp(() async {
    final tempDir = await Directory.systemTemp.createTemp(
      'fluxer_emoji_widget',
    );
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'getTemporaryDirectory') {
            return tempDir.path;
          }
          return null;
        });
    await EmojiAssetCache.clearCacheForTesting();
  });

  testWidgets('renders heart as SvgPicture inside a WidgetSpan', (
    tester,
  ) async {
    final httpOverrides = _StatusCodeHttpOverrides(statusCode: 200, body: svg);
    HttpOverrides.global = httpOverrides;
    addTearDown(() => httpOverrides.lastClient?.close());

    final element = md.Element.text('emoji-unicode', 'heart')
      ..attributes['surrogate'] = '❤️';

    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: FluxerEmojiWidget(
                      element: element,
                      baseStyle: const TextStyle(fontSize: 16),
                      unicodeEmojiUrlBuilder: (surrogate) =>
                          'https://example.com/emoji/$surrogate.svg',
                      customEmojiUrlBuilder:
                          ({
                            required String id,
                            required bool animated,
                            required int size,
                          }) => 'https://example.com/emoji/$id',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    });

    expect(find.byType(SvgPicture), findsOneWidget);
  });
}
