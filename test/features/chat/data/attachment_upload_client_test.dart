import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';

void main() {
  late Directory dir;
  late _Adapter api;
  late _Adapter storage;
  late AttachmentUploadClient client;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('attachment_upload_client');
    api = _Adapter();
    storage = _Adapter();
    client = AttachmentUploadClient(
      apiDio: Dio(BaseOptions(receiveTimeout: const Duration(seconds: 10)))
        ..httpClientAdapter = api,
      uploadDio: Dio()..httpClientAdapter = storage,
    );
  });

  tearDown(() => dir.delete(recursive: true));

  XFile writeFile(int length) {
    final File file = File('${dir.path}/clip.mp4')
      ..writeAsBytesSync(List<int>.generate(length, (int i) => i % 251));
    return XFile(file.path);
  }

  test('presign and complete calls are cancellable and patient', () async {
    final CancelToken token = CancelToken();
    final AttachmentUploadPlan plan = await client.requestAttachmentUploadPlan(
      channelId: 'c1',
      attachmentId: 1,
      filename: 'clip.mp4',
      fileSize: 10,
      contentType: 'video/mp4',
      cancelToken: token,
    );
    await client.uploadAttachmentPlan(
      UploadAttachmentPlanParams(
        channelId: 'c1',
        file: writeFile(10),
        plan: plan,
        cancelToken: token,
      ),
    );

    expect(api.requests.map((RequestOptions r) => r.path), <String>[
      '/channels/c1/attachments',
      '/channels/c1/attachments/complete',
    ]);
    for (final RequestOptions request in api.requests) {
      expect(request.cancelToken, same(token));
    }
    expect(
      api.requests.last.receiveTimeout,
      greaterThanOrEqualTo(const Duration(minutes: 2)),
    );
  });

  test('parts stream from disk with a size-scaled send timeout', () async {
    final XFile file = writeFile(10);
    await client.uploadAttachmentPlan(
      UploadAttachmentPlanParams(
        channelId: 'c1',
        file: file,
        plan: const MultipartAttachmentUploadPlan(
          uploadFilename: 'stored.mp4',
          fileSize: 10,
          contentType: 'video/mp4',
          uploadId: 'u1',
          partSize: 4,
          parts: <MultipartAttachmentUploadPartPlan>[
            MultipartAttachmentUploadPartPlan(
              partNumber: 1,
              uploadUrl: 'https://s3.test/1',
            ),
            MultipartAttachmentUploadPartPlan(
              partNumber: 2,
              uploadUrl: 'https://s3.test/2',
            ),
            MultipartAttachmentUploadPartPlan(
              partNumber: 3,
              uploadUrl: 'https://s3.test/3',
            ),
          ],
        ),
      ),
    );

    expect(storage.requests, hasLength(3));
    for (final RequestOptions request in storage.requests) {
      expect(request.data, isA<Stream<List<int>>>());
    }
    expect(
      storage.bodies.expand((List<int> b) => b).toList()..sort(),
      [...File(file.path).readAsBytesSync()]..sort(),
    );
    expect(
      attachmentUploadSendTimeout(10 * 1024 * 1024),
      greaterThan(const Duration(minutes: 15)),
    );
  });
}

class _Adapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];
  final List<List<int>> bodies = <List<int>>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final List<int> body = <int>[
      ...?(await requestStream?.toList())?.expand((Uint8List c) => c),
    ];
    if (options.uri.host == 's3.test') {
      bodies.add(body);
      return ResponseBody.fromString('', 200);
    }
    if (options.path.endsWith('/attachments')) {
      return _json(<String, Object?>{
        'attachments': <Object?>[
          <String, Object?>{
            'id': 1,
            'filename': 'clip.mp4',
            'upload_mode': 'multipart',
            'upload_filename': 'stored.mp4',
            'file_size': 10,
            'content_type': 'video/mp4',
            'upload_id': 'u1',
            'part_size': 10,
            'parts': <Object?>[
              <String, Object?>{
                'part_number': 1,
                'upload_url': 'https://s3.test/1',
              },
            ],
          },
        ],
      });
    }
    return _json(<String, Object?>{
      'uploads': <Object?>[
        <String, Object?>{'upload_filename': 'stored.mp4'},
      ],
    });
  }

  ResponseBody _json(Object data) => ResponseBody.fromString(
    jsonEncode(data),
    200,
    headers: {
      Headers.contentTypeHeader: ['application/json'],
    },
  );

  @override
  void close({bool force = false}) {}
}
