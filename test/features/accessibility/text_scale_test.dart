import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('text scale helpers', () {
    test('snapChatFontSize clamps to nearest marker', () {
      expect(snapChatFontSize(13), 12);
      expect(snapChatFontSize(17), 16);
      expect(snapChatFontSize(24), 24);
      expect(snapChatFontSize(99), 24);
    });

    test('protoZoomLevelToFactor treats large values as percent', () {
      expect(protoZoomLevelToFactor(1.2), 1.2);
      expect(protoZoomLevelToFactor(120), 1.2);
    });

    test('chatMessageTextScaler caps product at 2.0', () {
      final TextScaler scaler = chatMessageTextScaler(
        const TextScaler.linear(2),
        24 / 16,
      );
      expect(scaler.scale(16), 32);
    });

    test('chatMessageTextScaler keeps the 12 setting at 0.75 (#154)', () {
      final TextScaler scaler = chatMessageTextScaler(
        TextScaler.noScaling,
        12 / 16,
      );
      expect(scaler.scale(16), 12);
    });

    test('chatMessageTextScaler leaves the default setting at 1.0', () {
      final TextScaler scaler = chatMessageTextScaler(TextScaler.noScaling, 1);
      expect(scaler.scale(16), 16);
    });

    test('chatMessageTextScaler keeps the 0.8 floor for the system scale', () {
      final TextScaler scaler = chatMessageTextScaler(
        const TextScaler.linear(0.5),
        1,
      );
      expect(scaler.scale(16), 12.8);
    });

    test('clampConstrainedUiTextScaler caps at 1.5', () {
      final TextScaler scaler = clampConstrainedUiTextScaler(
        const TextScaler.linear(2.5),
      );
      expect(scaler.scale(10), 15);
    });
  });
}
