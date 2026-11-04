// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_translation_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_actions_sheet.dart';
import 'package:fluxer_app/features/settings/providers/preferences/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/time_format_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/message_item_test_overrides.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

const String _otherUserId = '123456789012345678';

const int _sourceDeletedCrosspostFlags =
    messageFlagIsCrosspost | messageFlagSourceMessageDeleted;

Message _message({
  String? webhookId,
  bool authorIsBot = false,
  bool authorIsSystem = false,
  int type = messageTypeDefault,
  int flags = 0,
  MessageDeliveryState deliveryState = MessageDeliveryState.sent,
}) {
  return Message(
    id: 'm1',
    channelId: 'c1',
    authorId: webhookId ?? _otherUserId,
    authorName: webhookId == null ? 'Alice' : 'Harbor Bulletin',
    authorIsBot: authorIsBot,
    authorIsSystem: authorIsSystem,
    webhookId: webhookId,
    content: 'plain words',
    timestamp: DateTime(2026, 1, 1, 12),
    type: type,
    flags: flags,
    deliveryState: deliveryState,
  );
}

const MessageRenderSettings _settings = MessageRenderSettings(
  activeGuildId: null,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
);

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceRuntimeConfigOverride(),
      ...messageItemTestProviderOverrides(),
      use12HourTimeFormatProvider.overrideWithValue(false),
      fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
      contextualGuildIdProvider.overrideWithValue(null),
      instanceFeatureEnabledProvider(
        LimitKeys.featureGlobalExpressions,
      ).overrideWithValue(false),
      isMessageSavedProvider('m1').overrideWith((ref) => Stream.value(false)),
      favoriteMemesProvider.overrideWith(
        (ref) => Stream<List<FavoriteMeme>>.value(const <FavoriteMeme>[]),
      ),
      messageTranslationAvailableProvider.overrideWith(
        (ref) => Future<bool>.value(false),
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
      home: Scaffold(body: child),
    ),
  );
}

Widget _launcher(Future<void> Function(BuildContext, WidgetRef) open) {
  return Consumer(
    builder: (context, ref, _) => Center(
      child: TextButton(
        onPressed: () => open(context, ref),
        child: const Text('open'),
      ),
    ),
  );
}

Future<void> _openLauncher(WidgetTester tester) async {
  await tester.tap(find.text('open'));
  await tester.pump();
  await tester.pump(const Duration(seconds: 1));
}

Future<void> _openProfileActions(
  WidgetTester tester, {
  Message? message,
  bool canReportUserProfile = true,
}) {
  return tester.pumpWidget(
    _app(
      _launcher(
        (context, ref) => UserProfileActionsSheet.show(
          context,
          ref,
          relationship: null,
          user: const UserPartialResponse(
            id: _otherUserId,
            username: 'alice',
            discriminator: '0001',
            globalName: 'Alice',
            avatar: null,
            avatarColor: null,
            flags: 0,
          ),
          isCurrentUser: false,
          position: Offset.zero,
          displayName: 'Alice',
          message: message,
          canReportUserProfile: canReportUserProfile,
        ),
      ),
    ),
  );
}

Future<void> _longPressMessage(
  WidgetTester tester, {
  String text = 'plain',
}) async {
  final RenderParagraph paragraph = tester.allRenderObjects
      .whereType<RenderParagraph>()
      .firstWhere(
        (RenderParagraph candidate) =>
            candidate.text.toPlainText().contains(text),
      );
  await tester.longPressAt(paragraph.localToGlobal(Offset.zero));
  await tester.pump();
  await tester.pump(const Duration(seconds: 1));
}

Set<String> _libFilesContaining(Pattern pattern) {
  return Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .where((file) => !file.path.contains('/l10n/generated/'))
      .where((file) => file.readAsStringSync().contains(pattern))
      .map((file) => file.path)
      .toSet();
}

