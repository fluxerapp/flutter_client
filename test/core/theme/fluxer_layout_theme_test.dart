import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';

void main() {
  test('bottom nav height never shrinks below its unscaled content', () {
    expect(
      FluxerLayoutTheme.scaled(scaleFactor: 0.5).mobileBottomNavHeight,
      60,
    );
    expect(
      FluxerLayoutTheme.scaled(scaleFactor: 0.75).mobileBottomNavHeight,
      60,
    );
    expect(FluxerLayoutTheme.scaled().mobileBottomNavHeight, 60);
    expect(
      FluxerLayoutTheme.scaled(scaleFactor: 1.5).mobileBottomNavHeight,
      90,
    );
  });
}
