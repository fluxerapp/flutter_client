import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_focus_layout_metrics.dart';

void main() {
  group('voiceFocusMiniGridColumnCount', () {
    test('steps up at 620, 760, and 1040', () {
      expect(voiceFocusMiniGridColumnCount(619), 1);
      expect(voiceFocusMiniGridColumnCount(620), 2);
      expect(voiceFocusMiniGridColumnCount(760), 3);
      expect(voiceFocusMiniGridColumnCount(1040), 4);
    });
  });

  group('voiceFocusShouldUseMiniGrid', () {
    test('is off on compact phone strips', () {
      expect(
        voiceFocusShouldUseMiniGrid(
          compact: true,
          containerWidth: 800,
          secondaryCount: 4,
        ),
        isFalse,
      );
    });

    test('is on for wide stages with secondary tiles', () {
      expect(
        voiceFocusShouldUseMiniGrid(
          compact: false,
          containerWidth: 620,
          secondaryCount: 2,
        ),
        isTrue,
      );
    });
  });
}
