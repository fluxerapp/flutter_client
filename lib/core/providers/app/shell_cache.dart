import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int kShellCacheGeneration = 1;

const Duration kShellCacheMaxAge = Duration(days: 7);

const Duration _kShellCacheClockSkewTolerance = Duration(minutes: 5);

const String _kShellCacheGenerationKey = 'shell_cache_generation';

const String _kShellCacheLiveAtKey = 'shell_cache_live_at';

Future<void> markShellCacheLive({DateTime? now}) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setInt(_kShellCacheGenerationKey, kShellCacheGeneration);
  await preferences.setInt(
    _kShellCacheLiveAtKey,
    (now ?? DateTime.now()).millisecondsSinceEpoch,
  );
}

bool isShellCacheFresh(DateTime? liveAt, DateTime now) {
  if (liveAt == null) {
    return false;
  }
  if (liveAt.isAfter(now.add(_kShellCacheClockSkewTolerance))) {
    return false;
  }
  return now.difference(liveAt) <= kShellCacheMaxAge;
}

Future<bool> isShellCacheMarkedFresh({DateTime? now}) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.getInt(_kShellCacheGenerationKey) != kShellCacheGeneration) {
    return false;
  }
  final int? liveAtMs = preferences.getInt(_kShellCacheLiveAtKey);
  return isShellCacheFresh(
    liveAtMs == null ? null : DateTime.fromMillisecondsSinceEpoch(liveAtMs),
    now ?? DateTime.now(),
  );
}

Future<bool> isShellCacheTrusted(
  FluxerDatabase database,
  String userId, {
  DateTime? now,
}) async {
  if (!await isShellCacheMarkedFresh(now: now)) {
    return false;
  }
  if (await database.userSettingsDao.getSettings(userId) == null) {
    return false;
  }
  return await database.userDao.getUserById(userId) != null;
}
