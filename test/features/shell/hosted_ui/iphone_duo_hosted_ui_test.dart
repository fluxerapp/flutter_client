import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_background_bleed.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('hasIphoneDuoAsymmetricSideInset', () {
    test('detects a single side strip', () {
      expect(
        hasIphoneDuoAsymmetricSideInset(const EdgeInsets.only(right: 44)),
        isTrue,
      );
      expect(
        hasIphoneDuoAsymmetricSideInset(const EdgeInsets.only(left: 44)),
        isTrue,
      );
      expect(
        hasIphoneDuoAsymmetricSideInset(
          const EdgeInsets.only(left: 44, right: 44, top: 59),
        ),
        isFalse,
      );
      expect(hasIphoneDuoAsymmetricSideInset(EdgeInsets.zero), isFalse);
    });
  });

  group('showsIphoneDuoWindowBackground', () {
    test('is off before the main shell', () {
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: false,
          location: '/login',
          splashExitAllowed: false,
          splashRevealComplete: false,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/loading',
          splashExitAllowed: false,
          splashRevealComplete: false,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/reconnecting',
          splashExitAllowed: true,
          splashRevealComplete: true,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/channels/@me',
          splashExitAllowed: false,
          splashRevealComplete: true,
        ),
        isFalse,
      );
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/channels/@me',
          splashExitAllowed: true,
          splashRevealComplete: false,
        ),
        isFalse,
      );
    });

    test('is on once authenticated in the shell after reveal', () {
      expect(
        showsIphoneDuoWindowBackground(
          isAuthenticated: true,
          location: '/channels/@me',
          splashExitAllowed: true,
          splashRevealComplete: true,
        ),
        isTrue,
      );
    });
  });

  testWidgets('hostedUiBackgroundBleedInsets is zero off the Duo pose', (
    WidgetTester tester,
  ) async {
    late EdgeInsets bleed;
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(
            padding: EdgeInsets.only(left: 44),
            viewPadding: EdgeInsets.only(left: 44, top: 59),
          ),
          child: Builder(
            builder: (BuildContext context) {
              bleed = hostedUiBackgroundBleedInsets(context);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
    expect(bleed, EdgeInsets.zero);
  });
}
