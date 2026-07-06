import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';

void main() {
  test('channelResponseFromRow maps a local row to the wire format', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannels([
      const Channel(
        id: 'c1',
        guildId: 'g1',
        name: 'voice-room',
        type: ChannelType.guildVoice,
        parentId: 'cat1',
        userLimit: 5,
        permissionOverwritesJson:
            '[{"id":"role-1","type":0,"allow":"1","deny":"2"}]',
      ).toCompanion(),
    ]);
    final row = await db.channelDao.getChannelById('c1');

    final json = channelResponseFromRow(row!).toJson();

    expect(json['id'], 'c1');
    expect(json['guild_id'], 'g1');
    expect(json['parent_id'], 'cat1');
    expect(json['user_limit'], 5);
    expect(json['type'], ChannelType.guildVoice.wireValue);
    expect(json['permission_overwrites'], hasLength(1));
    expect(json.containsKey('guildId'), isFalse);
    expect(json.containsKey('parentId'), isFalse);
  });

  test('permission overwrites round-trip through decode/encode', () {
    const stored = '[{"id":"role-1","type":0,"allow":"1","deny":"2"}]';

    expect(
      encodePermissionOverwritesJson(decodePermissionOverwritesJson(stored)),
      stored,
    );
  });
}
