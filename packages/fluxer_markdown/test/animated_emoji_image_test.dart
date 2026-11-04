import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

const Key _fallbackKey = ValueKey<String>('fallback');

class _FailingCacheManager implements BaseCacheManager {
  _FailingCacheManager(this.error);

  final Object error;
  int requests = 0;
  int removals = 0;

  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) {
    requests += 1;
    return Stream<FileResponse>.error(error);
  }

  @override
  Future<FileInfo?> getFileFromCache(
    String key, {
    bool ignoreMemCache = false,
  }) async => null;

  @override
  Future<void> removeFile(String key) async {
    removals += 1;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Widget _emoji() => const Directionality(
  textDirection: TextDirection.ltr,
  child: FluxerAnimatedEmojiImage(
    url: 'https://example.com/emojis/1.webp?animated=true',
    cacheKey: 'emoji_1_a2_96',
    size: 22,
    fallback: SizedBox(key: _fallbackKey, width: 22, height: 22),
  ),
);

void _installCacheManager(BaseCacheManager manager) {
  final BaseCacheManager previous =
      CachedNetworkImageProvider.defaultCacheManager;
  CachedNetworkImageProvider.defaultCacheManager = manager;
  addTearDown(() {
    CachedNetworkImageProvider.defaultCacheManager = previous;
    PaintingBinding.instance.imageCache
      ..clear()
      ..clearLiveImages();
  });
}

void main() {
  test('retry delay backs off and stops growing at a minute', () {
    expect(animatedEmojiRetryDelay(1), const Duration(seconds: 1));
    expect(animatedEmojiRetryDelay(2), const Duration(seconds: 2));
    expect(animatedEmojiRetryDelay(4), const Duration(seconds: 8));
    expect(animatedEmojiRetryDelay(7), const Duration(seconds: 60));
    expect(animatedEmojiRetryDelay(40), const Duration(seconds: 60));
  });

  testWidgets('a failed load shows the static frame and retries with backoff', (
    WidgetTester tester,
  ) async {
    final _FailingCacheManager manager = _FailingCacheManager(
      Exception('connection reset'),
    );
    _installCacheManager(manager);

    await tester.pumpWidget(_emoji());
    await tester.pump();
    await tester.pump();
    expect(find.byKey(_fallbackKey), findsOneWidget);
    expect(manager.requests, 1);
    expect(manager.removals, 0, reason: 'one failure is usually the network');

    await tester.pump(const Duration(milliseconds: 900));
    expect(manager.requests, 1, reason: 'the retry waits out its delay');

    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump();
    await tester.pump();
    expect(manager.requests, 2);
    expect(find.byKey(_fallbackKey), findsOneWidget);
    expect(
      manager.removals,
      greaterThan(0),
      reason: 'a repeat failure no longer trusts the disk copy',
    );

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    await tester.pump();
    expect(manager.requests, 3);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('an unsupported format is not retried', (
    WidgetTester tester,
  ) async {
    final _FailingCacheManager manager = _FailingCacheManager(
      UnsupportedImageFormatException(bytes: Uint8List(0), url: 'emoji'),
    );
    _installCacheManager(manager);

    await tester.pumpWidget(_emoji());
    await tester.pump();
    await tester.pump();
    expect(find.byKey(_fallbackKey), findsOneWidget);

    await tester.pump(const Duration(seconds: 120));
    await tester.pump();
    expect(manager.requests, 1);

    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('removing the emoji cancels its pending retry', (
    WidgetTester tester,
  ) async {
    final _FailingCacheManager manager = _FailingCacheManager(
      Exception('connection reset'),
    );
    _installCacheManager(manager);

    await tester.pumpWidget(_emoji());
    await tester.pump();
    await tester.pump();
    await tester.pumpWidget(const SizedBox.shrink());

    await tester.pump(const Duration(seconds: 5));
    expect(manager.requests, 1);
  });

  testWidgets('an inset change does not rebuild markdown emoji', (
    WidgetTester tester,
  ) async {
    final _FailingCacheManager manager = _FailingCacheManager(
      Exception('offline'),
    );
    _installCacheManager(manager);

    final Widget markdown = FluxerMarkdown(
      astParser: parseTestMarkdownAst,
      data: '<a:party:123>',
      config: FluxerMarkdownConfig(
        unicodeEmojiUrlBuilder: (String _) => null,
        customEmojiUrlBuilder:
            ({required String id, required bool animated, required int size}) =>
                'https://example.com/emojis/$id.webp',
      ),
    );
    Widget app(double inset) => MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(viewInsets: EdgeInsets.only(bottom: inset)),
        child: Material(child: markdown),
      ),
    );

    await tester.pumpWidget(app(0));
    await tester.pump();
    final FluxerAnimatedEmojiImage before = tester.widget(
      find.byType(FluxerAnimatedEmojiImage),
    );

    await tester.pumpWidget(app(120));
    final FluxerAnimatedEmojiImage after = tester.widget(
      find.byType(FluxerAnimatedEmojiImage),
    );
    expect(identical(before, after), isTrue);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
