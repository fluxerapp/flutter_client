import 'package:dio/dio.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';

enum TextualAttachmentPreviewStatus { idle, loading, loaded, error }

enum TextualAttachmentPreviewErrorType { size, network }

class TextualAttachmentPreviewError {
  const TextualAttachmentPreviewError({required this.type, this.message});

  final TextualAttachmentPreviewErrorType type;
  final String? message;
}

class TextualAttachmentContentResult {
  const TextualAttachmentContentResult.loaded(this.content) : error = null;

  const TextualAttachmentContentResult.error(this.error) : content = null;

  final String? content;
  final TextualAttachmentPreviewError? error;

  bool get isLoaded => content != null && error == null;
}

final Dio _textualPreviewDio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    followRedirects: true,
    responseType: ResponseType.plain,
  ),
);

Future<TextualAttachmentContentResult> fetchTextualAttachmentContent({
  required Attachment attachment,
  CancelToken? cancelToken,
  Dio? dio,
}) async {
  if (attachment.url.isEmpty) {
    return const TextualAttachmentContentResult.error(
      TextualAttachmentPreviewError(
        type: TextualAttachmentPreviewErrorType.network,
      ),
    );
  }
  final int? size = attachment.size;
  if (size != null && size > kTextPreviewMaxBytes) {
    return const TextualAttachmentContentResult.error(
      TextualAttachmentPreviewError(
        type: TextualAttachmentPreviewErrorType.size,
      ),
    );
  }

  final Dio client = dio ?? _textualPreviewDio;
  try {
    final Response<dynamic> response = await client.get<dynamic>(
      attachment.url,
      cancelToken: cancelToken,
      options: Options(responseType: ResponseType.plain),
    );
    final Object? data = response.data;
    if (data is! String) {
      return const TextualAttachmentContentResult.error(
        TextualAttachmentPreviewError(
          type: TextualAttachmentPreviewErrorType.network,
        ),
      );
    }
    if (data.length > kTextPreviewMaxBytes) {
      return const TextualAttachmentContentResult.error(
        TextualAttachmentPreviewError(
          type: TextualAttachmentPreviewErrorType.size,
        ),
      );
    }
    return TextualAttachmentContentResult.loaded(data);
  } on DioException catch (error) {
    if (CancelToken.isCancel(error)) {
      rethrow;
    }
    return TextualAttachmentContentResult.error(
      TextualAttachmentPreviewError(
        type: TextualAttachmentPreviewErrorType.network,
        message: error.message,
      ),
    );
  } on Object catch (error) {
    return TextualAttachmentContentResult.error(
      TextualAttachmentPreviewError(
        type: TextualAttachmentPreviewErrorType.network,
        message: error.toString(),
      ),
    );
  }
}
