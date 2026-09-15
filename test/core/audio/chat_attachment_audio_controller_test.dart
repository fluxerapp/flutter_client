import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_controller.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

const Attachment _attachment = Attachment(
  id: 'attachment-id',
  url: 'https://example.com/audio.mp3',
  filename: 'audio.mp3',
  size: 1024,
);

ChatAttachmentAudioController _controller() {
  return ChatAttachmentAudioController(
    sourceUrl: _attachment.url,
    attachment: _attachment,
    title: () => _attachment.filename,
  );
}

void main() {
  tearDown(ChatAttachmentAudioController.resetForTest);

  test('factory reuses the same controller for a source url', () {
    final ChatAttachmentAudioController first = _controller();
    final ChatAttachmentAudioController second = _controller();

    expect(identical(first, second), isTrue);
  });

  test('detach drops an idle controller', () {
    _controller().detach();

    expect(
      ChatAttachmentAudioController.debugContainsSource(_attachment.url),
      isFalse,
    );
  });

  test('detach keeps a playing controller so remounts can reattach', () {
    final ChatAttachmentAudioController controller = _controller()
      ..debugSetPlaying()
      ..detach();

    expect(
      ChatAttachmentAudioController.debugContainsSource(_attachment.url),
      isTrue,
    );

    final ChatAttachmentAudioController reattached = _controller();
    expect(identical(controller, reattached), isTrue);
    expect(reattached.isPlaying, isTrue);
  });
}
