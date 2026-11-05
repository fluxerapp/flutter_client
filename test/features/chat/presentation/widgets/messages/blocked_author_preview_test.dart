import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_post_card.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/time_format_providers.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/message_item_test_overrides.dart';
import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

const String _blockedUserId = '123456789012345678';

List<Override> _overrides() => [
  fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
  instanceRuntimeConfigOverride(),
  ...messageItemTestProviderOverrides(),
  use12HourTimeFormatProvider.overrideWithValue(false),
  blockedUserIdsProvider.overrideWithValue(const <String>{_blockedUserId}),
];

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
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
  final Message message = Message(
    id: '1',
    channelId: 'c1',
    authorId: _blockedUserId,
    authorName: 'Blocked Person',
    content: 'secret words from the blocked person',
    timestamp: DateTime(2026, 1, 1, 12),
  );

  messageItemTestWidgets(
    'a pinned or found message from a blocked author shows the blocked label',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: _overrides(),
          child: _app(MessagePreviewTile(message: message, onTap: () {})),
        ),
      );
      await tester.pump();

      expect(
        find.text(testL10n.chatBlockedMessagesCollapsed(1)),
        findsOneWidget,
      );
      expect(find.textContaining('secret words'), findsNothing);
    },
  );

  messageItemTestWidgets(
    'a forum post from a blocked author hides its title and snippet',
    (tester) async {
      const Channel forum = Channel(
        id: 'forum',
        guildId: 'g1',
        name: 'feedback',
        type: ChannelType.guildForum,
      );
      const Channel post = Channel(
        id: 'post',
        guildId: 'g1',
        name: 'Blocked post title',
        type: ChannelType.publicThread,
        parentId: 'forum',
        ownerId: _blockedUserId,
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: _overrides(),
          child: _app(
            ForumPostCard(
              data: ForumPostCardData(
                forum: forum,
                post: post,
                firstMessageLoaded: true,
                firstMessage: message,
                authorBlocked: true,
              ),
              onTap: () {},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text(testL10n.forumPostBlockedAuthor), findsOneWidget);
      expect(find.text('Blocked post title'), findsNothing);
      expect(find.textContaining('secret words'), findsNothing);
    },
  );
}
