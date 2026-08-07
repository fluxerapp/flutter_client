import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';
import 'package:fluxer_app/features/voice/tts/tts_should_speak.dart';
import 'package:test/test.dart';

void main() {
  group('tts_rate_utils', () {
    test('clampTtsRate bounds values', () {
      expect(clampTtsRate(0), kMinTtsRate);
      expect(clampTtsRate(5), kMaxTtsRate);
      expect(clampTtsRate(1.2), 1.2);
    });

    test('nearestTtsRate picks closest option', () {
      expect(nearestTtsRate(0.12), 0.1);
      expect(nearestTtsRate(0.8), 1.0);
      expect(nearestTtsRate(1.4), 1.5);
    });
  });

  group('shouldSpeakIncomingMessage', () {
    test('never mode only speaks explicit tts when enabled', () {
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.never,
          enableTtsCommand: true,
          isExplicitTts: true,
          isSelf: false,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '2',
        ),
        isTrue,
      );
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.never,
          enableTtsCommand: true,
          isExplicitTts: false,
          isSelf: false,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '1',
        ),
        isFalse,
      );
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.never,
          enableTtsCommand: false,
          isExplicitTts: true,
          isSelf: false,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '1',
        ),
        isFalse,
      );
    });

    test('all channels mode speaks when /tts command is disabled', () {
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.forAllChannels,
          enableTtsCommand: false,
          isExplicitTts: false,
          isSelf: false,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '2',
        ),
        isTrue,
      );
    });

    test('skips own non-system messages', () {
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.forAllChannels,
          enableTtsCommand: true,
          isExplicitTts: false,
          isSelf: true,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '1',
        ),
        isFalse,
      );
    });

    test('current channel mode requires active channel match', () {
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.forCurrentChannel,
          enableTtsCommand: true,
          isExplicitTts: false,
          isSelf: false,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '2',
        ),
        isFalse,
      );
      expect(
        shouldSpeakIncomingMessage(
          mode: TtsNotificationMode.forCurrentChannel,
          enableTtsCommand: true,
          isExplicitTts: false,
          isSelf: false,
          isSystemMessage: false,
          messageChannelId: '1',
          activeChannelId: '1',
        ),
        isTrue,
      );
    });
  });
}
