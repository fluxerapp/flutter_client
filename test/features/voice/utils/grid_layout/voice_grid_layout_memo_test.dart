import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_memo.dart';

void main() {
  test('recomputes only when the key changes', () {
    final VoiceGridLayoutMemo<(int, bool), String> memo =
        VoiceGridLayoutMemo<(int, bool), String>();
    int computed = 0;
    String resolve(int count, {required bool compact}) =>
        memo.resolve((count, compact), () {
          computed++;
          return '$count $compact';
        });

    expect(resolve(1, compact: true), '1 true');
    expect(resolve(1, compact: true), '1 true');
    expect(computed, 1);
    expect(resolve(1, compact: false), '1 false');
    expect(computed, 2);
  });
}
