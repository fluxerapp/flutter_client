import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_inline_mention.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';

String _composerMentionUserLabel(WidgetRef ref, String userId) {
  final String channelId = ref.read(chatViewModelProvider).channelId;
  if (channelId.isEmpty) {
    return shortMentionWireIdFallback(userId);
  }
  final DmViewState dmState = ref.read(dmViewModelProvider);
  final DmConversation? dm = findDmById(dmState.conversations, channelId);
  if (dm != null && userId == dm.recipientId) {
    return dm.recipientName;
  }
  final ChannelListState listState = ref.read(channelListViewModelProvider);
  final Channel? ch = findChannelById(listState, channelId);
  final String? guildId = ch?.guildId;
  if (guildId != null && guildId.isNotEmpty) {
    final GuildUserDisplay? display = ref
        .read(guildUserDisplayFromDbProvider((userId, guildId)))
        .value;
    if (display != null) {
      return display.displayName;
    }
    ref.read(guildUserDisplayProvider((userId, guildId)));
  }
  return shortMentionWireIdFallback(userId);
}

String _composerMentionChannelLabel(WidgetRef ref, String targetChannelId) {
  final ChannelListState listState = ref.read(channelListViewModelProvider);
  final Channel? ch = findChannelById(listState, targetChannelId);
  return ch?.name ?? shortMentionWireIdFallback(targetChannelId);
}

/// A user, role, or channel mention rendered inline as a chip while [wireText]
/// preserves the outgoing mention form for sending.
class MentionInlineToken extends InlineToken {
  MentionInlineToken({
    required this.wireText,
    required this.resolveVisibleText,
    this.colorArgb,
  });

  @override
  final String wireText;

  /// Resolves the visible chip label lazily, so live roster or channel renames
  /// are reflected when no explicit label was captured at insertion time.
  final String Function() resolveVisibleText;

  /// Packed ARGB colour for role mentions; `null` falls back to the link
  /// colour.
  final int? colorArgb;

  @override
  Widget buildInline(BuildContext context, TextStyle? baseStyle) =>
      ComposerInlineMention(
        visibleText: resolveVisibleText(),
        baseStyle: baseStyle,
        foregroundArgb: colorArgb,
      );
}

/// Renders user, channel, and role mentions - and inserted emoji - as inline
/// chips while [toWireText] preserves their wire forms for sending.
class ComposerMentionController extends InlineTokenTextEditingController {
  ComposerMentionController({required WidgetRef ref, super.text}) : _ref = ref;

  final WidgetRef _ref;

  static final RegExp _wireMentions = RegExp(
    '<@&([^>]+)>|<@!?([^>]+)>|<#([^>]+)>',
  );

