import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_indicator.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_row.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void main() {
  Widget buildTestApp({required Widget child}) {
    final colorTheme = buildDarkColorTheme();
    return ProviderScope(
      child: MaterialApp(
        locale: const Locale('en'),
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

  const String guildId = 'guild-1';
  const String channelId = 'text-1';

  const Channel channel = Channel(
    id: channelId,
    guildId: guildId,
    name: 'general',
  );
  const GuildChannelSettingsEntry entry = GuildChannelSettingsEntry.channel(
    channel: channel,
    guildId: guildId,
  );
  final List<Channel> channels = <Channel>[channel];
  late ValueNotifier<GuildChannelSettingsDropHover?> hoverNotifier;

  setUp(() {
    hoverNotifier = ValueNotifier<GuildChannelSettingsDropHover?>(null);
  });

  tearDown(() {
    hoverNotifier.dispose();
  });

  Widget buildRow() {
    return GuildChannelSettingsRow(
      entry: entry,
      channels: channels,
      hoverNotifier: hoverNotifier,
      onDropHover: (_, _) {},
      onDropLeave: (_) {},
      onDragStarted: (_) {},
      onDragEnded: () {},
    );
  }

  testWidgets('renders channel name and drag handle', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildTestApp(child: buildRow()));
    await tester.pumpAndSettle();

    expect(find.text('general'), findsOneWidget);
  });

  testWidgets('shows top indicator when hover notifier targets this row', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildTestApp(child: buildRow()));
    await tester.pumpAndSettle();

    expect(find.byType(GuildChannelDropIndicator), findsNothing);

    hoverNotifier.value = const GuildChannelSettingsDropHover(
      displayEntryId: channelId,
      displayIntent: ChannelReorderIntent(
        indicator: ChannelReorderIndicator(
          position: ChannelReorderIndicatorPosition.top,
          isValid: true,
        ),
        result: ChannelReorderDropResult(
          targetId: channelId,
          position: ChannelReorderDropPosition.before,
        ),
      ),
      dropResult: ChannelReorderDropResult(
        targetId: channelId,
        position: ChannelReorderDropPosition.before,
      ),
    );
    await tester.pump();

    expect(find.byType(GuildChannelDropIndicator), findsOneWidget);
  });
}
