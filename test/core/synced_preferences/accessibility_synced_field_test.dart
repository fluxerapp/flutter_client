import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

void main() {
  group('AccessibilitySyncedField', () {
    test('roundtrips mapped appearance fields', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: true,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.hidden,
        showSelectedChannelTypingIndicator: true,
        showFadedUnreadOnMutedChannels: false,
        showFavorites: false,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.hideKeyboardHints, isTrue);
      expect(
        restored.channelTypingIndicatorMode,
        ChannelTypingIndicatorMode.hidden,
      );
      expect(restored.showSelectedChannelTypingIndicator, isTrue);
      expect(restored.showFadedUnreadOnMutedChannels, isFalse);
      expect(restored.showFavorites, isFalse);
    });

    test('maps proto channel typing indicator modes', () {
      final message = pb.SyncedPreferences(
        accessibility: accessibility_pb.AccessibilitySettings(
          channelTypingIndicatorMode: accessibility_pb
              .ChannelTypingIndicatorMode
              .CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY,
        ),
      );
      final restored = AccessibilitySyncedField.fromProto(
        message.accessibility,
      );
      expect(
        restored.channelTypingIndicatorMode,
        ChannelTypingIndicatorMode.indicatorOnly,
      );
    });
  });
}
