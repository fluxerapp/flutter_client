import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';

/// Animated WebP transform of [proxyUrl] (`?format=webp&animated=true`).
///
/// The proxy may return an animated GIF for some sources; both animate
/// natively in the image pipeline.
String animatedEmbedImageUrl(String proxyUrl) =>
    buildMediaProxyUrl(proxyUrl, format: 'webp', animated: true);

/// Still-frame poster transform of [proxyUrl] (`?format=webp&animated=false`).
String staticEmbedImageUrl(String proxyUrl) =>
    buildMediaProxyUrl(proxyUrl, format: 'webp', animated: false);
