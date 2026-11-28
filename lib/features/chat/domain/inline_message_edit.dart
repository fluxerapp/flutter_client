import 'package:fluxer_app/features/chat/domain/message.dart';

class InlineMessageEdit {
  const InlineMessageEdit({
    required this.message,
    required this.text,
    this.focusPending = true,
  });

  final Message message;
  final String text;
  final bool focusPending;

  String get channelId => message.channelId;
  String get messageId => message.id;

  InlineMessageEdit copyWith({String? text, bool? focusPending}) =>
      InlineMessageEdit(
        message: message,
        text: text ?? this.text,
        focusPending: focusPending ?? this.focusPending,
      );
}
