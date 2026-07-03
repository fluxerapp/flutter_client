import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

/// Every message type routed to [SystemMessage] (i.e. not a user message).
/// Reactions are allowed on all of these.
const List<int> _systemMessageTypes = <int>[
  messageTypeRecipientAdd,
  messageTypeRecipientRemove,
  messageTypeCall,
  messageTypeChannelNameChange,
  messageTypeChannelIconChange,
  messageTypeChannelPinnedMessage,
  messageTypeUserJoin,
];

class _RenderReactionsOff extends UserSettingsViewModel {
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
    developerMode: false,
    trustedDomains: <String>[],
    renderReactions: false,
  );
}

Message _systemMessage(int type, {List<Reaction> reactions = const []}) =>
    Message(
      id: '1',
      channelId: 'c1',
      authorId: 'u1',
      authorName: 'Sample User',
      content: '',
      timestamp: DateTime(2026),
      type: type,
      reactions: reactions,
    );

Future<void> _pumpSystemMessage(
  WidgetTester tester, {
  required Message message,
  Color? roleColor,
  bool canAddReactions = false,
  ReactionToggleCallback? onReaction,
  UserSettingsViewModel Function()? userSettingsOverride,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        guildUserDisplayProvider(('u1', 'g1')).overrideWith(
          (ref) => const AsyncValue.data(
            GuildUserDisplay(
              displayName: 'Sample User',
              avatarUrl: null,
              avatarColor: null,
              accountDisplayName: 'Sample User',
            ),
          ),
        ),
        memberRoleColorProvider(('u1', 'g1')).overrideWith((ref) => roleColor),
        if (userSettingsOverride != null)
          userSettingsViewModelProvider.overrideWith(userSettingsOverride),
      ],
      child: MaterialApp(
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: ThemeData(extensions: <ThemeExtension>[buildDarkColorTheme()]),
        home: Scaffold(
          body: SystemMessage(
            message: message,
            guildId: 'g1',
            canAddReactions: canAddReactions,
            onReaction: onReaction,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('colours the system-message author name with the role colour', (
    tester,
  ) async {
    const Color roleColor = Color(0xFF4641D9);
    await _pumpSystemMessage(
      tester,
      message: _systemMessage(messageTypeChannelPinnedMessage),
      roleColor: roleColor,
    );

    final RichText line = tester.widget(
      find.byWidgetPredicate(
        (w) => w is RichText && w.text.toPlainText().startsWith('Sample User'),
      ),
    );
    expect(_findSpan(line.text, 'Sample User')?.style?.color, roleColor);
  });

  group('reactions', () {
    const reaction = Reaction(emoji: '👍', count: 3);

    for (final type in _systemMessageTypes) {
      testWidgets('displays reactions on system message type $type', (
        tester,
      ) async {
        await _pumpSystemMessage(
          tester,
          message: _systemMessage(type, reactions: const [reaction]),
        );

        expect(find.byType(MessageReactionsBar), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
      });
    }

    testWidgets('renders no reaction view when the message has none', (
      tester,
    ) async {
      await _pumpSystemMessage(
        tester,
        message: _systemMessage(messageTypeUserJoin),
      );

      expect(find.byType(MessageReactionsBar), findsNothing);
    });

    testWidgets('hides reactions when renderReactions is disabled', (
      tester,
    ) async {
      await _pumpSystemMessage(
        tester,
        message: _systemMessage(
          messageTypeUserJoin,
          reactions: const [reaction],
        ),
        userSettingsOverride: _RenderReactionsOff.new,
      );

      expect(find.byType(MessageReactionsBar), findsNothing);
    });

    testWidgets('shows the add reaction button only when reactions can be '
        'added', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final semantics = tester.ensureSemantics();
      void onReaction(String emoji, {String? emojiId, bool animated = false}) {}

      await _pumpSystemMessage(
        tester,
        message: _systemMessage(
          messageTypeUserJoin,
          reactions: const [reaction],
        ),
        onReaction: onReaction,
      );
      expect(find.byType(MessageReactionsBar), findsOneWidget);
      expect(find.bySemanticsLabel('Add Reaction'), findsNothing);

      await _pumpSystemMessage(
        tester,
        message: _systemMessage(
          messageTypeUserJoin,
          reactions: const [reaction],
        ),
        canAddReactions: true,
        onReaction: onReaction,
      );
      expect(find.bySemanticsLabel('Add Reaction'), findsOneWidget);

      semantics.dispose();
    });
  });
}

TextSpan? _findSpan(InlineSpan span, String text) {
  if (span is TextSpan) {
    if (span.text == text) {
      return span;
    }
    final children = span.children;
    if (children != null) {
      for (final child in children) {
        final match = _findSpan(child, text);
        if (match != null) {
          return match;
        }
      }
    }
  }
  return null;
}
