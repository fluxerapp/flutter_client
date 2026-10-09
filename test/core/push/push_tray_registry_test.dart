import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_tray_registry.dart';

void main() {
  group('PushTrayRegistry', () {
    test('merges read-through to max snowflake per channel', () {
      const String channelId = '1234567890123456789';
      const String older = '1234567890123456780';
      const String newer = '1234567890123456790';
      final PushTrayRegistry registry = PushTrayRegistry()
        ..markChannelRead(channelId, newer)
        ..markChannelRead(channelId, older);
      final List<MapEntry<String, String>> drained = registry.drain();
      expect(drained, hasLength(1));
      expect(drained.single.key, channelId);
      expect(drained.single.value, newer);
      expect(registry.drain(), isEmpty);
    });

    test('drain clears entries', () {
      final PushTrayRegistry registry = PushTrayRegistry()
        ..markChannelRead('1', '10')
        ..markChannelRead('2', '20');
      expect(registry.drain(), hasLength(2));
      expect(registry.drain(), isEmpty);
    });

    test('markForegroundPushSuppressed reads channel and message ids', () {
      final PushTrayRegistry registry = PushTrayRegistry()
        ..markForegroundPushSuppressed(<String, String>{
          'channel_id': '42',
          'message_id': '99',
        });
      final List<MapEntry<String, String>> drained = registry.drain();
      expect(drained.single.key, '42');
      expect(drained.single.value, '99');
    });

    test('evicts oldest when over capacity', () {
      final PushTrayRegistry registry = PushTrayRegistry();
      for (var i = 0; i < kPushTrayRegistryMaxEntries; i++) {
        registry.markChannelRead('c$i', '${i + 1}');
      }
      registry.markChannelRead('overflow', '9999');
      final List<MapEntry<String, String>> drained = registry.drain();
      expect(drained, hasLength(kPushTrayRegistryMaxEntries));
      expect(drained.any((e) => e.key == 'c0'), isFalse);
      expect(drained.any((e) => e.key == 'overflow'), isTrue);
    });
  });
}
