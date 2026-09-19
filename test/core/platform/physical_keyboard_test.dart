import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/platform/physical_keyboard.dart';

void main() {
  test('watchPhysicalKeyboardConnected emits false when unsupported', () async {
    expect(
      await watchPhysicalKeyboardConnected(supported: false).first,
      isFalse,
    );
  });
}
