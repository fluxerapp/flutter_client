import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';

class StoredAccount {
  final String userId;
  final String? username;
  final String? discriminator;
  final String? avatar;
  final bool isValid;
  final DateTime lastActive;
  final String? displayDomain;

  const StoredAccount({
    required this.userId,
    required this.isValid,
    required this.lastActive,
    this.username,
    this.discriminator,
    this.avatar,
    this.displayDomain,
  });

  String get displayName => username ?? userId;

  String get identifier =>
      discriminator != null ? '$displayName#$discriminator' : displayName;

  String get instanceDomain {
    final String raw =
        displayDomain ?? InstanceConfigSnapshot.officialDefault().displayDomain;
    return const InstanceEndpointNormalizer().formatDisplayDomain(raw);
  }

  bool get isOfficialInstance =>
      instanceDomain == InstanceConfigSnapshot.officialDefault().displayDomain;
}
