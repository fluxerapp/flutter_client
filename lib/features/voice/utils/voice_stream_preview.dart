import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kStreamPreviewRefreshInterval = Duration(seconds: 60);
const Duration kStreamPreviewInitialRetryInterval = Duration(seconds: 1);
const int kStreamPreviewInitialRetryMaxAttempts = 10;

const ColorFilter kStreamPreviewBrightnessFilter = ColorFilter.matrix(<double>[
  0.4, 0, 0, 0, 0, // R
  0, 0.4, 0, 0, 0, // G
  0, 0, 0.4, 0, 0, // B
  0, 0, 0, 1, 0, // A
]);

Future<Uint8List?> fetchStreamPreviewBytes({
  required Dio dio,
  required String previewUrl,
  CancelToken? cancelToken,
}) async {
  if (previewUrl.isEmpty) {
    return null;
  }
  try {
    final Response<List<int>> response = await dio.get<List<int>>(
      previewUrl,
      cancelToken: cancelToken,
      options: Options(
        responseType: ResponseType.bytes,
        validateStatus: (int? status) => status == 200,
      ),
    );
    final List<int>? data = response.data;
    if (data == null || data.isEmpty) {
      return null;
    }
    if (data is Uint8List) {
      return data;
    }
    return Uint8List.fromList(data);
  } on DioException {
    return null;
  }
}
