import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_press_deduper.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';

void main() {
  late DateTime now;
  late GlobalShortcutPressDeduper deduper;

  setUp(() {
    now = DateTime(2026);
    deduper = GlobalShortcutPressDeduper(now: () => now);
  });

  bool press(GlobalShortcutPressSource source) =>
      deduper.isDuplicate(KeybindAction.voiceToggleMute, source);

  test('one key press seen by both sources runs once', () {
    expect(press(GlobalShortcutPressSource.window), isFalse);
    expect(press(GlobalShortcutPressSource.hook), isTrue);
  });

  test('rapid presses still run once each in either order', () {
    expect(press(GlobalShortcutPressSource.hook), isFalse);
    expect(press(GlobalShortcutPressSource.window), isTrue);
    now = now.add(const Duration(milliseconds: 150));
    expect(press(GlobalShortcutPressSource.window), isTrue);
    expect(press(GlobalShortcutPressSource.hook), isFalse);
  });

  test('a window press works while the hook sees nothing', () {
    expect(press(GlobalShortcutPressSource.window), isFalse);
    now = now.add(const Duration(milliseconds: 100));
    expect(press(GlobalShortcutPressSource.window), isFalse);
  });

  test('a later press from the other source is a new press', () {
    expect(press(GlobalShortcutPressSource.hook), isFalse);
    now = now.add(kGlobalShortcutDuplicateWindow);
    expect(press(GlobalShortcutPressSource.window), isFalse);
  });

  test('actions are tracked separately', () {
    expect(press(GlobalShortcutPressSource.hook), isFalse);
    expect(
      deduper.isDuplicate(
        KeybindAction.voiceToggleDeafen,
        GlobalShortcutPressSource.window,
      ),
      isFalse,
    );
  });
}
