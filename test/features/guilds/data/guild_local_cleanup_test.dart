import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/data/guild_local_cleanup.dart';

void main() {
  test('keeps a community joined while the membership fetch was in flight', () {
    final Set<String> keep = guildIdsKeptAfterMembershipSync(
      apiGuildIds: {'existing'},
      localGuildIdsBeforeFetch: {'existing', 'left'},
      localGuildIdsAfterUpsert: {'existing', 'left', 'joined'},
    );

    expect(keep, {'existing', 'joined'});
  });
}
