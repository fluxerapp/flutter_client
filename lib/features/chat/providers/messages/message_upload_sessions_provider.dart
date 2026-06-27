import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_upload_sessions_provider.g.dart';

@Riverpod(keepAlive: true)
class MessageUploadSessions extends _$MessageUploadSessions {
  @override
  Map<String, MessageUploadSession> build() {
    return <String, MessageUploadSession>{};
  }

  MessageUploadSession? sessionFor(String nonce) => state[nonce];

  void createSession({
    required String nonce,
    required String channelId,
    required List<PendingAttachment> attachments,
  }) {
    state = <String, MessageUploadSession>{
      ...state,
      nonce: MessageUploadSession(
        nonce: nonce,
        channelId: channelId,
        attachments: List<PendingAttachment>.from(attachments),
      ),
    };
  }

  void updateSendingProgress(String nonce, double percent) {
    final MessageUploadSession? session = state[nonce];
    if (session == null) {
      return;
    }
    state = <String, MessageUploadSession>{
      ...state,
      nonce: session.copyWith(sendingProgress: percent.clamp(0, 100)),
    };
  }

  void updateSessionAttachments(
    String nonce,
    List<PendingAttachment> attachments, {
    bool recomputeSendingProgress = false,
  }) {
    final MessageUploadSession? session = state[nonce];
    if (session == null) {
      return;
    }
    final double? sendingProgress = recomputeSendingProgress
        ? computeMessageUploadSendingProgressFromAttachments(attachments)
        : session.sendingProgress;
    state = <String, MessageUploadSession>{
      ...state,
      nonce: session.copyWith(
        attachments: attachments,
        sendingProgress: sendingProgress,
      ),
    };
  }

  void removeSession(String nonce) {
    if (!state.containsKey(nonce)) {
      return;
    }
    final Map<String, MessageUploadSession> next =
        Map<String, MessageUploadSession>.from(state)..remove(nonce);
    state = next;
  }
}

@riverpod
MessageUploadSession? messageUploadSession(Ref ref, String nonce) {
  return ref.watch(messageUploadSessionsProvider)[nonce];
}
