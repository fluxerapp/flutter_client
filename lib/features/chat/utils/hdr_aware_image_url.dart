import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

const Set<String> kNativeHdrImageContentTypes = {
  'image/avif',
  'image/jxl',
  'image/heic',
  'image/heif',
};

enum HdrImageProxyFormatAction { setWebp, stripFormat, unchanged }

String? _normalizedImageContentType(String? contentType) {
  if (contentType == null || contentType.isEmpty) {
    return null;
  }
  return contentType.toLowerCase().split(';').first.trim();
}

bool isNativeHdrCapableImageContentType(String? contentType) {
  final String? normalized = _normalizedImageContentType(contentType);
  if (normalized == null) {
    return false;
  }
  return kNativeHdrImageContentTypes.contains(normalized);
}

HdrImageProxyFormatAction hdrImageProxyFormatAction({
  required HdrDisplayMode mode,
  String? contentType,
}) {
  if (mode == HdrDisplayMode.standard) {
    return HdrImageProxyFormatAction.setWebp;
  }
  if (isNativeHdrCapableImageContentType(contentType)) {
    return HdrImageProxyFormatAction.stripFormat;
  }
  return HdrImageProxyFormatAction.unchanged;
}

String buildHdrAwareImageUrl({
  required String url,
  required HdrDisplayMode mode,
  String? contentType,
}) {
  if (url.isEmpty) {
    return url;
  }
  return switch (hdrImageProxyFormatAction(
    mode: mode,
    contentType: contentType,
  )) {
    HdrImageProxyFormatAction.setWebp => buildMediaProxyUrl(
      url,
      format: 'webp',
    ),
    HdrImageProxyFormatAction.stripFormat => stripMediaProxyFormat(url),
    HdrImageProxyFormatAction.unchanged => url,
  };
}

bool mediaProxyUrlIsAnimated(String url) {
  return Uri.tryParse(url)?.queryParameters['animated'] == 'true';
}

String buildHdrAwareDisplayImageUrl({
  required String url,
  required HdrDisplayMode mode,
  String? proxyUrl,
  String? contentType,
}) {
  final String source = mediaProxyUrlIsAnimated(url) ? url : (proxyUrl ?? url);
  return buildHdrAwareImageUrl(
    url: source,
    mode: mode,
    contentType: contentType,
  );
}
