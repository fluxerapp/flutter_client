import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_pins_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_pins_overlay_button.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_pins_open_request_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../../helpers/open_test_database.dart';
import '../../../../../../helpers/test_l10n.dart';

const String _channelId = 'c1';

class _EmptyPins extends ChannelPins {
  @override
  Future<ChannelPinsState> build(String channelId) async {
    return const ChannelPinsState(
      items: <PinnedMessageEntry>[],
      hasMore: false,
    );
  }
}

void main() {
  testWidgets('open request shows the desktop pins overlay', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
        fluxerClientProvider.overrideWithValue(
          FluxerClient(Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))),
        ),
        channelPinsProvider(_channelId).overrideWith(_EmptyPins.new),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: _buildApp(
          buildChannelPinsButton(
            channelId: _channelId,
            guildId: 'g1',
            hasUnreadPins: false,
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.byType(ChannelPinsContent), findsNothing);

    container.read(channelPinsOpenRequestProvider.notifier).open();
    await tester.pump();
    expect(find.byType(ChannelPinsContent), findsOneWidget);

    container.read(channelPinsOpenRequestProvider.notifier).open();
    await tester.pump();
    expect(find.byType(ChannelPinsContent), findsOneWidget);
  });
}

Widget _buildApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(
      body: Align(alignment: Alignment.topRight, child: child),
    ),
  );
}
