import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/voice_stream_preview.dart';
import 'package:fluxer_dart/gateway.dart';

class _BytesAdapter implements HttpClientAdapter {
  _BytesAdapter({required this.statusCode, this.bytes});

  final int statusCode;
  final List<int>? bytes;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (statusCode != 200 || bytes == null) {
      return ResponseBody.fromBytes(const <int>[], statusCode);
    }
    return ResponseBody.fromBytes(
      bytes!,
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['image/jpeg'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('buildViewerStreamPreviewUrl', () {
    test('builds guild stream preview path', () {
      expect(
        buildViewerStreamPreviewUrl(
          baseUrl: 'https://api.example/v1',
          voice: const VoiceState(
            userId: 'u1',
            guildId: 'g1',
            channelId: 'c1',
            connectionId: 'conn1',
          ),
          isScreenShareTile: true,
        ),
        'https://api.example/v1/streams/g1:c1:conn1/preview',
      );
    });

    test('builds dm stream preview path', () {
      expect(
        buildViewerStreamPreviewUrl(
          baseUrl: 'https://api.example/v1',
          voice: const VoiceState(
            userId: 'u1',
            channelId: 'c1',
            connectionId: 'conn1',
          ),
          isScreenShareTile: true,
        ),
        'https://api.example/v1/streams/dm:c1:conn1/preview',
      );
    });

    test('returns null for camera tiles', () {
      expect(
        buildViewerStreamPreviewUrl(
          baseUrl: 'https://api.example/v1',
          voice: const VoiceState(
            userId: 'u1',
            guildId: 'g1',
            channelId: 'c1',
            connectionId: 'conn1',
          ),
          isScreenShareTile: false,
        ),
        isNull,
      );
    });
  });

  group('fetchStreamPreviewBytes', () {
    test('returns jpeg bytes on 200', () async {
      final Dio dio = Dio();
      dio.httpClientAdapter = _BytesAdapter(
        statusCode: 200,
        bytes: const <int>[1, 2, 3],
      );
      final Uint8List? bytes = await fetchStreamPreviewBytes(
        dio: dio,
        previewUrl: 'https://api.example/v1/streams/g1:c1:conn1/preview',
      );
      expect(bytes, Uint8List.fromList(const <int>[1, 2, 3]));
    });

    test('returns null on 404', () async {
      final Dio dio = Dio();
      dio.httpClientAdapter = _BytesAdapter(statusCode: 404);
      final Uint8List? bytes = await fetchStreamPreviewBytes(
        dio: dio,
        previewUrl: 'https://api.example/v1/streams/g1:c1:conn1/preview',
      );
      expect(bytes, isNull);
    });
  });
}
