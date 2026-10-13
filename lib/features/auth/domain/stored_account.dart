import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';

class StoredAccount {
  final String userId;
  final String? username;
  final String? discriminator;
  final String? avatar;
  final bool isValid;
  final String? displayDomain;
  final String mediaBaseUrl;

  const StoredAccount({
    required this.userId,
    required this.isValid,
    required this.mediaBaseUrl,
    this.username,
    this.discriminator,
    this.avatar,
    this.displayDomain,
  });

  String get displayName => username ?? userId;

  String get identifier {
    final String? tag = discriminator;
    if (tag == null || !shouldShowDiscriminator(tag, uniqueUsernames: true)) {
      return displayName;
    }
    return '$displayName#$tag';
  }

  String? avatarUrl({int size = MediaProxySizes.avatarDefault}) {
    return FluxerMediaUrl.userAvatar(
      userId: userId,
      hash: avatar,
      size: size,
      mediaBaseUrl: mediaBaseUrl,
    );
  }

  String get instanceDomain {
    final String raw =
        displayDomain ?? InstanceConfigSnapshot.officialDefault().displayDomain;
    return const InstanceEndpointNormalizer().formatDisplayDomain(raw);
  }

  bool get isOfficialInstance =>
      instanceDomain == InstanceConfigSnapshot.officialDefault().displayDomain;
}
