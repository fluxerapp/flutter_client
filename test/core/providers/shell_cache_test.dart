import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app/shell_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/open_test_database.dart';

void main() {
  final DateTime now = DateTime(2026, 11, 8, 12);

  group('isShellCacheFresh', () {
    test('rejects a cache that was never live', () {
      expect(isShellCacheFresh(null, now), isFalse);
    });

    test('accepts a cache live within the max age', () {
      expect(
        isShellCacheFresh(now.subtract(const Duration(days: 6)), now),
        isTrue,
      );
      expect(isShellCacheFresh(now.subtract(kShellCacheMaxAge), now), isTrue);
    });

    test('rejects a cache older than the max age', () {
      expect(
        isShellCacheFresh(
          now.subtract(kShellCacheMaxAge + const Duration(minutes: 1)),
          now,
        ),
        isFalse,
      );
    });

    test('tolerates small clock skew but rejects a future timestamp', () {
      expect(
        isShellCacheFresh(now.add(const Duration(minutes: 1)), now),
        isTrue,
      );
      expect(
        isShellCacheFresh(now.add(const Duration(hours: 1)), now),
        isFalse,
      );
    });
  });

  group('isShellCacheTrusted', () {
    Future<FluxerDatabase> seededDatabase() async {
      final FluxerDatabase db = openTestDatabase();
      await db.userSettingsDao.upsertSettings(
        UserSettingsTableCompanion.insert(userId: 'user-1', data: '{}'),
      );
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'user-1', username: 'me'),
      );
      addTearDown(db.close);
      return db;
    }

    test('trusts a cache marked live recently for its owner', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final FluxerDatabase db = await seededDatabase();
      await markShellCacheLive(now: now.subtract(const Duration(days: 1)));

      expect(await isShellCacheTrusted(db, 'user-1', now: now), isTrue);
      expect(await isShellCacheTrusted(db, 'user-2', now: now), isFalse);
    });

    test('stops trusting the cache after the max age', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final FluxerDatabase db = await seededDatabase();
      await markShellCacheLive(now: now.subtract(const Duration(days: 8)));

      expect(await isShellCacheTrusted(db, 'user-1', now: now), isFalse);
    });

    test('does not trust a cache that was never marked live', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        'shell_cache_generation': kShellCacheGeneration,
      });
      final FluxerDatabase db = await seededDatabase();

      expect(await isShellCacheTrusted(db, 'user-1', now: now), isFalse);
    });
  });
}
