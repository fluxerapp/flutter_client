import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/material_ui.dart';

String buildMediaProxyUrl(
  String originalUrl, {
  int? width,
  int? height,
  String? format,
  String? quality,
  bool? animated,
}) {
  if (originalUrl.isEmpty) {
    return originalUrl;
  }
  final Uri? parsed = Uri.tryParse(originalUrl);
  if (parsed == null ||
      !parsed.hasScheme ||
      (parsed.scheme != 'http' && parsed.scheme != 'https')) {
    return originalUrl;
  }
  final Map<String, String> query = Map<String, String>.from(
    parsed.queryParameters,
  );
  if (format != null) {
    query['format'] = format;
  }
  if (width != null) {
    query['width'] = width.toString();
  }
  if (height != null) {
    query['height'] = height.toString();
  }
  if (quality != null) {
    query['quality'] = quality;
  }
  if (animated != null) {
    query['animated'] = animated.toString();
  }
  return parsed.replace(queryParameters: query).toString();
}

String stripMediaProxyFormat(String originalUrl) {
  if (originalUrl.isEmpty) {
    return originalUrl;
  }
  final Uri? parsed = Uri.tryParse(originalUrl);
  if (parsed == null ||
      !parsed.hasScheme ||
      (parsed.scheme != 'http' && parsed.scheme != 'https')) {
    return originalUrl;
  }
  final Map<String, String> query = Map<String, String>.from(
    parsed.queryParameters,
  );
  if (!query.containsKey('format')) {
    return originalUrl;
  }
  query.remove('format');
  return parsed.replace(queryParameters: query).toString();
}

/// CDN still frame for inline video posters (WebP over thumbhash).
String? buildAttachmentVideoPosterUrl({
  required String proxyOrUrl,
  required int? attachmentWidth,
  required int? attachmentHeight,
  required FluxerMediaDimensions layoutDimensions,
}) {
  final String trimmed = proxyOrUrl.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  if (trimmed.startsWith('blob:')) {
    return null;
  }
  final Uri? uri = Uri.tryParse(trimmed);
  if (uri == null || (uri.scheme != 'http' && uri.scheme != 'https')) {
    return null;
  }
  final Size? constrained = constrainMediaSize(
    dimensions: layoutDimensions,
    width: attachmentWidth,
    height: attachmentHeight,
  );
  return buildMediaProxyUrl(
    trimmed,
    format: 'webp',
    width: constrained?.width.round(),
    height: constrained?.height.round(),
  );
}
