import 'package:flutter/material.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_synced_field.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/tts/tts_text_formatter.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:test/test.dart';

void main() {
  final FluxerLocalizations l10n = lookupFluxerLocalizations(
    const Locale('en'),
  );

  group('formatMessageContentForTts', () {
    test('strips markdown and substitutes mentions', () {
      final String result = formatMessageContentForTts(
        content: '**hello** <@123> ||secret|| `code`',
        l10n: l10n,
      );
      expect(result, contains('hello'));
      expect(result, contains(l10n.ttsSubstitutionUnknownUser));
      expect(result, contains(l10n.ttsSubstitutionSpoiler));
      expect(result, contains('code'));
    });
  });

  group('AccessibilitySyncedField tts prefs', () {
    test('roundtrips enableTtsCommand and ttsRate', () {
      const AccessibilityLocalState state = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        advanced: AdvancedAccessibilityLocalState(
          enableTextSelection: false,
          voiceChannelJoinRequiresDoubleClick: false,
          confirmBeforeJoiningVoiceChannels: false,
          showGifIndicator: true,
          showAttachmentExpiryIndicator: true,
          showMessageActionBar: true,
          showMessageActionBarQuickReactions: true,
          showMessageActionBarShiftExpand: true,
          showMessageActionBarOnlyMoreButton: false,
          showGifButton: true,
          showMemesButton: true,
          showStickersButton: true,
          showEmojiButton: true,
          showMessageSendButton: false,
          scrollToBottomOnMessageSend: true,
        ),
        enableTtsCommand: false,
        ttsRate: 1.5,
      );

      final roundtripped = AccessibilitySyncedField.fromProto(
        AccessibilitySyncedField.toProto(state),
      );

      expect(roundtripped.enableTtsCommand, isFalse);
      expect(roundtripped.ttsRate, 1.5);
    });
  });
}
