import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer_voice_button_visibility.dart';
import 'package:test/test.dart';

const ({bool hasSendable, bool isEditing, bool showMessageSendButtonPreference})
_emptyComposer = (
  hasSendable: false,
  isEditing: false,
  showMessageSendButtonPreference: false,
);

void main() {
  test('shows voice when empty composer and attachments allowed', () {
    expect(
      shouldShowComposerVoiceButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: _emptyComposer.hasSendable,
        isEditing: _emptyComposer.isEditing,
        showMessageSendButtonPreference:
            _emptyComposer.showMessageSendButtonPreference,
      ),
      isTrue,
    );
  });

  test('hides voice when composer has sendable content', () {
    expect(
      shouldShowComposerVoiceButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: true,
        isEditing: false,
        showMessageSendButtonPreference: false,
      ),
      isFalse,
    );
  });

  test('hides voice when editing', () {
    expect(
      shouldShowComposerVoiceButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: false,
        isEditing: true,
        showMessageSendButtonPreference: false,
      ),
      isFalse,
    );
  });

  test('hides voice when send button preference is enabled', () {
    expect(
      shouldShowComposerVoiceButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: _emptyComposer.hasSendable,
        isEditing: _emptyComposer.isEditing,
        showMessageSendButtonPreference: true,
      ),
      isFalse,
    );
  });

  test('shows send fallback when empty composer and attachments denied', () {
    expect(
      shouldShowComposerSendButtonFallback(
        permissions: const ChannelMessagePermissions(
          isResolved: true,
          canSendMessages: true,
          canAttachFiles: false,
          canEmbedLinks: true,
          canUseExternalEmojis: true,
          canUseExternalStickers: true,
        ),
        hasSendable: _emptyComposer.hasSendable,
        isEditing: _emptyComposer.isEditing,
        showMessageSendButtonPreference:
            _emptyComposer.showMessageSendButtonPreference,
      ),
      isTrue,
    );
  });

  test('hides send fallback when attachments are allowed', () {
    expect(
      shouldShowComposerSendButtonFallback(
        permissions: ChannelMessagePermissions.all,
        hasSendable: _emptyComposer.hasSendable,
        isEditing: _emptyComposer.isEditing,
        showMessageSendButtonPreference:
            _emptyComposer.showMessageSendButtonPreference,
      ),
      isFalse,
    );
  });
}
