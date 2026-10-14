import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/retrying_network_image.dart';
import 'package:fluxer_app/material_ui.dart';

final Uint8List _png = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==',
);

class _FlakyCacheManager implements BaseCacheManager {
  _FlakyCacheManager({this.failures = 0, Uint8List? body})
    : body = body ?? _png;

  int failures;
  final Uint8List body;
  final MemoryFileSystem _fs = MemoryFileSystem();
  final List<String> requests = <String>[];

  @override
  Stream<FileResponse> getFileStream(
    String url, {
    String? key,
    Map<String, String>? headers,
    bool withProgress = false,
  }) async* {
    requests.add(url);
    if (requests.length <= failures) {
      throw HttpExceptionWithStatus(502, 'Bad Gateway', uri: Uri.parse(url));
    }
    final File file = _fs.file('/image_${requests.length}')
      ..writeAsBytesSync(body);
    yield FileInfo(
      file,
      FileSource.Online,
      DateTime.now().add(const Duration(days: 1)),
      url,
    );
  }

  @override
  Future<FileInfo?> getFileFromCache(
    String key, {
    bool ignoreMemCache = false,
  }) async => null;

  @override
  Future<void> removeFile(String key) async {}

  @override
  Future<void> emptyCache() async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<File> putFile(
    String url,
    List<int> fileBytes, {
    String? key,
    String? eTag,
    Duration maxAge = const Duration(days: 30),
    String fileExtension = 'file',
  }) => throw UnimplementedError();
}

const Key _placeholderKey = Key('placeholder');
const Key _errorKey = Key('error');

Widget _app(String url) => MaterialApp(
  home: Center(
    child: SizedBox(
      width: 100,
      height: 100,
      child: RetryingNetworkImage(
        imageUrl: url,
        placeholder: const SizedBox.expand(key: _placeholderKey),
        errorPlaceholder: const SizedBox.expand(key: _errorKey),
      ),
    ),
  ),
);

Future<void> _settleLoad(WidgetTester tester) async {
  for (int i = 0; i < 5; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
  }
}

bool _imageShown(WidgetTester tester) => tester
    .widgetList<RawImage>(find.byType(RawImage))
    .any((RawImage image) => image.image != null);

void main() {
  late BaseCacheManager previousManager;

  setUp(() {
    previousManager = CachedNetworkImageProvider.defaultCacheManager;
    PaintingBinding.instance.imageCache.clear();
  });

  tearDown(() {
    CachedNetworkImageProvider.defaultCacheManager = previousManager;
    PaintingBinding.instance.imageCache.clear();
  });

  testWidgets('keeps the placeholder after a failure and loads on retry', (
    tester,
  ) async {
    final _FlakyCacheManager manager = _FlakyCacheManager(failures: 1);
    CachedNetworkImageProvider.defaultCacheManager = manager;

    await tester.pumpWidget(_app('https://media.test/a.webp'));
    await _settleLoad(tester);

    expect(manager.requests, hasLength(1));
    expect(find.byKey(_errorKey), findsNothing);
    expect(find.byKey(_placeholderKey), findsOneWidget);

    await tester.pump(kMediaLoadRetryDelays.first);
    await _settleLoad(tester);

    expect(manager.requests, hasLength(2));
    expect(find.byKey(_errorKey), findsNothing);
    expect(_imageShown(tester), isTrue);
  });

  testWidgets('shows the error after the retry window and keeps recovering', (
    tester,
  ) async {
    final _FlakyCacheManager manager = _FlakyCacheManager(failures: 1 << 30);
    CachedNetworkImageProvider.defaultCacheManager = manager;

    await tester.pumpWidget(_app('https://media.test/b.webp'));
    await _settleLoad(tester);

    for (final Duration delay in kMediaLoadRetryDelays) {
      expect(find.byKey(_errorKey), findsNothing);
      await tester.pump(delay);
      await _settleLoad(tester);
    }

    expect(manager.requests, hasLength(kMediaLoadRetryDelays.length + 1));
    expect(find.byKey(_errorKey), findsOneWidget);

    manager.failures = 0;
    await tester.pump(mediaLoadRetryDelay(kMediaLoadRetryDelays.length + 1));
    await _settleLoad(tester);

    expect(find.byKey(_errorKey), findsNothing);
    expect(_imageShown(tester), isTrue);
  });

  testWidgets('does not retry an undecodable image', (tester) async {
    final _FlakyCacheManager manager = _FlakyCacheManager(
      body: Uint8List.fromList(<int>[1, 2, 3, 4]),
    );
    CachedNetworkImageProvider.defaultCacheManager = manager;

    await tester.pumpWidget(_app('https://media.test/c.webp'));
    await _settleLoad(tester);

    expect(find.byKey(_errorKey), findsOneWidget);
    await tester.pump(const Duration(minutes: 2));
    await _settleLoad(tester);
    expect(manager.requests, hasLength(1));
  });

  testWidgets('starts a fresh retry window when the url changes', (
    tester,
  ) async {
    final _FlakyCacheManager manager = _FlakyCacheManager(failures: 1 << 30);
    CachedNetworkImageProvider.defaultCacheManager = manager;

    await tester.pumpWidget(_app('https://media.test/d.webp'));
    await _settleLoad(tester);
    for (final Duration delay in kMediaLoadRetryDelays) {
      await tester.pump(delay);
      await _settleLoad(tester);
    }
    expect(find.byKey(_errorKey), findsOneWidget);

    manager.failures = manager.requests.length + 1;
    await tester.pumpWidget(_app('https://media.test/e.webp'));
    await _settleLoad(tester);

    expect(manager.requests.last, 'https://media.test/e.webp');
    expect(find.byKey(_errorKey), findsNothing);
    expect(find.byKey(_placeholderKey), findsOneWidget);

    await tester.pump(kMediaLoadRetryDelays.first);
    await _settleLoad(tester);
    expect(_imageShown(tester), isTrue);
  });

  test('backs off to a capped recovery delay', () {
    expect(mediaLoadRetryDelay(1), const Duration(seconds: 1));
    expect(mediaLoadRetryDelay(4), const Duration(seconds: 8));
    expect(mediaLoadRetryDelay(5), const Duration(seconds: 16));
    expect(mediaLoadRetryDelay(6), const Duration(seconds: 32));
    expect(mediaLoadRetryDelay(7), kMediaLoadRecoveryMaxDelay);
    expect(mediaLoadRetryDelay(50), kMediaLoadRecoveryMaxDelay);
  });
}
