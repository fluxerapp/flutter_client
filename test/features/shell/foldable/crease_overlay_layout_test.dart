import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/features/shell/foldable/crease_overlay_layout.dart';
import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  test('pinnedSidebarWidthForPosture aligns book hinge to gutter', () {
    const Size window = Size(750, 832);
    final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();
    const DeviceFoldPosture posture = DeviceFoldPosture(
      kind: FoldPostureKind.book,
      hingeBounds: Rect.fromLTWH(360, 0, 24, 832),
      splitSidebarAtHinge: true,
    );
    expect(
      pinnedSidebarWidthForPosture(
        window: window,
        layout: layout,
        posture: posture,
      ),
      372,
    );
  });

  test('pinnedSidebarWidthForPosture stays compact when flat on Duo', () {
    const Size window = Size(669, 951);
    final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();
    const DeviceFoldPosture posture = DeviceFoldPosture(
      kind: FoldPostureKind.book,
      hingeBounds: Rect.fromLTWH(320, 0, 24, 951),
    );
    final double width = pinnedSidebarWidthForPosture(
      window: window,
      layout: layout,
      posture: posture,
    );
    expect(width, layout.guildListWidth + layout.sidebarWidth);
  });

  test('shiftOffHingeForPoint moves centered surface off vertical hinge', () {
    const Size window = Size(750, 832);
    const Rect hinge = Rect.fromLTWH(360, 0, 24, 832);
    final Offset shift = shiftOffHingeForPoint(
      window: window,
      hinge: hinge,
      point: const Offset(375, 400),
      childSize: const Size(400, 200),
    );
    expect(shift.dx, isNot(0));
    final Rect surface = Rect.fromCenter(
      center: const Offset(375, 400) + shift,
      width: 400,
      height: 200,
    );
    expect(surface.overlaps(hinge.inflate(8)), isFalse);
  });
}
