import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override, ProviderListenable;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';

import '../../helpers/open_test_database.dart';

void main() {
  late db.FluxerDatabase database;
  late ProviderContainer container;

  setUp(() {
    database = openTestDatabase();
    container = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(database),
        currentUserIdProvider.overrideWithValue('me'),
      ],
    );
    addTearDown(container.dispose);
  });

  Future<T?> settle<T>(ProviderListenable<AsyncValue<T>> provider) async {
    for (int i = 0; i < 50; i++) {
      final AsyncValue<T> value = container.read(provider);
      if (value.hasValue && !value.isLoading) {
        return value.value;
      }
      await Future<void>.delayed(const Duration(milliseconds: 10));
    }
    return container.read(provider).value;
  }

  Future<void> storeMute({required bool muted, DateTime? endTime}) =>
      database.threadDao.upsertMember(
        db.ThreadMembersCompanion.insert(
          threadId: 't1',
          guildId: 'g1',
          muted: Value(muted),
          muteConfigJson: Value(
            endTime == null
                ? null
                : jsonEncode(<String, Object?>{
                    'end_time': endTime.toUtc().toIso8601String(),
                    'selected_time_window': 3600000,
                  }),
          ),
        ),
      );

  group('thread membership mute', () {
    test('a timed mute whose end_time passed reads as unmuted', () async {
      await storeMute(
        muted: true,
        endTime: DateTime.now().subtract(const Duration(minutes: 1)),
      );
      final ProviderSubscription<AsyncValue<ThreadMembership?>> sub = container
          .listen(threadMembershipProvider('t1'), (_, _) {});
      addTearDown(sub.close);

      final ThreadMembership? membership = await settle<ThreadMembership?>(
        threadMembershipProvider('t1'),
      );
      expect(membership?.muted, isFalse);
    });

    test('a mute without end_time stays muted', () async {
      await storeMute(muted: true);
      final ProviderSubscription<AsyncValue<ThreadMembership?>> sub = container
          .listen(threadMembershipProvider('t1'), (_, _) {});
      addTearDown(sub.close);

      final ThreadMembership? membership = await settle<ThreadMembership?>(
        threadMembershipProvider('t1'),
      );
      expect(membership?.muted, isTrue);
    });

    test('a timed mute flips to unmuted once end_time passes', () async {
      await storeMute(
        muted: true,
        endTime: DateTime.now().add(const Duration(milliseconds: 300)),
      );
      final ProviderSubscription<AsyncValue<ThreadMembership?>> sub = container
          .listen(threadMembershipProvider('t1'), (_, _) {});
      addTearDown(sub.close);

      expect(
        (await settle<ThreadMembership?>(
          threadMembershipProvider('t1'),
        ))?.muted,
        isTrue,
      );
      await Future<void>.delayed(const Duration(milliseconds: 500));
      expect(
        (await settle<ThreadMembership?>(
          threadMembershipProvider('t1'),
        ))?.muted,
        isFalse,
      );
    });
  });

  group('current member timeout', () {
    Future<void> storeTimeout(DateTime until) =>
        database.memberDao.upsertMember(
          db.MembersCompanion.insert(
            userId: 'me',
            guildId: 'g1',
            communicationDisabledUntil: Value(until),
          ),
        );

    test('a timeout ends once communication_disabled_until passes', () async {
      await storeTimeout(DateTime.now().add(const Duration(seconds: 2)));
      final ProviderSubscription<AsyncValue<bool>> sub = container.listen(
        currentMemberTimedOutProvider('g1'),
        (_, _) {},
      );
      addTearDown(sub.close);

      expect(await settle(currentMemberTimedOutProvider('g1')), isTrue);
      await Future<void>.delayed(const Duration(milliseconds: 2500));
      expect(await settle(currentMemberTimedOutProvider('g1')), isFalse);
    });

    test('a past timeout is not timed out', () async {
      await storeTimeout(DateTime.now().subtract(const Duration(minutes: 1)));
      final ProviderSubscription<AsyncValue<bool>> sub = container.listen(
        currentMemberTimedOutProvider('g1'),
        (_, _) {},
      );
      addTearDown(sub.close);

      expect(await settle(currentMemberTimedOutProvider('g1')), isFalse);
    });
  });
}
