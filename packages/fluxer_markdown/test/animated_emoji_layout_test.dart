import 'dart:async';
import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

import 'support/native_test_parser.dart';

final Uint8List _twoFrameGif = Uint8List.fromList(const <int>[
  71,
  73,
  70,
  56,
  57,
  97,
  32,
  0,
  32,
  0,
  240,
  0,
  0,
  255,
  0,
  0,
  0,
  0,
  0,
  33,
  255,
  11,
  78,
  69,
  84,
  83,
  67,
  65,
  80,
  69,
  50,
  46,
  48,
  3,
  1,
  0,
  0,
  0,
  33,
  249,
  4,
  0,
  10,
  0,
  0,
  0,
  44,
  0,
  0,
  0,
  0,
  32,
  0,
  32,
  0,
  0,
  2,
  30,
  132,
  143,
  169,
  203,
  237,
  15,
  163,
  156,
  180,
  218,
  139,
  179,
  222,
  188,
  251,
  15,
  134,
  226,
  72,
  150,
  230,
  137,
  166,
  234,
  202,
  182,
  238,
  11,
  155,
  5,
  0,
  33,
  249,
  4,
  0,
  10,
  0,
  0,
  0,
  44,
  0,
  0,
  0,
  0,
  32,
  0,
  32,
  0,
  128,
  0,
  0,
  255,
  0,
  0,
  0,
  2,
  30,
  132,
  143,
  169,
  203,
  237,
  15,
  163,
  156,
  180,
  218,
  139,
  179,
  222,
  188,
  251,
  15,
  134,
  226,
  72,
  150,
  230,
  137,
  166,
  234,
  202,
  182,
  238,
  11,
  155,
  5,
  0,
  59,
]);

class _LayoutCounter extends SingleChildRenderObjectWidget {
  const _LayoutCounter({required this.onLayout, super.child});

  final VoidCallback onLayout;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderLayoutCounter(onLayout);
}

class _RenderLayoutCounter extends RenderProxyBox {
  _RenderLayoutCounter(this.onLayout);

  final VoidCallback onLayout;

  @override
  void performLayout() {
    onLayout();
    super.performLayout();
  }
}

class _GifHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => _GifHttpClient();
}

class _GifHttpClient implements HttpClient {
  @override
  bool autoUncompress = true;

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) async =>
      _GifHttpClientRequest(method, url);

  @override
  Future<HttpClientRequest> getUrl(Uri url) async =>
      _GifHttpClientRequest('GET', url);

  @override
  void close({bool force = false}) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _GifHttpClientRequest implements HttpClientRequest {
  _GifHttpClientRequest(this.method, this.uri);

  @override
  final String method;
  @override
  final Uri uri;
  @override
  final HttpHeaders headers = _GifHttpHeaders();

  @override
  bool followRedirects = true;
  @override
  int maxRedirects = 5;
  @override
  int contentLength = -1;
  @override
  bool persistentConnection = true;

  @override
  void add(List<int> data) {}

  @override
  Future<void> addStream(Stream<List<int>> stream) => stream.drain<void>();

  @override
  Future<HttpClientResponse> close() async => _GifHttpClientResponse();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _GifHttpHeaders implements HttpHeaders {
  final Map<String, List<String>> _values = <String, List<String>>{};

  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {
    _values[name.toLowerCase()] = <String>[value.toString()];
  }

  @override
  void add(String name, Object value, {bool preserveHeaderCase = false}) {
    _values.putIfAbsent(name.toLowerCase(), () => <String>[]).add('$value');
  }

  @override
  List<String>? operator [](String name) => _values[name.toLowerCase()];

  @override
  String? value(String name) => _values[name.toLowerCase()]?.firstOrNull;

  @override
  void forEach(void Function(String name, List<String> values) action) {
    _values.forEach(action);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _GifHttpClientResponse extends Stream<List<int>>
    implements HttpClientResponse {
  final _GifHttpHeaders _headers = _GifHttpHeaders()
    ..set('content-type', 'image/gif');

  @override
  int get statusCode => 200;

  @override
  String get reasonPhrase => 'OK';

  @override
  int get contentLength => _twoFrameGif.length;

  @override
  bool get isRedirect => false;

  @override
  bool get persistentConnection => false;

  @override
  List<RedirectInfo> get redirects => const <RedirectInfo>[];

  @override
  HttpHeaders get headers => _headers;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.value(_twoFrameGif).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<void> _pumpFrames(WidgetTester tester, int count) async {
  await tester.runAsync(() async {
    for (int i = 0; i < count; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 60));
      await tester.pump(const Duration(milliseconds: 60));
    }
  });
}

void main() {
  setUp(() async {
    final Directory tempDir = await Directory.systemTemp.createTemp(
      'fluxer_animated_emoji_layout',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall call) async => tempDir.path,
        );
    HttpOverrides.global = _GifHttpOverrides();
    addTearDown(() => HttpOverrides.global = null);
  });

  for (final FluxerMarkdownContext markdownContext in <FluxerMarkdownContext>[
    FluxerMarkdownContext.standardWithJumbo,
    FluxerMarkdownContext.restrictedUserBio,
  ]) {
    testWidgets('animated emoji frames repaint without re-laying out ancestors '
        '(${markdownContext.name})', (WidgetTester tester) async {
      int layouts = 0;
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ListView(
                children: <Widget>[
                  _LayoutCounter(
                    onLayout: () => layouts++,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints _) {
                        return FluxerMarkdown(
                          astParser: parseTestMarkdownAst,
                          data:
                              'party <a:party:11111111111111111${markdownContext.index}> time',
                          context: markdownContext,
                          baseStyle: const TextStyle(fontSize: 14),
                          config: FluxerMarkdownConfig(
                            unicodeEmojiUrlBuilder: (_) => null,
                            customEmojiUrlBuilder:
                                ({
                                  required String id,
                                  required bool animated,
                                  required int size,
                                }) => 'https://example.com/emojis/$id.gif',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
      await _pumpFrames(tester, 20);
      expect(tester.widget<RawImage>(find.byType(RawImage)).image, isNotNull);

      final int settledLayouts = layouts;
      final Set<Object?> frames = <Object?>{};
      await tester.runAsync(() async {
        for (int i = 0; i < 20; i++) {
          await Future<void>.delayed(const Duration(milliseconds: 60));
          await tester.pump(const Duration(milliseconds: 60));
          frames.add(tester.widget<RawImage>(find.byType(RawImage)).image);
        }
      });

      expect(frames.length, greaterThan(1));
      expect(layouts, settledLayouts);
    });
  }
}
