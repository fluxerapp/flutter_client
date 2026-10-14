import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_voice_button_visibility.dart';
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

  test('keeps voice on touch when send button preference is enabled', () {
    expect(
      shouldShowComposerVoiceButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: _emptyComposer.hasSendable,
        isEditing: _emptyComposer.isEditing,
        showMessageSendButtonPreference: true,
        isTouchPrimary: true,
      ),
      isTrue,
    );
  });

  test('hides voice on touch when composer has sendable content', () {
    expect(
      shouldShowComposerVoiceButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: true,
        isEditing: false,
        showMessageSendButtonPreference: true,
        isTouchPrimary: true,
      ),
      isFalse,
    );
  });

  test('shows send when empty composer and attachments denied', () {
    expect(
      shouldShowComposerSendButton(
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

  test('hides send when empty composer and attachments are allowed', () {
    expect(
      shouldShowComposerSendButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: _emptyComposer.hasSendable,
        isEditing: _emptyComposer.isEditing,
        showMessageSendButtonPreference:
            _emptyComposer.showMessageSendButtonPreference,
      ),
      isFalse,
    );
  });

  for (final bool canAttachFiles in <bool>[true, false]) {
    final ChannelMessagePermissions readOnly = ChannelMessagePermissions(
      isResolved: true,
      canSendMessages: false,
      canAttachFiles: canAttachFiles,
      canEmbedLinks: true,
      canUseExternalEmojis: true,
      canUseExternalStickers: true,
    );

    for (final bool isTouchPrimary in <bool>[true, false]) {
      test('read-only composer shows neither send nor voice '
          '(attach $canAttachFiles, touch $isTouchPrimary)', () {
        for (final bool hasSendable in <bool>[true, false]) {
          for (final bool preference in <bool>[true, false]) {
            expect(
              shouldShowComposerVoiceButton(
                permissions: readOnly,
                hasSendable: hasSendable,
                isEditing: false,
                showMessageSendButtonPreference: preference,
                isTouchPrimary: isTouchPrimary,
              ),
              isFalse,
            );
            expect(
              shouldShowComposerSendButton(
                permissions: readOnly,
                hasSendable: hasSendable,
                isEditing: false,
                showMessageSendButtonPreference: preference,
                isTouchPrimary: isTouchPrimary,
              ),
              isFalse,
            );
          }
        }
      });
    }
  }

  test('shows send when composer has sendable content', () {
    expect(
      shouldShowComposerSendButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: true,
        isEditing: false,
        showMessageSendButtonPreference: false,
        isTouchPrimary: true,
      ),
      isTrue,
    );
  });

  test('shows send on desktop when send button preference is enabled', () {
    expect(
      shouldShowComposerSendButton(
        permissions: ChannelMessagePermissions.all,
        hasSendable: false,
        isEditing: false,
        showMessageSendButtonPreference: true,
      ),
      isTrue,
    );
  });
}
