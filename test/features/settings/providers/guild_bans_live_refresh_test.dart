import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/data/guild_settings_repository.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_bans_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_bans_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/known_guild_bans_provider.dart';
import 'package:fluxer_dart/export.dart';

class _CountingGuildSettingsRepository implements GuildSettingsRepository {
  int listBansCalls = 0;

  @override
  Future<List<GuildBanResponse>> listBans(String guildId) async {
    listBansCalls += 1;
    return const <GuildBanResponse>[];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('a burst of ban events refetches the ban list once', () {
    fakeAsync((FakeAsync async) {
      final _CountingGuildSettingsRepository repository =
          _CountingGuildSettingsRepository();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          guildSettingsRepositoryProvider.overrideWithValue(repository),
        ],
      );
      final ProviderSubscription<AsyncValue<GuildBansState>> subscription =
          container.listen(guildBansProvider('g1'), (_, _) {});
      async.flushMicrotasks();
      expect(repository.listBansCalls, 1);

      final KnownGuildBans bans = container.read(
        knownGuildBansProvider.notifier,
      );
      for (int index = 0; index < 50; index += 1) {
        bans.noteBan('g1', 'u$index');
        async.elapse(const Duration(milliseconds: 20));
      }
      async.elapse(const Duration(seconds: 1));
      expect(repository.listBansCalls, 2);

      subscription.close();
      container.dispose();
    });
  });
}
