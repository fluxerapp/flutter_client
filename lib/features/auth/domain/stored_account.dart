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
  final String? email;
  final bool usernameSignIn;

  const StoredAccount({
    required this.userId,
    required this.isValid,
    required this.mediaBaseUrl,
    this.username,
    this.discriminator,
    this.avatar,
    this.displayDomain,
    this.email,
    this.usernameSignIn = false,
  });

  String get displayName => username ?? userId;

  String get identifier {
    final String? tag = discriminator;
    if (tag == null || !shouldShowDiscriminator(tag, uniqueUsernames: true)) {
      return displayName;
    }
    return '$displayName#$tag';
  }

  String get signInLogin => usernameSignIn ? identifier : email ?? '';

  bool matchesSignInLogin(String login) {
    final String typed = login.trim().toLowerCase();
    return typed == signInLogin.toLowerCase() || typed == email?.toLowerCase();
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