  /// Rebuilds the field from a wire string, re-chipping mentions and custom
  /// emoji. Plain `:name:` shortcodes are left as text (only explicitly
  /// inserted emoji chip) to avoid mis-chipping typed colons like `12:30:45`.
  Future<void> applyWireText(String wire) async {
    if (toWireText() == wire) {
      return;
    }
    final List<RegExpMatch> matches = _wireMentions.allMatches(wire).toList();
    // Resolve referenced roles up front so the rebuild below runs as a single
    // synchronous mutation - no awaits between clearing and committing the new
    // value, which would otherwise flash an empty or half-built field. Only
    // touch the database when a role mention is actually present.
    final Map<String, db.Role?> rolesById = <String, db.Role?>{};
    if (matches.any((RegExpMatch m) => m.group(1) != null)) {
      final db.FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
      for (final RegExpMatch m in matches) {
        final String? roleId = m.group(1);
        if (roleId != null && !rolesById.containsKey(roleId)) {
          rolesById[roleId] = await database.roleDao.getRoleById(roleId);
        }
      }
    }

    clearTokens();
    final StringBuffer display = StringBuffer();
    int start = 0;
    for (final RegExpMatch m in matches) {
      display.write(wire.substring(start, m.start));
      final String? roleId = m.group(1);
      final String? userId = m.group(2);
      final String? channelId = m.group(3);
      if (roleId != null) {
        final db.Role? row = rolesById[roleId];
        final String label = row?.name ?? shortMentionWireIdFallback(roleId);
        final int? colorArgb = row?.color;
        display.write(
          allocateToken(
            MentionInlineToken(
              wireText: '<@&$roleId>',
              resolveVisibleText: () => '@$label',
              colorArgb: colorArgb,
            ),
          ),
        );
      } else if (userId != null) {
        display.write(
          allocateToken(
            MentionInlineToken(
              wireText: '<@$userId>',
              resolveVisibleText: () =>
                  '@${_composerMentionUserLabel(_ref, userId)}',
            ),
          ),
        );
      } else if (channelId != null) {
        display.write(
          allocateToken(
            MentionInlineToken(
              wireText: '<#$channelId>',
              resolveVisibleText: () =>
                  '#${_composerMentionChannelLabel(_ref, channelId)}',
            ),
          ),
        );
      }
      start = m.end;
    }
    display.write(wire.substring(start));
    final String next = substituteEmojiTokens(
      display.toString(),
      allocateToken,
      includePlainShortcodes: false,
    );
    value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: next.length),
    );
  }

  void insertUserMentionPlaceholder({
    required int matchStart,
    required int matchEnd,
    required String userId,
    String? displayName,
  }) {
    replaceRangeWithToken(
      matchStart,
      matchEnd,
      MentionInlineToken(
        wireText: '<@$userId>',
        resolveVisibleText: () =>
            '@${displayName ?? _composerMentionUserLabel(_ref, userId)}',
      ),
      ensureTrailingSpace: true,
    );
  }

  void insertChannelMentionPlaceholder({
    required int matchStart,
    required int matchEnd,
    required String channelId,
    String? displayName,
  }) {
    replaceRangeWithToken(
      matchStart,
      matchEnd,
      MentionInlineToken(
        wireText: '<#$channelId>',
        resolveVisibleText: () =>
            '#${displayName ?? _composerMentionChannelLabel(_ref, channelId)}',
      ),
      ensureTrailingSpace: true,
    );
  }

  void insertRoleMentionPlaceholder({
    required int matchStart,
    required int matchEnd,
    required String roleId,
    required String displayName,
    int? colorArgb,
  }) {
    replaceRangeWithToken(
      matchStart,
      matchEnd,
      MentionInlineToken(
        wireText: '<@&$roleId>',
        resolveVisibleText: () => '@$displayName',
        colorArgb: colorArgb,
      ),
      ensureTrailingSpace: true,
    );
  }

  /// Picker-inserted emoji in a message composer always get a trailing space so
  /// the next typed text does not abut the emoji, matching the emoji
  /// autocomplete path which inserts with [ensureTrailingSpace] as well.
  @override
  void insertEmoji(
    String name,
    String surrogates, {
    int? maxActualLength,
    bool ensureTrailingSpace = true,
  }) {
    super.insertEmoji(
      name,
      surrogates,
      maxActualLength: maxActualLength,
      ensureTrailingSpace: ensureTrailingSpace,
    );
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    required bool withComposing,
    TextStyle? style,
  }) {
    if (withComposing &&
        value.composing.isValid &&
        !value.composing.isCollapsed &&
        value.isComposingRangeValid) {
      final TextStyle? composingStyle = style?.merge(
        const TextStyle(decoration: TextDecoration.underline),
      );
      return TextSpan(
        style: style,
        children: <TextSpan>[
          TextSpan(text: value.composing.textBefore(value.text)),
          TextSpan(
            style: composingStyle,
            text: value.text.substring(
              value.composing.start,
              value.composing.end,
            ),
          ),
          TextSpan(text: value.composing.textAfter(value.text)),
        ],
      );
    }
    return super.buildTextSpan(
      context: context,
      withComposing: withComposing,
      style: style,
    );
  }
}
