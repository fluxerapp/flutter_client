import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/guilds/providers/user_guild_settings_data_provider.dart';

import '../../../helpers/open_test_database.dart';

Future<void> _settle() =>
    Future<void>.delayed(const Duration(milliseconds: 50));

UserGuildSettingsTableCompanion _row(
  String guildId,
  Map<String, Object?> data,
) {
  return UserGuildSettingsTableCompanion.insert(
    guildId: guildId,
    data: jsonEncode(data),
  );
}

void main() {
  late FluxerDatabase db;
  late ProviderContainer container;

  setUp(() {
    db = openTestDatabase();
    container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
  });

  tearDown(() async {
    container.dispose();
    await db.close();
  });

  test(
    'a guild never loaded before has its settings once the shared row map is warm',
    () async {
      await db.userGuildSettingsDao.upsert(
        _row('g2', <String, Object?>{
          'channel_overrides': <String, Object?>{
            'cat-1': <String, Object?>{'collapsed': true},
          },
        }),
      );
      final warm = container.listen(userGuildSettingsDataProvider, (_, _) {});
      addTearDown(warm.close);
      await _settle();

      final AsyncValue<Set<String>> collapsed = container.read(
        guildCollapsedCategoriesProvider('g2'),
      );
      expect(collapsed.hasValue, isTrue);
      expect(collapsed.requireValue, <String>{'cat-1'});
    },
  );

  test('a write to another guild does not notify this guild', () async {
    await db.userGuildSettingsDao.upsert(_row('g1', <String, Object?>{}));
    var notifications = 0;
    final sub = container.listen(
      guildCollapsedCategoriesProvider('g1'),
      (_, _) => notifications++,
      fireImmediately: true,
    );
    addTearDown(sub.close);
    await _settle();
    final int settled = notifications;

    await db.userGuildSettingsDao.upsert(
      _row('g2', <String, Object?>{'muted': true}),
    );
    await _settle();

    expect(notifications, settled);
  });
}
