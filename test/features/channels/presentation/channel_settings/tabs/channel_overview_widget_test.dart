import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_overview_widget.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;
import '../../../../../helpers/test_l10n.dart';

void main() {
  const String guildId = 'guild-1';
  const Channel textChannel = Channel(
    id: 'text-1',
    guildId: guildId,
    name: 'general',
  );
  const Channel voiceChannel = Channel(
    id: 'voice-1',
    guildId: guildId,
    name: 'voice',
    type: ChannelType.guildVoice,
    bitrate: 64000,
  );
  const Channel linkChannel = Channel(
    id: 'link-1',
    guildId: guildId,
    name: 'links',
    type: ChannelType.guildLink,
    url: 'https://example.com',
  );

  testWidgets('text channel shows messaging fields', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        child: ChannelOverviewWidget(
          channel: textChannel,
          permissions: Permission.manageChannels.value,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Channel name'), findsOneWidget);
    expect(find.text('Topic'), findsOneWidget);
    expect(find.text('Slowmode'), findsOneWidget);
    expect(find.text('URL'), findsNothing);
    expect(find.text('Voice quality'), findsNothing);
  });

  testWidgets('voice channel shows voice fields', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: <Override>[
          channelRtcRegionsProvider(voiceChannel.id).overrideWith(
            (Ref ref) => <RtcRegionResponse>[
              const RtcRegionResponse(
                id: 'us-east',
                name: 'US East',
                emoji: '🇺🇸',
              ),
            ],
          ),
        ],
        child: ChannelOverviewWidget(
          channel: voiceChannel,
          permissions: Permission.manageChannels.value,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Voice quality'), findsOneWidget);
    expect(find.text('Participant limit'), findsOneWidget);
  });

  testWidgets('link channel shows URL field', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        child: ChannelOverviewWidget(
          channel: linkChannel,
          permissions: Permission.manageChannels.value,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('URL'), findsOneWidget);
    expect(find.text('Topic'), findsNothing);
  });
}

Widget _buildTestApp({
  required Widget child,
  List<Override> overrides = const <Override>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
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
