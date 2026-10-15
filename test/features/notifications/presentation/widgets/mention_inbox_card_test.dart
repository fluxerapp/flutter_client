import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_inbox_card.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/message_item_test_overrides.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _channelId = 'channel-1';

Future<List<Message>> _pumpCard(
  WidgetTester tester, {
  required int permissionBits,
}) async {
  final List<Message> replies = <Message>[];
  final Message message = Message(
    id: 'message-1',
    channelId: _channelId,
    authorId: 'author-1',
    authorName: 'Author',
    content: 'hello',
    timestamp: DateTime.utc(2026),
  );
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: <Override>[
        ...messageItemTestProviderOverrides(),
        fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
        currentUserIdProvider.overrideWithValue('test-user'),
        dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
        channelPermissionCacheProvider.overrideWith(
          () => _FixedChannelPermissionCache(<String, int>{
            _channelId: permissionBits,
          }),
        ),
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
        home: Scaffold(
          body: MentionInboxCard(
            messageId: message.id,
            message: message,
            header: null,
            previewGuildId: 'guild-1',
            onJump: (_) {},
            onRemove: (_) {},
            onReply: replies.add,
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  return replies;
}

void main() {
  testWidgets('offers a reply when the composer could send', (
    WidgetTester tester,
  ) async {
    final List<Message> replies = await _pumpCard(
      tester,
      permissionBits:
          Permission.viewChannel.value | Permission.sendMessages.value,
    );

    await tester.tap(find.text('Send a reply'));
    expect(replies, hasLength(1));

    await releaseTestWidgetTree(tester);
  });

  testWidgets('hides the reply when the composer is read-only', (
    WidgetTester tester,
  ) async {
    await _pumpCard(tester, permissionBits: Permission.viewChannel.value);

    expect(find.text('Send a reply'), findsNothing);

    await releaseTestWidgetTree(tester);
  });
}

class _EmptyDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FixedChannelPermissionCache extends ChannelPermissionCache {
  _FixedChannelPermissionCache(this.effective);

  final Map<String, int> effective;

  @override
  ChannelPermissionCaches build() =>
      ChannelPermissionCaches(effective: effective);
}
