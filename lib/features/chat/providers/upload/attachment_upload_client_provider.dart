import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attachment_upload_client_provider.g.dart';

@Riverpod(keepAlive: true)
AttachmentUploadClient attachmentUploadClient(Ref ref) {
  return AttachmentUploadClient(
    apiDio: ref.watch(fluxerDioProvider),
    uploadDio: ref.watch(attachmentUploadDioProvider),
  );
}

@Riverpod(keepAlive: true)
Dio attachmentUploadDio(Ref ref) {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(minutes: 10),
      receiveTimeout: const Duration(minutes: 10),
      validateStatus: (int? status) =>
          status != null && status >= 200 && status < 300,
    ),
  );
  ref.onDispose(dio.close);
  return dio;
}
