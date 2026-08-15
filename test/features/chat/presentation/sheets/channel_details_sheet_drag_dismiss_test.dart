import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';
const Channel _channel = Channel(
  id: _channelId,
  guildId: _guildId,
  name: 'general',
);

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

ProviderContainer _container(FluxerDatabase database) {
  return ProviderContainer(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(database),
      appearancePreferencesProvider.overrideWith(_FakeAppearance.new),
      memberListDetailsSubscriptionProvider(
        _guildId,
        _channelId,
        true,
      ).overrideWith((ref) {}),
    ],
  );
}

Widget _host(ProviderContainer container, {required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

/// Mounts a host with an `Open` button that shows [show] as a real modal sheet.
Future<void> _openSheet(
  WidgetTester tester,
  ProviderContainer container,
  Future<void> Function(BuildContext context) show,
) async {
  await tester.pumpWidget(
    _host(
      container,
      child: Builder(
        builder: (BuildContext context) => ElevatedButton(
          onPressed: () => show(context),
          child: const Text('Open'),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

Finder get _handle => find.byType(FluxerBottomSheetDragHandle);

void main() {
  testWidgets('member list drawer closes on a short pill drag', (tester) async {
    final FluxerDatabase database = openTestDatabase();
    final ProviderContainer container = _container(database);
    addTearDown(container.dispose);

    await _openSheet(
      tester,
      container,
      (context) =>
          showChannelDetailsSheet(context, channel: _channel, dm: null),
    );
    expect(_handle, findsOneWidget);

    await tester.drag(_handle, const Offset(0, 100));
    await tester.pumpAndSettle();

    expect(_handle, findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('member list drawer closes on a downward fling', (tester) async {
    final FluxerDatabase database = openTestDatabase();
    final ProviderContainer container = _container(database);
    addTearDown(container.dispose);

    await _openSheet(
      tester,
      container,
      (context) =>
          showChannelDetailsSheet(context, channel: _channel, dm: null),
    );

    // 45px of travel stays under the 50px distance threshold, so only the
    // velocity half of the dismiss contract (>300px/s) can close the sheet.
    final TestGesture gesture = await tester.startGesture(
      tester.getCenter(_handle),
    );
    Duration elapsed = Duration.zero;
    for (int i = 0; i < 10; i += 1) {
      elapsed += const Duration(milliseconds: 4);
      await gesture.moveBy(const Offset(0, 4.5), timeStamp: elapsed);
    }
    await gesture.up();
    await tester.pumpAndSettle();

    expect(_handle, findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a partial pill drag springs the sheet back to its rest size', (
    tester,
  ) async {
    final FluxerDatabase database = openTestDatabase();
    final ProviderContainer container = _container(database);
    addTearDown(container.dispose);

    await _openSheet(
      tester,
      container,
      (context) =>
          showChannelDetailsSheet(context, channel: _channel, dm: null),
    );

    final double restTop = tester.getTopLeft(_handle).dy;

    final TestGesture gesture = await tester.startGesture(
      tester.getCenter(_handle),
    );
    await gesture.moveBy(const Offset(0, 30));
    await tester.pump();
    expect(
      tester.getTopLeft(_handle).dy,
      greaterThan(restTop),
      reason: 'the sheet must follow the finger',
    );

    await gesture.up();
    await tester.pumpAndSettle();

    expect(_handle, findsOneWidget, reason: '30px is below the threshold');
    expect(tester.getTopLeft(_handle).dy, closeTo(restTop, 0.5));
    expect(tester.takeException(), isNull);
  });
}
