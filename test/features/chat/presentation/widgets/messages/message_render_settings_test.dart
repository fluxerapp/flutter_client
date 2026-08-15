import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/shared/markdown/message_markdown_settings.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('MessageRenderSettings equality', () {
    MessageRenderSettings makeSettings({
      bool renderEmbeds = true,
      bool messageDisplayCompact = false,
      bool showUserAvatarsInCompactMode = false,
      ChatPreferencesState chatPreferences = const ChatPreferencesState(),
      double messageGroupSpacing = 16,
    }) {
      return MessageRenderSettings(
        activeGuildId: 'g1',
        renderEmbeds: renderEmbeds,
        renderReactions: true,
        inlineAttachmentMedia: true,
        renderSpoilers: RenderSpoilers.onClick,
        revealSpoilers: false,
        chatPreferences: chatPreferences,
        messageGroupSpacing: messageGroupSpacing,
        messageDisplayCompact: messageDisplayCompact,
        showUserAvatarsInCompactMode: showUserAvatarsInCompactMode,
      );
    }

    test('equal field values compare equal with equal hashCode', () {
      final MessageRenderSettings a = makeSettings();
      final MessageRenderSettings b = makeSettings();
      expect(a, equals(b));
      expect(a.hashCode, b.hashCode);
    });

    test('a differing field makes them unequal', () {
      final MessageRenderSettings a = makeSettings();
      final MessageRenderSettings b = makeSettings(renderEmbeds: false);
      expect(a, isNot(equals(b)));
    });

    test('a differing chatPreferences instance makes them unequal', () {
      final MessageRenderSettings a = makeSettings();
      final MessageRenderSettings b = makeSettings(
        chatPreferences: const ChatPreferencesState(sanitizeUrls: false),
      );
      expect(a, isNot(equals(b)));
    });

    test('a differing messageGroupSpacing makes them unequal', () {
      final MessageRenderSettings a = makeSettings();
      final MessageRenderSettings b = makeSettings(messageGroupSpacing: 0);
      expect(a, isNot(equals(b)));
    });
    test('messageDisplayCompact participates in equality', () {
      final MessageRenderSettings compact = makeSettings(
        messageDisplayCompact: true,
      );
      final MessageRenderSettings comfy = makeSettings();
      expect(compact, isNot(equals(comfy)));
    });

    test('showUserAvatarsInCompactMode participates in equality', () {
      final MessageRenderSettings withAvatars = makeSettings(
        messageDisplayCompact: true,
        showUserAvatarsInCompactMode: true,
      );
      final MessageRenderSettings withoutAvatars = makeSettings(
        messageDisplayCompact: true,
      );
      expect(withAvatars, isNot(equals(withoutAvatars)));
    });

    test('markdown participates in equality', () {
      const MessageRenderSettings a = MessageRenderSettings(
        activeGuildId: 'g1',
        renderEmbeds: true,
        renderReactions: true,
        inlineAttachmentMedia: true,
        renderSpoilers: RenderSpoilers.onClick,
        revealSpoilers: false,
        chatPreferences: ChatPreferencesState(),
        messageGroupSpacing: 16,
      );
      const MessageRenderSettings b = MessageRenderSettings(
        activeGuildId: 'g1',
        renderEmbeds: true,
        renderReactions: true,
        inlineAttachmentMedia: true,
        renderSpoilers: RenderSpoilers.onClick,
        revealSpoilers: false,
        chatPreferences: ChatPreferencesState(),
        messageGroupSpacing: 16,
        markdown: MessageMarkdownSettings(
          use12Hour: true,
          alwaysUnderlineLinks: false,
          dimStrikethroughText: true,
          animateCustomEmoji: true,
          enableTextSelection: false,
          searchEngines: SearchEnginesState(),
        ),
      );
      expect(a, isNot(equals(b)));
    });
  });
}
