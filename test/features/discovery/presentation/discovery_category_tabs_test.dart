import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_category_tabs.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/test_l10n.dart';

class _FakeDiscoveryController extends DiscoveryController {
  @override
  DiscoveryState build() {
    return const DiscoveryState(
      categories: <DiscoveryCategoryResponse>[
        DiscoveryCategoryResponse(id: 1, name: 'Gaming'),
      ],
    );
  }
}

Widget _buildApp(double textScale) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    builder: (context, child) => MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: TextScaler.linear(textScale)),
      child: child!,
    ),
    home: Scaffold(
      body: Builder(
        builder: (context) => CustomScrollView(
          slivers: <Widget>[
            buildDiscoveryCategoryTabsSliver(context),
            const SliverToBoxAdapter(child: SizedBox(height: 2000)),
          ],
        ),
      ),
    ),
  );
}

void main() {
  for (final double scale in <double>[1, 1.3, 2]) {
    testWidgets('category chips fit the tab row at text scale $scale', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            discoveryControllerProvider.overrideWith(
              _FakeDiscoveryController.new,
            ),
          ],
          child: _buildApp(scale),
        ),
      );
      await tester.pump();

      final Rect row = tester.getRect(find.byType(SingleChildScrollView));
      final Rect label = tester.getRect(find.text('Gaming'));
      final Rect chip = tester.getRect(
        find
            .ancestor(of: find.text('Gaming'), matching: find.byType(Material))
            .first,
      );

      expect(chip.bottom, lessThanOrEqualTo(row.bottom));
      expect(chip.top, greaterThanOrEqualTo(row.top));
      expect(label.bottom, lessThanOrEqualTo(chip.bottom));
      final RenderParagraph paragraph = tester.renderObject(
        find.text('Gaming'),
      );
      final TextPainter natural = TextPainter(
        text: paragraph.text,
        textDirection: TextDirection.ltr,
        textScaler: paragraph.textScaler,
        strutStyle: paragraph.strutStyle,
        textHeightBehavior: paragraph.textHeightBehavior,
      )..layout();
      addTearDown(natural.dispose);
      expect(
        paragraph.size.height,
        greaterThanOrEqualTo(natural.height - 0.01),
      );
    });
  }
}
