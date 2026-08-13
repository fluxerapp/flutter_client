import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

class FocusedMessageState {
  const FocusedMessageState({this.messageId, this.channelId});

  final String? messageId;
  final String? channelId;

  bool get hasFocus => messageId != null && messageId!.isNotEmpty;
}

class FocusedMessageNotifier extends Notifier<FocusedMessageState> {
  @override
  FocusedMessageState build() => const FocusedMessageState();

  void focus({required String messageId, required String channelId}) {
    state = FocusedMessageState(messageId: messageId, channelId: channelId);
  }

  void clear() {
    if (!state.hasFocus) {
      return;
    }
    state = const FocusedMessageState();
  }

  void clearIfChannel(String channelId) {
    if (state.channelId == channelId) {
      clear();
    }
  }
}

final focusedMessageProvider =
    NotifierProvider<FocusedMessageNotifier, FocusedMessageState>(
      FocusedMessageNotifier.new,
    );

Message? lookupFocusedMessage(
  FocusedMessageState focus,
  Iterable<Message> messages,
) {
  if (!focus.hasFocus || focus.messageId == null) {
    return null;
  }
  for (final Message message in messages) {
    if (message.id == focus.messageId) {
      return message;
    }
  }
  return null;
}
