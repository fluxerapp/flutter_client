import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('fluxerSystemUiOverlayStyle', () {
    test('dark theme uses light icons and the theme nav color', () {
      const Color navColor = Color(0xFF1A1625);
      final SystemUiOverlayStyle style = fluxerSystemUiOverlayStyle(
        brightness: Brightness.dark,
        navigationBarColor: navColor,
      );

      expect(style.systemNavigationBarColor, navColor);
      expect(style.systemNavigationBarIconBrightness, Brightness.light);
      expect(style.systemNavigationBarContrastEnforced, isFalse);
      expect(style.statusBarIconBrightness, Brightness.light);
      expect(style.statusBarBrightness, Brightness.dark);
      expect(style.systemStatusBarContrastEnforced, isFalse);
    });

    test('light theme uses dark icons and the theme nav color', () {
      const Color navColor = Color(0xFFF2F3F5);
      final SystemUiOverlayStyle style = fluxerSystemUiOverlayStyle(
        brightness: Brightness.light,
        navigationBarColor: navColor,
      );

      expect(style.systemNavigationBarColor, navColor);
      expect(style.systemNavigationBarIconBrightness, Brightness.dark);
      expect(style.statusBarIconBrightness, Brightness.dark);
      expect(style.statusBarBrightness, Brightness.light);
    });
  });

  group('buildFluxerTheme system overlay', () {
    test('dark material theme carries overlay from color tokens', () {
      final colorTheme = buildDarkColorTheme();
      final ThemeData theme = buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      );
      final SystemUiOverlayStyle? style = theme.appBarTheme.systemOverlayStyle;

      expect(style, isNotNull);
      expect(style!.systemNavigationBarColor, colorTheme.backgroundSecondary);
      expect(style.systemNavigationBarIconBrightness, Brightness.light);
      expect(style.systemNavigationBarContrastEnforced, isFalse);
    });

    test('light material theme carries overlay from color tokens', () {
      final colorTheme = buildLightColorTheme();
      final ThemeData theme = buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
        brightness: Brightness.light,
      );
      final SystemUiOverlayStyle? style = theme.appBarTheme.systemOverlayStyle;

      expect(style, isNotNull);
      expect(style!.systemNavigationBarColor, colorTheme.backgroundSecondary);
      expect(style.systemNavigationBarIconBrightness, Brightness.dark);
    });
  });

  group('themed overlay vs OS brightness', () {
    const double statusBarHeight = 25;
    const double navigationBarHeight = 54;
    const double deviceHeight = 960;
    const double deviceWidth = 480;
    const double devicePixelRatio = 2;

    void setupAndroidChrome(WidgetTester tester) {
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

      const FakeViewPadding padding = FakeViewPadding(
        top: statusBarHeight * devicePixelRatio,
        bottom: navigationBarHeight * devicePixelRatio,
      );
      addTearDown(tester.view.reset);
      tester.view
        ..viewPadding = padding
        ..padding = padding
        ..devicePixelRatio = devicePixelRatio
        ..physicalSize = const Size(
          deviceWidth * devicePixelRatio,
          deviceHeight * devicePixelRatio,
        );
    }

    testWidgets(
      'dark app theme colors the Android nav bar while the OS is light',
      (WidgetTester tester) async {
        setupAndroidChrome(tester);
        final colorTheme = buildDarkColorTheme();
        final ThemeData theme = buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: theme,
            darkTheme: theme,
            themeMode: ThemeMode.dark,
            builder: (BuildContext context, Widget? child) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: Theme.of(context).appBarTheme.systemOverlayStyle!,
                child: child ?? const SizedBox.shrink(),
              );
            },
            home: const SizedBox.expand(),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          SystemChrome.latestStyle?.systemNavigationBarColor,
          colorTheme.backgroundSecondary,
        );
        expect(
          SystemChrome.latestStyle?.systemNavigationBarIconBrightness,
          Brightness.light,
        );
        expect(
          SystemChrome.latestStyle?.systemNavigationBarContrastEnforced,
          isFalse,
        );
      },
      variant: TargetPlatformVariant.only(TargetPlatform.android),
    );
  });
}
