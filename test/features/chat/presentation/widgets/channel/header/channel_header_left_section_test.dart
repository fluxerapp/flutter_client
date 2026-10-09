// ProviderScope lives in a helper; the lint only exempts one written
// inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_left_section.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:material_ui/material_ui.dart' as material;

import '../../../../../../helpers/rendered_text_test_helpers.dart';
import '../../../../../../helpers/test_l10n.dart';

const String _channelId = 'channel-1';

void main() {
  testWidgets('topic preview renders markdown on one line', (tester) async {
    await tester.pumpWidget(_app(_header(topic: '**welcome** to the channel')));
    await tester.pumpAndSettle();

    expect(find.text('**welcome** to the channel'), findsNothing);
    expect(renderedTextContents(tester), contains('welcome to the channel'));

    final material.RichText topic = tester.widget<material.RichText>(
      find.byWidgetPredicate((Widget widget) {
        return widget is material.RichText &&
            widget.text.toPlainText().contains('welcome');
      }),
    );
    expect(topic.maxLines, 1);
    expect(topic.overflow, TextOverflow.ellipsis);
    expect(_hasBoldWelcome(topic.text), isTrue);
  });
}

bool _hasBoldWelcome(InlineSpan span) {
  if (span is TextSpan) {
    if ((span.text?.contains('welcome') ?? false) &&
        span.style?.fontWeight == FontWeight.w700) {
      return true;
    }
    for (final InlineSpan child in span.children ?? const <InlineSpan>[]) {
      if (_hasBoldWelcome(child)) {
        return true;
      }
    }
  }
  return false;
}

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      guildListViewModelProvider.overrideWith(_EmptyGuildList.new),
      voiceSessionProvider.overrideWith(_IdleVoiceSession.new),
      favoriteChannelProvider(
        _channelId,
      ).overrideWith((ref) => Stream<db.FavoriteChannel?>.value(null)),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
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

Widget _header({required String topic}) {
  return ChannelHeaderLeftSection(
    channelId: _channelId,
    channel: Channel(
      id: _channelId,
      guildId: 'guild-1',
      name: 'general',
      topic: topic,
    ),
    dm: null,
    isPersonalNotes: false,
    highContrast: false,
  );
}

class _EmptyGuildList extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: []);
}

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}
