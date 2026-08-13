import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/system_message_actions_sheet.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _messageId = 'm1';

class _FakeUser extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: 'viewer',
    username: 'viewer',
    displayName: 'viewer',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: true,
    trustedDomains: <String>[],
  );
}

Message _systemMessage({required int type, String content = ''}) => Message(
  id: _messageId,
  channelId: 'c1',
  authorId: 'author',
  authorName: 'Author',
  content: content,
  timestamp: DateTime(2026),
  type: type,
);

Widget _app(
  FluxerDatabase db, {
  required void Function(BuildContext context, WidgetRef ref) onOpen,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      userSettingsViewModelProvider.overrideWith(_FakeUser.new),
      isMessageSavedProvider(
        _messageId,
      ).overrideWith((ref) => Stream<bool>.value(false)),
      instanceFeatureEnabledProvider(
        LimitKeys.featureGlobalExpressions,
      ).overrideWith((ref) => false),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Consumer(
          builder: (context, ref, _) => Center(
            child: ElevatedButton(
              onPressed: () => onOpen(context, ref),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets(
    'pinned-message system menu shows system actions and hides user-only ones',
    (tester) async {
      final db = openTestDatabase();
      final message = _systemMessage(type: messageTypeChannelPinnedMessage);
      await tester.pumpWidget(
        _app(
          db,
          onOpen: (context, ref) => showSystemMessageActionsSheet(
            context,
            ref,
            message: message,
            guildId: 'g1',
            isDmChannel: false,
            canDelete: true,
            canAddReactions: true,
            canManageMessages: false,
            currentUserId: 'viewer',
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Add Reaction'), findsOneWidget);
      expect(find.text('Mark as Unread'), findsOneWidget);
      expect(find.text('Copy Message Link'), findsOneWidget);
      expect(find.text('Copy Message ID'), findsOneWidget);
      expect(find.text('Delete Message'), findsOneWidget);
      expect(find.text('Debug Message'), findsOneWidget);

      expect(find.text('Reply'), findsNothing);
      expect(find.text('Forward'), findsNothing);
      expect(find.text('Edit Message'), findsNothing);
      expect(find.text('Pin message'), findsNothing);
      expect(find.text('Bookmark Message'), findsNothing);
      expect(find.text('Report Message'), findsNothing);
      expect(find.text('Copy Message'), findsNothing);
    },
  );

  testWidgets('Copy Message copies the system message content', (tester) async {
    final db = openTestDatabase();
    final message = _systemMessage(
      type: messageTypeChannelNameChange,
      content: 'renamed-channel',
    );
    final clipboardWrites = <Object?>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          clipboardWrites.add((call.arguments as Map)['text']);
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpWidget(
      _app(
        db,
        onOpen: (context, ref) => showSystemMessageActionsSheet(
          context,
          ref,
          message: message,
          guildId: 'g1',
          isDmChannel: false,
          canDelete: false,
          canAddReactions: false,
          canManageMessages: false,
          currentUserId: 'viewer',
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text('Copy Message'), findsOneWidget);
    await tester.tap(find.text('Copy Message'));
    await tester.pumpAndSettle();

    final l10n = testL10n;
    expect(clipboardWrites, [
      l10n.systemPreviewChangedChannelNameTo('Author', 'renamed-channel'),
    ]);
  });
}
