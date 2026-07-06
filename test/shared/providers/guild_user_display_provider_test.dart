import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';

void main() {
  test(
    'guildUserDisplayProvider does not touch ref after dispose mid-fetch',
    () async {
      // No user/member is seeded, so the build reaches the background member
      // fetch path that previously used `ref` after the provider was disposed.
      final db = openTestDatabase();

      final errors = <Object>[];
      await runZonedGuarded(() async {
        final container = ProviderContainer(
          overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
        );
        // Kick off the build; it suspends on the async DB reads.
        final initial = container.read(
          guildUserDisplayProvider(('user-1', 'guild-1')),
        );
        expect(initial.isLoading, isTrue);
        // Dispose while those reads are still pending so the build resumes
        // on a disposed ref.
        container.dispose();
        // Let the pending build resume and reach the fetch trigger.
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }, (error, _) => errors.add(error));

      expect(errors, isEmpty);
    },
  );

  test('guildUserDisplayProvider re-emits when the watched user row '
      'changes', () async {
    final db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice'),
    );

    final container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    final names = <String?>[];
    final sub = container.listen(
      guildUserDisplayProvider(('user-1', null)),
      (previous, next) => names.add(next.value?.displayName),
      fireImmediately: true,
    );
    addTearDown(sub.close);

    await pumpEventQueue();
    expect(names.last, 'alice');

    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice2'),
    );
    await pumpEventQueue();
    expect(names.last, 'alice2');
  });

  test('guildUserDisplayProvider dedupes presence-only changes but '
      'notifies on display changes', () async {
    final db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice'),
    );

    final container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    var notifyCount = 0;
    final sub = container.listen(
      guildUserDisplayProvider(('user-1', null)),
      (previous, next) => notifyCount++,
    );
    addTearDown(sub.close);

    // Let the watched stream settle to its first data emission.
    await pumpEventQueue();
    final initial = container.read(guildUserDisplayProvider(('user-1', null)));
    expect(initial.value?.displayName, 'alice');
    final baseline = notifyCount;

    // A presence-only write changes the user row but no display field, so the
    // recomputed GuildUserDisplay is value-equal and must not notify.
    await db.userDao.updateUserPresence('user-1', status: 'idle');
    await pumpEventQueue();
    expect(
      notifyCount,
      baseline,
      reason: 'presence-only change should be deduped by value equality',
    );

    // A real display-field change (username -> displayName) must propagate.
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'user-1', username: 'alice2'),
    );
    await pumpEventQueue();
    expect(
      notifyCount,
      greaterThan(baseline),
      reason: 'display-field change must still notify',
    );
  });
}
