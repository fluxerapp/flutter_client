import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/gif_repository.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_dart/export.dart' as sdk;

void main() {
  test(
    'search calls the generic GIF endpoint and maps preferred media',
    () async {
      final adapter = _FakeDioAdapter({
        'GET /gifs/search': [
          {
            'id': 'tenor-1',
            'slug': 'view/excited-ah-gif-1',
            'title': 'Excited ah',
            'url': 'https://tenor.com/view/excited-ah-gif-1',
            'src': 'https://media.tenor.com/excited-ah.webm',
            'proxy_src': 'https://cdn.example/excited-ah.webm',
            'width': 498,
            'height': 498,
            'media': {
              'webm': {
                'src': 'https://media.tenor.com/excited-ah.webm',
                'proxy_src': 'https://cdn.example/excited-ah.webm',
                'width': 498,
                'height': 498,
              },
              'webp': {
                'src': 'https://media.tenor.com/excited-ah.webp',
                'proxy_src': 'https://cdn.example/excited-ah.webp',
                'width': 498,
                'height': 498,
              },
            },
          },
        ],
      });
      final dio = Dio(BaseOptions(baseUrl: 'https://api.example/v1'))
        ..httpClientAdapter = adapter;
      final repository = GifRepository(
        dio: dio,
        loadActiveProvider: () async => GifProviderKind.tenor,
      );

      final results = await repository.search(
        query: ' excited ',
        locale: sdk.Locale.enUs,
      );

      expect(results, hasLength(1));
      expect(results.single.provider, GifProviderKind.tenor);
      expect(results.single.slug, 'view/excited-ah-gif-1');
      expect(results.single.src, 'https://media.tenor.com/excited-ah.webp');
      expect(results.single.proxySrc, 'https://cdn.example/excited-ah.webp');
      expect(
        results.single.media?['webp']?.src,
        'https://media.tenor.com/excited-ah.webp',
      );
      expect(
        results.single.media?['webm']?.src,
        'https://media.tenor.com/excited-ah.webm',
      );
      expect(adapter.requests.single.path, '/gifs/search');
      expect(adapter.requests.single.query, {
        'q': 'excited',
        'locale': 'en-US',
      });
    },
  );
}

typedef _RecordedRequest = ({
  String method,
  String path,
  Map<String, Object?> query,
  Object? data,
});

class _FakeDioAdapter implements HttpClientAdapter {
  _FakeDioAdapter(this._responses);

  final Map<String, Object?> _responses;
  final List<_RecordedRequest> requests = <_RecordedRequest>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add((
      method: options.method,
      path: options.path,
      query: options.queryParameters.map(
        (key, value) => MapEntry(key, value as Object?),
      ),
      data: options.data,
    ));

    final key = '${options.method} ${options.path}';
    final body = _responses[key];
    if (!_responses.containsKey(key)) {
      return ResponseBody.fromString('Not found', 404);
    }

    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
