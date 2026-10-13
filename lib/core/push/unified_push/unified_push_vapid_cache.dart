import 'package:fluxer_app/core/database/fluxer_database.dart';

bool hasUnifiedPushVapid(String? vapid) => vapid != null && vapid.isNotEmpty;

Future<String?> readCachedUnifiedPushVapidPublicKey(String instanceId) async {
  final FluxerDatabase database = FluxerDatabase();
  try {
    return await database.mobilePushRegistrationDao.getVapidForInstance(
      instanceId,
    );
  } finally {
    await database.close();
  }
}

Future<void> writeCachedUnifiedPushVapidPublicKey(
  String instanceId,
  String vapidPublicKey,
) async {
  if (instanceId.isEmpty || vapidPublicKey.isEmpty) {
    return;
  }
  final FluxerDatabase database = FluxerDatabase();
  try {
    await database.mobilePushRegistrationDao.saveVapidForInstance(
      instanceId: instanceId,
      vapidPublicKey: vapidPublicKey,
    );
  } finally {
    await database.close();
  }
}
