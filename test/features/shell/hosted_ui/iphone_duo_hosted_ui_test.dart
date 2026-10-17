import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';

void main() {
  group('showsIphoneDuoWindowBackground', () {
    test('is off before the main shell', () {
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: false,
          location: '/login',
          splashExitAllowed: false,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/loading',
          splashExitAllowed: false,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/reconnecting',
          splashExitAllowed: true,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/channels/@me',
          splashExitAllowed: false,
        ),
        isFalse,
      );
    });

    test('is on once authenticated in the shell', () {
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/channels/@me',
          splashExitAllowed: true,
        ),
        isTrue,
      );
    });
  });
}
