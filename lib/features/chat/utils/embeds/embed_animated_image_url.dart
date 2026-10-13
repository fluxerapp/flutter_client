import 'package:fluxer_app/features/chat/utils/media/media_proxy_url.dart';

String animatedEmbedImageUrl(String proxyUrl) =>
    buildMediaProxyUrl(proxyUrl, format: 'webp', animated: true);

String staticEmbedImageUrl(String proxyUrl) =>
    buildMediaProxyUrl(proxyUrl, format: 'webp', animated: false);
