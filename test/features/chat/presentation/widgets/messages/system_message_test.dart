import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
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

class _FakeVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _FakeUserSettings extends UserSettingsViewModel {
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
  );
}

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

AsyncValue<GuildUserDisplay?> _mentionedUserDisplay(String userId) {
  return AsyncValue.data(
    GuildUserDisplay(
      displayName: userId,
      avatarUrl: null,
      avatarColor: null,
      accountDisplayName: userId,
    ),
  );
}

Message _systemMessage(
  int type, {
  List<Reaction> reactions = const [],
  String content = '',
  List<String> mentionedUserIds = const [],
  MessageCall? call,
}) => Message(
  id: '1',
  channelId: 'c1',
  authorId: 'u1',
  authorName: 'Sample User',
  content: content,
  timestamp: DateTime(2026),
  type: type,
  reactions: reactions,
  mentionedUserIds: mentionedUserIds,
  call: call,
);

const MessageCall _sampleCall = MessageCall(
  participants: <String>['u1', 'viewer'],
);

Future<void> _pumpSystemMessage(
  WidgetTester tester, {
  required Message message,
  Color? roleColor,
  bool canAddReactions = false,
  ReactionToggleCallback? onReaction,
  UserSettingsViewModel Function()? userSettingsOverride,
}) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        voiceSessionProvider.overrideWith(_FakeVoiceSession.new),
        channelByIdProvider('c1').overrideWith(
          (ref) => Stream<Channel?>.value(
            const Channel(id: 'c1', guildId: 'g1', name: 'general'),
          ),
        ),
        channelGuildIdProvider(
          'c1',
        ).overrideWith((ref) => Stream<String?>.value('g1')),
        activeChannelIdProvider.overrideWithValue('c1'),
        contextualGuildIdProvider.overrideWithValue('g1'),
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
        for (final String userId in message.mentionedUserIds)
          guildUserDisplayProvider((
            userId,
            'g1',
          )).overrideWith((ref) => _mentionedUserDisplay(userId)),
        memberRoleColorProvider(('u1', 'g1')).overrideWith((ref) => roleColor),
        userSettingsViewModelProvider.overrideWith(
          userSettingsOverride ?? _FakeUserSettings.new,
        ),
        use12HourTimeFormatProvider.overrideWithValue(false),
      ],
      child: MaterialApp(
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
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
  await tester.pump(const Duration(milliseconds: 1));
  addTearDown(() async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
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
          message: _systemMessage(
            type,
            reactions: const [reaction],
            call: type == messageTypeCall ? _sampleCall : null,
          ),
        );

        expect(find.byType(MessageReactionsBar), findsOneWidget);
        expect(find.text('3'), findsOneWidget);
      });
    }

    testWidgets('renders localized recipient add text', (tester) async {
      await _pumpSystemMessage(
        tester,
        message: _systemMessage(
          messageTypeRecipientAdd,
          mentionedUserIds: const <String>['u2'],
        ),
      );

      expect(find.textContaining('Sample User added u2'), findsOneWidget);
    });

    testWidgets('renders localized channel rename with new name', (
      tester,
    ) async {
      await _pumpSystemMessage(
        tester,
        message: _systemMessage(
          messageTypeChannelNameChange,
          content: 'New Group Name',
        ),
      );

      expect(
        find.textContaining('changed the channel name to New Group Name'),
        findsOneWidget,
      );
    });

    testWidgets('hides call system message without call payload', (
      tester,
    ) async {
      await _pumpSystemMessage(
        tester,
        message: _systemMessage(messageTypeCall),
      );

      expect(find.byType(SystemMessage), findsOneWidget);
      expect(find.textContaining('started a call'), findsNothing);
    });

    testWidgets('renders ongoing call with join action', (tester) async {
      await _pumpSystemMessage(
        tester,
        message: _systemMessage(messageTypeCall, call: _sampleCall),
      );

      expect(find.textContaining('started a call.'), findsOneWidget);
      expect(find.text('Join the call'), findsOneWidget);
    });

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
