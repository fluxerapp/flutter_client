import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_seal_icon.dart';
import 'package:fluxer_app/material_ui.dart';

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
  testWidgets('partnered communities show the partnered seal', (tester) async {
    await tester.pumpWidget(_app(const <String>['PARTNERED', 'VERIFIED']));

    final FluxerGuildSealIcon seal = tester.widget<FluxerGuildSealIcon>(
      find.byType(FluxerGuildSealIcon),
    );
    expect(seal.kind, FluxerGuildSealKind.partnered);
    expect(find.byType(Image), findsNothing);
  });

  testWidgets('verified communities show the verified seal', (tester) async {
    await tester.pumpWidget(_app(const <String>['VERIFIED']));

    final FluxerGuildSealIcon seal = tester.widget<FluxerGuildSealIcon>(
      find.byType(FluxerGuildSealIcon),
    );
    expect(seal.kind, FluxerGuildSealKind.verified);
  });

  testWidgets('discoverable communities show the discoverable seal', (
    tester,
  ) async {
    await tester.pumpWidget(_app(const <String>['DISCOVERABLE']));

    final FluxerGuildSealIcon seal = tester.widget<FluxerGuildSealIcon>(
      find.byType(FluxerGuildSealIcon),
    );
    expect(seal.kind, FluxerGuildSealKind.discoverable);
    expect(find.byType(Image), findsNothing);
  });
}
