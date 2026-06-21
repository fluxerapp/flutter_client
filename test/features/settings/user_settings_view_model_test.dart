import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';

/// Offline stub for `loadProfile()`'s `client.users.getCurrentUser()`. The API
/// call returns a `Future<Never>.error` (bottom type, assignable to any
/// `Future<T>`), so `loadProfile()` suspends at its `await`, lets `build()`
/// return (initializing `state`), then fails asynchronously into its own
/// `on Exception` guard — mirroring a network failure without hitting it.
class _OfflineFluxerClient implements FluxerClient {
  @override
  final UsersApi users = _OfflineUsersApi();

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _OfflineUsersApi implements UsersApi {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      Future<Never>.error(Exception('network disabled in test'));
}

void main() {
  test(
    'userSettingsViewModel does not rebuild on presence-only writes but '
    'does on display changes',
    () async {
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'u1', username: 'alice'),
      );
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'u2', username: 'bob'),
      );

      final container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          fluxerClientProvider.overrideWithValue(_OfflineFluxerClient()),
        ],
      );
      addTearDown(container.dispose);

      // Drive the view model to watch the current user 'u1'.
      container.read(currentUserIdProvider.notifier).set('u1');

      var notifyCount = 0;
      final sub = container.listen(
        userSettingsViewModelProvider,
        (previous, next) => notifyCount++,
      );
      addTearDown(sub.close);

      // Let the watched user-row stream populate the state once.
      await pumpEventQueue();
      expect(
        container.read(userSettingsViewModelProvider).displayName,
        'alice',
      );
      final baseline = notifyCount;

      // Presence-only write to the current user re-emits the row but no
      // consumed field changes -> distinct projection filters it -> no notify.
      await db.userDao.updateUserPresence('u1', status: 'idle');
      await pumpEventQueue();
      expect(
        notifyCount,
        baseline,
        reason: 'self presence-only change must not notify',
      );

      // Presence write to a DIFFERENT user still invalidates the users table
      // (Drift streams are table-granular), re-emitting the current-user row
      // with identical projected fields -> distinct also filters this -> no
      // notify. This is the real PRESENCE_UPDATE storm being suppressed.
      await db.userDao.updateUserPresence('u2', status: 'dnd');
      await pumpEventQueue();
      expect(
        notifyCount,
        baseline,
        reason: "another user's presence write must not notify settings",
      );

      // A real display-field change must still propagate to the state.
      await db.userDao.upsertUser(
        UsersCompanion.insert(id: 'u1', username: 'alice2'),
      );
      await pumpEventQueue();
      expect(
        container.read(userSettingsViewModelProvider).displayName,
        'alice2',
      );
      expect(notifyCount, greaterThan(baseline));
    },
  );
}
