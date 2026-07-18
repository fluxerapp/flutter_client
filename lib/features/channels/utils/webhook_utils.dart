import 'dart:math';

import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/media/fluxer_media_hash.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_dart/export.dart';

const List<String> _webhookNameAdjectives = <String>[
  'Swift',
  'Calm',
  'Bright',
  'Quiet',
  'Bold',
  'Clever',
  'Gentle',
  'Lucky',
  'Merry',
  'Noble',
];

const List<String> _webhookNameAnimals = <String>[
  'Falcon',
  'Otter',
  'Badger',
  'Heron',
  'Panda',
  'Lynx',
  'Raven',
  'Walrus',
  'Cobra',
  'Finch',
];

String generateWebhookName() {
  final Random random = Random();
  final String adjective =
      _webhookNameAdjectives[random.nextInt(_webhookNameAdjectives.length)];
  final String animal =
      _webhookNameAnimals[random.nextInt(_webhookNameAnimals.length)];
  return '$adjective $animal';
}

String resolveWebhookApiPublicBase(WellKnownFluxerResponse? wellKnown) {
  final WellKnownFluxerResponseEndpoints? endpoints = wellKnown?.endpoints;
  if (endpoints != null) {
    final String apiPublic = endpoints.apiPublic.trim();
    if (apiPublic.isNotEmpty) {
      return _stripTrailingSlashes(apiPublic);
    }
    final String apiClient = endpoints.apiClient.trim();
    if (apiClient.isNotEmpty) {
      return _stripTrailingSlashes(apiClient);
    }
    final String api = endpoints.api.trim();
    if (api.isNotEmpty) {
      return _stripTrailingSlashes(api);
    }
  }
  final String fallback = InstanceEndpoints.api.trim();
  if (fallback.isNotEmpty) {
    return _stripTrailingSlashes(fallback);
  }
  return '';
}

String buildWebhookUrl({
  required String apiPublicBase,
  required String webhookId,
  required String token,
}) {
  final String base = _stripTrailingSlashes(apiPublicBase);
  return '$base/webhooks/$webhookId/$token';
}

String? resolveWebhookAvatarUrl({
  required String webhookId,
  required String? avatar,
  int size = MediaProxySizes.avatarDefault,
}) {
  if (avatar == null || avatar.isEmpty) {
    return null;
  }
  if (avatar.startsWith('data:')) {
    return avatar;
  }
  if (isAnimatedMediaHash(avatar)) {
    return FluxerMediaUrl.userAvatar(
      userId: webhookId,
      hash: avatar,
      size: size,
      animated: true,
    );
  }
  final String normalizedHash = normalizeMediaHash(avatar);
  return '${FluxerMediaUrl.userAvatar(userId: webhookId, hash: normalizedHash, size: size)}';
}

String _stripTrailingSlashes(String value) {
  return value.replaceAll(RegExp(r'/+$'), '');
}
