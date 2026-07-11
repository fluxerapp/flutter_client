import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/renderers/fluxer_markdown_renderers.dart';
import 'package:fluxer_markdown/src/syntaxes/fluxer_markdown_syntaxes.dart';
import 'package:markdown/markdown.dart' as md;

class _StatusCodeHttpOverrides extends HttpOverrides {
  _StatusCodeHttpOverrides({
    required this.statusCode,
    this.body = const <int>[],
  });

  final int statusCode;
  final List<int> body;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _StatusCodeHttpClient(statusCode: statusCode, body: body);
  }
}

class _StatusCodeHttpClient implements HttpClient {
  _StatusCodeHttpClient({required this.statusCode, required this.body});

  final int statusCode;
  final List<int> body;

  @override
  bool autoUncompress = true;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return _StatusCodeHttpClientRequest(statusCode: statusCode, body: body);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _StatusCodeHttpClientRequest implements HttpClientRequest {
  _StatusCodeHttpClientRequest({required this.statusCode, required this.body});

  final int statusCode;
  final List<int> body;

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

  tearDown(() {
    HttpOverrides.global = null;
    FluxerSvgCache.clearCacheForTesting();
  });

  Future<void> pumpEmojiWidget(
    WidgetTester tester, {
    required String surrogate,
    required String name,
  }) async {
    final element = md.Element.text(FluxerUnicodeEmojiToneSyntax.tag, name)
      ..attributes['surrogate'] = surrogate;
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
  }

  testWidgets('falls back to system emoji when Twemoji load fails', (
    tester,
  ) async {
    HttpOverrides.global = _StatusCodeHttpOverrides(statusCode: 404);

    await pumpEmojiWidget(tester, surrogate: '😀', name: 'grinning');

    expect(find.text('😀'), findsOneWidget);
    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('falls back to system emoji when Twemoji SVG is invalid', (
    tester,
  ) async {
    HttpOverrides.global = _StatusCodeHttpOverrides(
      statusCode: 200,
      body: Uint8List.fromList('not an svg'.codeUnits),
    );

    await pumpEmojiWidget(tester, surrogate: '👍', name: 'thumbsup');

    expect(find.text('👍'), findsOneWidget);
  });
}
