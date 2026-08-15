import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_app/core/media/fluxer_media_hash.dart';

enum GuildMemberMediaType {
  avatar('avatars'),
  banner('banners');

  const GuildMemberMediaType(this.path);

  final String path;
}

abstract final class FluxerMediaUrl {
  FluxerMediaUrl._();

  static const int defaultAvatarCount = 6;

  static String? defaultAvatar({required String userId}) {
    if (userId.isEmpty) {
      return null;
    }
    try {
      final BigInt index =
          BigInt.parse(userId) % BigInt.from(defaultAvatarCount);
      return '$fluxerStaticCdn/avatars/$index.png';
    } on FormatException {
      return null;
    }
  }

  static String? userAvatar({
    required String userId,
    required String? hash,
    int size = MediaProxySizes.avatarDefault,
    bool animated = false,
  }) {
    if (hash == null || hash.isEmpty) {
      return null;
    }
    if (animated && isAnimatedMediaHash(hash)) {
      return _url(
        path: 'avatars/$userId/$hash.gif',
        query: <String, String>{'animated': 'true', 'size': '$size'},
      );
    }
    final String normalizedHash = normalizeMediaHash(hash);
    return _url(
      path: 'avatars/$userId/$normalizedHash.webp',
      query: <String, String>{'size': '$size'},
    );
  }

  static String? userBanner({
    required String userId,
    required String? hash,
    int size = MediaProxySizes.profileBannerModal,
    bool animated = false,
  }) {
    if (hash == null || hash.isEmpty) {
      return null;
    }
    if (animated && isAnimatedMediaHash(hash)) {
      return _url(
        path: 'banners/$userId/$hash.gif',
        query: <String, String>{'animated': 'true', 'size': '$size'},
      );
    }
    final String normalizedHash = normalizeMediaHash(hash);
    return _url(
      path: 'banners/$userId/$normalizedHash.webp',
      query: <String, String>{'size': '$size'},
    );
  }

  static String? guildIcon({
    required String guildId,
    required String? hash,
    int size = MediaProxySizes.iconDefault,
    bool animated = false,
  }) {
    if (hash == null || hash.isEmpty) {
      return null;
    }
    if (animated && isAnimatedMediaHash(hash)) {
      return _url(
        path: 'icons/$guildId/$hash.gif',
        query: <String, String>{'animated': 'true', 'size': '$size'},
      );
    }
    if (isAnimatedMediaHash(hash)) {
      return _url(
        path: 'icons/$guildId/$hash.webp',
        query: <String, String>{'animated': 'false', 'size': '$size'},
      );
    }
    return _url(
      path: 'icons/$guildId/$hash.png',
      query: <String, String>{'size': '$size'},
    );
  }

  static String? guildBanner({
    required String guildId,
    required String? hash,
    int size = MediaProxySizes.guildBannerDefault,
    bool animated = false,
  }) {
    if (hash == null || hash.isEmpty) {
      return null;
    }
    if (animated && isAnimatedMediaHash(hash)) {
      return _url(
        path: 'banners/$guildId/$hash.gif',
        query: <String, String>{'animated': 'true', 'size': '$size'},
      );
    }
    return _url(
      path: 'banners/$guildId/$hash.png',
      query: <String, String>{'size': '$size'},
    );
  }

  static String guildMemberMedia({
    required String guildId,
    required String userId,
    required GuildMemberMediaType type,
    required String hash,
    int size = MediaProxySizes.avatarProfile,
    bool animated = false,
  }) {
    if (animated && isAnimatedMediaHash(hash)) {
      return _url(
        path: 'guilds/$guildId/users/$userId/${type.path}/$hash.gif',
        query: <String, String>{'animated': 'true', 'size': '$size'},
      );
    }
    final String normalizedHash = normalizeMediaHash(hash);
    return _url(
      path: 'guilds/$guildId/users/$userId/${type.path}/$normalizedHash.webp',
      query: <String, String>{'size': '$size'},
    );
  }

  static String customEmoji({
    required String id,
    bool animated = false,
    int? size,
  }) {
    final Map<String, String> query = <String, String>{};
    if (animated) {
      query['animated'] = 'true';
    } else {
      query['quality'] = 'lossless';
    }
    if (size != null) {
      query['size'] = '$size';
    }
    return _url(path: 'emojis/$id.webp', query: query);
  }

  static String sticker({
    required String id,
    bool animated = false,
    int size = 320,
  }) {
    final int safeSize = size == 320 ? 320 : 160;
    final Map<String, String> query = <String, String>{'size': '$safeSize'};
    if (animated) {
      query['animated'] = 'true';
    }
    return _url(path: 'stickers/$id.webp', query: query);
  }

  static String? guildSplash({
    required String guildId,
    required String? hash,
    int size = MediaProxySizes.guildBannerDefault,
  }) {
    if (hash == null || hash.isEmpty) {
      return null;
    }
    return _url(
      path: 'splashes/$guildId/$hash.png',
      query: <String, String>{'size': '$size'},
    );
  }

  static String? guildEmbedSplash({
    required String guildId,
    required String? hash,
    int size = MediaProxySizes.guildEmbedSplashDefault,
  }) {
    if (hash == null || hash.isEmpty) {
      return null;
    }
    return _url(
      path: 'embed-splashes/$guildId/$hash.webp',
      query: <String, String>{'size': '$size'},
    );
  }

  static String _url({
    required String path,
    Map<String, String> query = const <String, String>{},
  }) {
    if (query.isEmpty) {
      return '$fluxerMediaCdn/$path';
    }
    final String queryString = query.entries
        .map((MapEntry<String, String> entry) => '${entry.key}=${entry.value}')
        .join('&');
    return '$fluxerMediaCdn/$path?$queryString';
  }
}
