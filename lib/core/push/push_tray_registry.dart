import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

const int kPushTrayRegistryMaxEntries = 64;
const int kPushTrayDrainBatchSize = 8;

final class PushTrayRegistry {
  final Map<String, String> _readThroughByChannel = <String, String>{};
  final List<String> _insertionOrder = <String>[];

  void markChannelRead(String channelId, String upToMessageId) {
    if (channelId.isEmpty || upToMessageId.isEmpty) {
      return;
    }
    final String? existing = _readThroughByChannel[channelId];
    if (existing != null) {
      if (compareSnowflakeIds(upToMessageId, existing) > 0) {
        _readThroughByChannel[channelId] = upToMessageId;
      }
      return;
    }
    while (_readThroughByChannel.length >= kPushTrayRegistryMaxEntries &&
        _insertionOrder.isNotEmpty) {
      final String evicted = _insertionOrder.removeAt(0);
      _readThroughByChannel.remove(evicted);
    }
    if (_readThroughByChannel.length >= kPushTrayRegistryMaxEntries) {
      return;
    }
    _insertionOrder.add(channelId);
    _readThroughByChannel[channelId] = upToMessageId;
  }

  void markForegroundPushSuppressed(Map<String, String> payload) {
    final String? channelId = resolvePushChannelId(payload);
    final String? messageId = payload['message_id'];
    if (channelId == null || messageId == null || messageId.isEmpty) {
      return;
    }
    markChannelRead(channelId, messageId);
  }

  List<MapEntry<String, String>> drain() {
    if (_readThroughByChannel.isEmpty) {
      return const <MapEntry<String, String>>[];
    }
    final List<MapEntry<String, String>> entries = _readThroughByChannel.entries
        .toList(growable: false);
    _readThroughByChannel.clear();
    _insertionOrder.clear();
    return entries;
  }
}
