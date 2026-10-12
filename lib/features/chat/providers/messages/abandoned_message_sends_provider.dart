import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'abandoned_message_sends_provider.g.dart';

@Riverpod(keepAlive: true)
class AbandonedMessageSends extends _$AbandonedMessageSends {
  final Map<String, Future<void>> _reclaims = <String, Future<void>>{};

  @override
  Set<String> build() => const <String>{};

  void abandon(String nonce) {
    state = <String>{...state, nonce};
  }

  bool isAbandoned(String? nonce) => nonce != null && state.contains(nonce);

  Future<void> reclaim({
    required String nonce,
    required String channelId,
    required String messageId,
  }) {
    if (!state.contains(nonce)) {
      return Future<void>.value();
    }
    return _reclaims[nonce] ??= _delete(nonce, channelId, messageId);
  }

  Future<void> _delete(String nonce, String channelId, String messageId) async {
    try {
      await ref
          .read(messageRepositoryProvider)
          .deleteMessage(channelId: channelId, messageId: messageId);
    } on Object catch (error) {
      unawaited(_reclaims.remove(nonce));
      talker.warning('[AbandonedMessageSends] delete failed: $error');
    }
  }
}
