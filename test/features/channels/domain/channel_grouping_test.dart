import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';

void main() {
  test('groups text and link channels before voice channels like desktop', () {
    final categories = groupChannelsIntoCategories([
      _channel('voice-root', type: ChannelType.guildVoice, position: 1),
      _channel('text-root', position: 2),
      _channel('link-root', type: ChannelType.guildLink, position: 3),
      _channel('cat', type: ChannelType.guildCategory, position: 4),
      _channel(
        'voice-child',
        type: ChannelType.guildVoice,
        position: 5,
        parentId: 'cat',
      ),
      _channel('text-child', position: 6, parentId: 'cat'),
      _channel(
        'link-child',
        type: ChannelType.guildLink,
        position: 7,
        parentId: 'cat',
      ),
    ]);

    expect(categories, hasLength(2));
    expect(categories[0].channels.map((channel) => channel.id), [
      'text-root',
      'link-root',
      'voice-root',
    ]);
    expect(categories[1].channels.map((channel) => channel.id), [
      'text-child',
      'link-child',
      'voice-child',
    ]);
  });

  test('keeps position order within each channel type bucket', () {
    final categories = groupChannelsIntoCategories([
      _channel('voice-2', type: ChannelType.guildVoice, position: 4),
      _channel('text-2', position: 3),
      _channel('voice-1', type: ChannelType.guildVoice, position: 2),
      _channel('text-1', position: 1),
    ]);

    expect(categories.single.channels.map((channel) => channel.id), [
      'text-1',
      'text-2',
      'voice-1',
      'voice-2',
    ]);
  });

  test('breaks position ties by id', () {
    final categories = groupChannelsIntoCategories([
      _channel('b', position: 5),
      _channel('a', position: 5),
    ]);

    expect(categories.single.channels.map((channel) => channel.id), ['a', 'b']);
  });

  test('orders category headers by position', () {
    final categories = groupChannelsIntoCategories([
      _channel('cat-b', type: ChannelType.guildCategory, position: 2),
      _channel('cat-a', type: ChannelType.guildCategory, position: 1),
    ]);

    expect(categories.map((category) => category.id), ['cat-a', 'cat-b']);
  });
}

Channel _channel(
  String id, {
  ChannelType type = ChannelType.guildText,
  int position = 0,
  String? parentId,
}) {
  return Channel(
    id: id,
    guildId: 'guild',
    name: id,
    type: type,
    position: position,
    parentId: parentId,
  );
}
