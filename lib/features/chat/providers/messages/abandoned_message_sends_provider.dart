import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'abandoned_message_sends_provider.g.dart';

@Riverpod(keepAlive: true)
class AbandonedMessageSends extends _$AbandonedMessageSends {
  @override
  Set<String> build() => const <String>{};

  void abandon(String nonce) {
    state = <String>{...state, nonce};
  }

  bool reclaim(MessageResponseSchema message) {
    final String? nonce = message.nonce;
    if (nonce == null || !state.contains(nonce)) {
      return false;
    }
    state = <String>{...state}..remove(nonce);
    unawaited(
      ref
          .read(messageRepositoryProvider)
          .deleteMessage(channelId: message.channelId, messageId: message.id)
          .catchError((Object error) {
            talker.warning('[AbandonedMessageSends] delete failed: $error');
          }),
    );
    return true;
  }
}
