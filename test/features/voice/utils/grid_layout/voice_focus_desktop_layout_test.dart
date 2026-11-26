import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/focus_desktop_layout.dart';

void main() {
  group('resolveVoiceFocusDesktopLayout', () {
    VoiceFocusDesktopLayout resolve({
      required bool members,
      double? preferred,
    }) => resolveVoiceFocusDesktopLayout(
      container: const Size(1400, 900),
      headerHeight: 56,
      controlClearance: voiceFocusControlClearancePx,
      showMembersRow: members,
      preferredMembersRowHeight: preferred,
    );

    test('fills the whole stage when the members row is hidden', () {
      final VoiceFocusDesktopLayout layout = resolve(members: false);
      expect(layout.membersRowRect, isNull);
      expect(layout.mainRect.width, 1400);
      expect(layout.mainRect.center.dy, closeTo(450, 0.01));
    });

    test('keeps the main tile between the header and members row', () {
      final VoiceFocusDesktopLayout layout = resolve(members: true);
      final Rect row = layout.membersRowRect!;
      expect(row.bottom, 900 - voiceFocusControlClearancePx);
      expect(layout.mainRect.top, greaterThanOrEqualTo(56));
      expect(layout.mainRect.bottom, lessThanOrEqualTo(row.top));
    });

    test('clamps a resized members row', () {
      expect(resolve(members: true, preferred: 10).membersRowRect!.height, 64);
      expect(
        resolve(members: true, preferred: 2000).membersRowRect!.height,
        closeTo(844 * 0.4, 1),
      );
    });
  });
}
