import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_connection_item.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_connection_icon.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/test_l10n.dart';

Widget _app(List<ConnectionResponse> connections, double textScale) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
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
        body: Column(
          children: <Widget>[
            for (final ConnectionResponse connection in connections)
              UserProfileConnectionItem(connection: connection),
          ],
        ),
      ),
    ),
  );
}

ConnectionResponse _connection(ConnectionType type, String id) =>
    ConnectionResponse(
      id: id,
      type: type,
      name: 'mystie.dev',
      verified: true,
      visibilityFlags: 0,
      sortOrder: 0,
    );

void main() {
  for (final double scale in <double>[1, 1.3]) {
    testWidgets('connection icons share one square tile at text scale $scale', (
      tester,
    ) async {
      final List<ConnectionResponse> connections = <ConnectionResponse>[
        for (final ConnectionType type in ConnectionType.values)
          _connection(type, type.name),
      ];
      await tester.pumpWidget(_app(connections, scale));
      await tester.pumpAndSettle();
      final Finder name = find.text('mystie.dev');
      final List<Rect> names = <Rect>[
        for (int i = 0; i < name.evaluate().length; i++)
          tester.getRect(name.at(i)),
      ];
      expect(names, hasLength(connections.length));
      for (final Rect rect in names) {
        expect(rect.left, names.first.left);
      }
      final Finder tiles = find.byType(FluxerConnectionIconTile);
      expect(tiles, findsNWidgets(connections.length));
      for (int i = 0; i < connections.length; i++) {
        expect(
          tester.getSize(tiles.at(i)),
          const Size.square(FluxerConnectionIconTile.size),
        );
        final Rect tile = tester.getRect(tiles.at(i));
        final Rect glyph = tester.getRect(
          find.byType(FluxerConnectionIcon).at(i),
        );
        expect(glyph.center, tile.center);
      }
    });
  }
}
