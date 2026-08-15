import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/channel_welcome_section.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

Widget _app(Widget child) {
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
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('renders the channel name in the heading and body', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const ChannelWelcomeSection(
          channel: Channel(
            id: 'channel-1',
            guildId: 'guild-1',
            name: 'general',
          ),
        ),
      ),
    );

    expect(find.text('Welcome to #general'), findsOneWidget);
    expect(
      find.text(
        'In the beginning, there was nothing. Then, there was #general. '
        'And it was good.',
      ),
      findsOneWidget,
    );
    expect(find.byType(ChannelIcon), findsOneWidget);
  });

  testWidgets('forwards the channel type to the icon', (tester) async {
    await tester.pumpWidget(
      _app(
        const ChannelWelcomeSection(
          channel: Channel(
            id: 'voice-1',
            guildId: 'guild-1',
            name: 'lounge',
            type: ChannelType.guildVoice,
          ),
        ),
      ),
    );

    final ChannelIcon icon = tester.widget<ChannelIcon>(
      find.byType(ChannelIcon),
    );
    expect(icon.type, ChannelType.guildVoice);
    expect(icon.channel?.name, 'lounge');
  });
}
