import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_keyboard_breadcrumb.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('persist and read breadcrumb', () async {
    await persistComposerKeyboardBreadcrumb(keyboardState: 'keyboardOpen');
    final Map<String, String>? snapshot =
        await readComposerKeyboardBreadcrumb();
    expect(snapshot?['composer.keyboard.state'], 'keyboardOpen');
    expect(snapshot?['composer.keyboard.at_ms'], isNotNull);
  });

  test('clear removes stored breadcrumb', () async {
    await persistComposerKeyboardBreadcrumb(keyboardState: 'imeReconnecting');
    await clearComposerKeyboardBreadcrumb();
    expect(await readComposerKeyboardBreadcrumb(), isNull);
  });
}