void main() {
  final FluxerLocalizations l10n = testL10n;

  group('report routes', () {
    test('in-app reports only use the report flow routes', () {
      expect(_libFilesContaining('/reports/message'), isEmpty);
      expect(_libFilesContaining('/reports/user'), isEmpty);
      expect(_libFilesContaining('/reports/guild'), isEmpty);
      expect(_libFilesContaining('.reports.report'), isEmpty);
      expect(_libFilesContaining('/reports/flows/'), <String>{
        'lib/features/moderation/data/report_flow_repository.dart',
      });
    });
  });

  group('user profile reports', () {
    messageItemTestWidgets(
      'the full profile actions menu offers Report profile',
      (tester) async {
        await _openProfileActions(tester);
        await _openLauncher(tester);

        expect(find.text(l10n.userProfileReportUserProfile), findsOneWidget);
        expect(find.text(l10n.userProfileReportMessage), findsNothing);
      },
    );

    messageItemTestWidgets(
      'other hosts of the actions menu do not offer Report profile',
      (tester) async {
        await _openProfileActions(tester, canReportUserProfile: false);
        await _openLauncher(tester);

        expect(find.text(l10n.userProfileCopyUserId), findsOneWidget);
        expect(find.text(l10n.userProfileReportUserProfile), findsNothing);
      },
    );
  });

  group('webhook and bot messages', () {
    for (final (String label, Message message) in <(String, Message)>[
      ('a regular message', _message()),
      ('a webhook message', _message(webhookId: '987654321098765432')),
      ('a bot message', _message(authorIsBot: true)),
    ]) {
      messageItemTestWidgets('the profile actions menu reports $label', (
        tester,
      ) async {
        await _openProfileActions(tester, message: message);
        await _openLauncher(tester);

        expect(find.text(l10n.userProfileReportMessage), findsOneWidget);
      });

      messageItemTestWidgets('the message actions sheet reports $label', (
        tester,
      ) async {
        await tester.pumpWidget(
          _app(MessageItem(message: message, renderSettings: _settings)),
        );
        await tester.pump();
        await _longPressMessage(tester);

        expect(find.text(l10n.chatMessageReply), findsOneWidget);
        expect(find.text(l10n.chatMessageReport), findsOneWidget);
      });
    }
  });

  group('messages that cannot be reported', () {
    for (final (String label, Message message, String visibleText)
        in <(String, Message, String)>[
          (
            'a system-authored message',
            _message(authorIsSystem: true),
            'plain',
          ),
          (
            'a source-deleted crosspost',
            _message(flags: _sourceDeletedCrosspostFlags),
            l10n.chatMessageOriginalDeleted,
          ),
        ]) {
      messageItemTestWidgets(
        'the profile actions menu does not report $label',
        (tester) async {
          await _openProfileActions(tester, message: message);
          await _openLauncher(tester);

          expect(find.text(l10n.userProfileCopyUserId), findsOneWidget);
          expect(find.text(l10n.userProfileReportMessage), findsNothing);
        },
      );

      messageItemTestWidgets(
        'the message actions sheet does not report $label',
        (tester) async {
          await tester.pumpWidget(
            _app(MessageItem(message: message, renderSettings: _settings)),
          );
          await tester.pump();
          await _longPressMessage(tester, text: visibleText);

          expect(find.text(l10n.chatMessageReply), findsOneWidget);
          expect(find.text(l10n.chatMessageReport), findsNothing);
        },
      );
    }
  });

  group('Message.isReportable', () {
    test('default and reply messages from other authors are reportable', () {
      expect(_message().isReportable, isTrue);
      expect(_message(type: messageTypeReply).isReportable, isTrue);
      expect(_message(authorIsBot: true).isReportable, isTrue);
      expect(_message(webhookId: '987654321098765432').isReportable, isTrue);
      expect(_message(flags: messageFlagIsCrosspost).isReportable, isTrue);
    });

    test('system-authored messages are not reportable', () {
      expect(_message(authorIsSystem: true).isReportable, isFalse);
    });

    test('messages that are sending or failed are not reportable', () {
      expect(
        _message(deliveryState: MessageDeliveryState.sending).isReportable,
        isFalse,
      );
      expect(
        _message(deliveryState: MessageDeliveryState.failed).isReportable,
        isFalse,
      );
    });

    test('other message types are not reportable', () {
      for (final int type in <int>[
        messageTypeRecipientAdd,
        messageTypeCall,
        messageTypeChannelPinnedMessage,
        messageTypeUserJoin,
        messageTypeChannelFollowAdd,
        messageTypeClientSystem,
      ]) {
        expect(_message(type: type).isReportable, isFalse, reason: '$type');
      }
    });

    test('source-deleted crossposts are not reportable', () {
      expect(
        _message(flags: _sourceDeletedCrosspostFlags).isReportable,
        isFalse,
      );
      expect(
        _message(flags: messageFlagSourceMessageDeleted).isReportable,
        isTrue,
      );
    });
  });
}
