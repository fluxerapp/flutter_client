import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

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

void main() {
  const size = 20.0;

  tearDown(() {
    HttpOverrides.global = null;
    TwemojiSvgCache.clearCacheForTesting();
  });

  testWidgets('falls back to system emoji when Twemoji load fails', (
    tester,
  ) async {
    HttpOverrides.global = _StatusCodeHttpOverrides(statusCode: 404);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UnicodeEmojiWidget(emoji: '😀', size: size),
        ),
      ),
    );
    await tester.pumpAndSettle();

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

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UnicodeEmojiWidget(emoji: '👍', size: size),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('👍'), findsOneWidget);
  });
}
