import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Widget _app(List<String> features) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Center(child: FluxerGuildBadge(features: features)),
      ),
    ),
  );
}

void main() {
  testWidgets('partnered communities show the Fluxer mark', (tester) async {
    await tester.pumpWidget(_app(const <String>['PARTNERED', 'VERIFIED']));

    expect(find.byType(FluxerBrandLogo), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('verified communities show a check in a circle', (tester) async {
    await tester.pumpWidget(_app(const <String>['VERIFIED']));

    final Icon icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.icon, PhosphorIconsFill.checkCircle);
    expect(find.byType(FluxerBrandLogo), findsNothing);
  });
}
