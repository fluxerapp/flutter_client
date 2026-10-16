import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';

double wideComposerIdleSlotHeight(FluxerButtonSize actionSize) {
  return WideComposerLayout.densePaddingY * 2 + actionSize.height;
}

void main() {
  group('wide composer idle vs recording slot height', () {
    for (final FluxerButtonSize actionSize in <FluxerButtonSize>[
      FluxerButtonSize.compact,
      FluxerButtonSize.small,
    ]) {
      test('${actionSize.name} idle padded slot matches recording bar', () {
        expect(
          wideComposerIdleSlotHeight(actionSize),
          VoiceMessageRecordingBar.heightFor(actionSize),
        );
      });

      test(
        '${actionSize.name} row min height must not include outer padding',
        () {
          final double innerMinHeight = actionSize.height;
          final double paddedSlot =
              WideComposerLayout.densePaddingY * 2 + innerMinHeight;
          final double inflatedInnerMin = VoiceMessageRecordingBar.heightFor(
            actionSize,
          );

          expect(paddedSlot, VoiceMessageRecordingBar.heightFor(actionSize));
          expect(
            WideComposerLayout.densePaddingY * 2 + inflatedInnerMin,
            greaterThan(VoiceMessageRecordingBar.heightFor(actionSize)),
          );
        },
      );
    }
  });
}
