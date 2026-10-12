import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/dark_legacy.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/material_ui.dart';

final Map<String, FluxerColorTheme Function()> _themes =
    <String, FluxerColorTheme Function()>{
      'dark': buildDarkColorTheme,
      'coal': buildCoalColorTheme,
      'dark_legacy': buildDarkLegacyColorTheme,
      'light': buildLightColorTheme,
    };

Widget _host(FluxerColorTheme colors, Widget child) {
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colors,
      textTheme: FluxerTextTheme.fromColors(colors),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(
      body: Align(alignment: Alignment.topLeft, child: child),
    ),
  );
}

void main() {
  for (final MapEntry<String, FluxerColorTheme Function()> theme
      in _themes.entries) {
    testWidgets('${theme.key}: icon is a circle that morphs to a rounded '
        'square when active', (tester) async {
      final FluxerColorTheme colors = theme.value();
      for (final bool isActive in <bool>[false, true]) {
        await tester.pumpWidget(
          _host(
            colors,
            GuildNavbarIconShape(
              isActive: isActive,
              child: const SizedBox.shrink(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          tester.getSize(find.byType(GuildNavbarIconShape)),
          const Size.square(GuildNavbarIconShape.size),
        );
        final ClipRRect clip = tester.widget<ClipRRect>(find.byType(ClipRRect));
        expect(
          clip.borderRadius,
          BorderRadius.circular(
            isActive
                ? GuildNavbarIconShape.activeRadius
                : GuildNavbarIconShape.idleRadius,
          ),
        );
        final ColoredBox fill = tester.widget<ColoredBox>(
          find.descendant(
            of: find.byType(GuildNavbarIconShape),
            matching: find.byType(ColoredBox),
          ),
        );
        expect(
          fill.color,
          isActive ? colors.brandPrimary : colors.serverIconBackground,
        );
      }
    });

    testWidgets('${theme.key}: pill is 4pt wide in primary text colour', (
      tester,
    ) async {
      final FluxerColorTheme colors = theme.value();
      for (final double height in <double>[
        GuildNavbarPill.unreadHeight,
        GuildNavbarPill.hoverHeight,
        GuildNavbarPill.selectedHeight,
      ]) {
        await tester.pumpWidget(_host(colors, GuildNavbarPill(height: height)));

        expect(
          tester.getSize(find.byType(GuildNavbarPill)),
          Size(GuildNavbarPill.width, height),
        );
        final DecoratedBox box = tester.widget<DecoratedBox>(
          find.descendant(
            of: find.byType(GuildNavbarPill),
            matching: find.byType(DecoratedBox),
          ),
        );
        expect((box.decoration as BoxDecoration).color, colors.textPrimary);
      }
    });
  }

  testWidgets('pill renders nothing at zero height', (tester) async {
    await tester.pumpWidget(
      _host(buildDarkColorTheme(), const GuildNavbarPill(height: 0)),
    );

    expect(tester.getSize(find.byType(GuildNavbarPill)), Size.zero);
  });

  test('rail rows are 56pt apart', () {
    expect(GuildNavbarIconShape.size + GuildNavbarIconShape.itemSpacing, 56);
  });
}
