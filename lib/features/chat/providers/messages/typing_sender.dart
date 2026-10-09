import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'typing_sender.g.dart';

const Duration kTypingThrottle = Duration(seconds: 8);

@Riverpod(keepAlive: true)
class TypingSender extends _$TypingSender {
  final Map<String, DateTime> _lastSentAt = <String, DateTime>{};

  @override
  void build() {}

  Future<void> notifyUserTyping(String channelId) async {
    if (channelId.isEmpty) {
      return;
    }
    final now = DateTime.now();
    final lastSent = _lastSentAt[channelId];
    if (lastSent != null && now.difference(lastSent) < kTypingThrottle) {
      return;
    }
    _lastSentAt[channelId] = now;
    try {
      await ref
          .read(fluxerClientProvider)
          .channels
          .indicateTyping(channelId: channelId);
    } on Exception catch (err) {
      debugPrint('[TypingSender] Failed to send typing for $channelId: $err');
    }
  }
}
