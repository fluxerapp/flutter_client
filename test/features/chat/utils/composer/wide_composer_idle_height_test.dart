import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';

double wideComposerIdleSlotHeight(
  FluxerButtonSize actionSize, {
  required bool touchPrimary,
}) {
  return WideComposerLayout.densePaddingYFor(touchPrimary: touchPrimary) * 2 +
      actionSize.height;
}

void main() {
  group('wide composer idle vs recording slot height', () {
    for (final (FluxerButtonSize actionSize, bool touchPrimary)
        in <(FluxerButtonSize, bool)>[
          (FluxerButtonSize.compact, false),
          (FluxerButtonSize.small, true),
        ]) {
      test('${actionSize.name} idle padded slot matches recording bar', () {
        expect(
          wideComposerIdleSlotHeight(actionSize, touchPrimary: touchPrimary),
          VoiceMessageRecordingBar.heightFor(
            actionSize,
            touchPrimary: touchPrimary,
          ),
        );
      });
    }

    test('mouse box fills the floating box min height exactly', () {
      expect(
        wideComposerIdleSlotHeight(
              FluxerButtonSize.compact,
              touchPrimary: false,
            ) +
            WideComposerLayout.ringWidth * 2,
        WideComposerLayout.boxMinHeight,
      );
    });
  });
}
