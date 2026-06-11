import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_composer_barrier.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Widget _barrierTestApp() {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: const Scaffold(
        body: ChannelComposerBarrier(
          access: GuildComposerAccess(
            canAccess: false,
            reason: GuildComposerBlockReason.guildSendDisabled,
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('shows guild send disabled barrier copy', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_barrierTestApp());
    expect(
      find.text('Messaging is temporarily paused in this community.'),
      findsOneWidget,
    );
  });
}
