import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';

void main() {
  test(
    'guildUserDisplayProvider does not touch ref after dispose mid-fetch',
    () async {
      // No user/member is seeded, so the build reaches the background member
      // fetch path that previously used `ref` after the provider was disposed.
      final db = FluxerDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);

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
}
