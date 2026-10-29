import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';

final class PushMediaInstanceUrls {
  const PushMediaInstanceUrls({
    required this.mediaBaseUrl,
    required this.staticCdn,
  });

  final String mediaBaseUrl;
  final String staticCdn;

  factory PushMediaInstanceUrls.official() {
    return const PushMediaInstanceUrls(
      mediaBaseUrl: InstanceEndpoints.defaultMedia,
      staticCdn: InstanceEndpoints.defaultStaticCdn,
    );
  }

  factory PushMediaInstanceUrls.fromSnapshot(InstanceConfigSnapshot snapshot) {
    return PushMediaInstanceUrls(
      mediaBaseUrl: snapshot.mediaBaseUrl,
      staticCdn: snapshot.staticCdnBaseUrl,
    );
  }
}

Future<PushMediaInstanceUrls> loadPushMediaInstanceUrls(
  String? targetUserId,
) async {
  if (targetUserId == null || targetUserId.isEmpty) {
    return PushMediaInstanceUrls.official();
  }
  final FluxerDatabase database = FluxerDatabase();
  try {
    final String? json = await database.authSessionDao.getInstanceSnapshotJson(
      targetUserId,
    );
    if (json == null || json.isEmpty) {
      return PushMediaInstanceUrls.official();
    }
    return PushMediaInstanceUrls.fromSnapshot(
      InstanceConfigSnapshot.fromJson(json),
    );
  } on Object {
    return PushMediaInstanceUrls.official();
  } finally {
    await database.close();
  }
}
