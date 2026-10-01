import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelType.fromWire', () {
    test('maps known wire values', () {
      expect(ChannelType.fromWire(0), ChannelType.guildText);
      expect(ChannelType.fromWire(5), ChannelType.guildAnnouncement);
      expect(ChannelType.fromWire(998), ChannelType.guildLink);
    });

    test('keeps unrecognized wire values unknown', () {
      expect(ChannelType.fromWire(6), ChannelType.unknown);
      expect(ChannelType.fromWire(-1), ChannelType.unknown);
    });
  });

  group('Channel type wire', () {
    test('preserves an unrecognized wire value across copy', () {
      const Channel channel = Channel(
        id: '1',
        guildId: '2',
        name: 'future',
        type: ChannelType.unknown,
        storedTypeWire: 6,
      );
      final Channel renamed = channel.copyWith(name: 'renamed');
      expect(renamed.type, ChannelType.unknown);
      expect(renamed.typeWire, 6);
      expect(renamed.toCompanion().type.value, 6);
    });

    test('updates the stored wire when the type changes', () {
      const Channel channel = Channel(
        id: '1',
        guildId: '2',
        name: 'general',
        storedTypeWire: 6,
      );
      final Channel converted = channel.copyWith(
        type: ChannelType.guildAnnouncement,
      );
      expect(converted.typeWire, ChannelType.guildAnnouncement.wireValue);
    });
  });

  test('persistedChannelTypeWire keeps a missing sdk type unknown', () {
    expect(persistedChannelTypeWire(5), 5);
    expect(persistedChannelTypeWire(null), ChannelType.unknown.wireValue);
  });
}
