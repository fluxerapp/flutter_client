import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'abandoned_message_sends_provider.g.dart';

const List<Duration> _kUnseenLookupBackoff = <Duration>[
  Duration(seconds: 2),
  Duration(seconds: 5),
  Duration(seconds: 15),
  Duration(seconds: 30),
  Duration(minutes: 1),
  Duration(minutes: 2),
];

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

  Future<void> reclaimUnseen({
    required String nonce,
    required String channelId,
    required String content,
    required List<String> attachmentFilenames,
  }) async {
    abandon(nonce);
    for (final Duration delay in _kUnseenLookupBackoff) {
      if (_reclaims.containsKey(nonce)) {
        return;
      }
      try {
        final String? messageId = await ref
            .read(messageRepositoryProvider)
            .findUnseenOwnSend(
              channelId: channelId,
              clientNonce: nonce,
              content: content,
              attachmentFilenames: attachmentFilenames,
            );
        if (messageId == null) {
          return;
        }
        await reclaim(nonce: nonce, channelId: channelId, messageId: messageId);
        if (_reclaims.containsKey(nonce)) {
          return;
        }
      } on Object catch (error) {
        talker.warning('[AbandonedMessageSends] lookup failed: $error');
      }
      await Future<void>.delayed(delay);
    }
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
