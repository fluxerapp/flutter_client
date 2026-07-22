import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/data/composer_autocomplete_members.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/service/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/chat/utils/emoji_autocomplete_search.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

part 'composer_autocomplete_field_state.dart';
part 'composer_autocomplete_panel.dart';

/// Where the autocomplete suggestion list is rendered.
enum AutocompleteRenderMode {
  /// Floating overlay anchored above the input (bio, forward comment, etc.).
  overlay,

  /// Bottom strip in the chat message-list stack, overlaying message content.
  inStack,
}

/// Every autocomplete trigger the chat composer understands. Surfaces that only
/// support a subset (e.g. an emoji-only bio field) pass a narrower set.
const Set<ComposerAutocompleteTriggerKind> kAllComposerAutocompleteTriggers =
    <ComposerAutocompleteTriggerKind>{
      ComposerAutocompleteTriggerKind.emojiReaction,
      ComposerAutocompleteTriggerKind.mention,
      ComposerAutocompleteTriggerKind.channel,
      ComposerAutocompleteTriggerKind.emoji,
    };

/// Wraps a text input ([child]) with `@mention`, `#channel`, and `:emoji:`
/// autocomplete.
///
/// In [AutocompleteRenderMode.overlay] suggestions render in a floating overlay
/// above the field. In [AutocompleteRenderMode.inStack] the field publishes to
/// [panelHost] and [ComposerAutocompletePanelStrip] renders the list in the chat
/// stack over the message list.
class ComposerAutocompleteField extends ConsumerStatefulWidget {
  const ComposerAutocompleteField({
    required this.controller,
    required this.focusNode,
    required this.child,
    this.channelId,
    this.allowedTriggers = kAllComposerAutocompleteTriggers,
    this.maxActualLength,
    this.onApplied,
    this.enabled = true,
    this.renderMode = AutocompleteRenderMode.overlay,
    this.panelHost,
    this.panelScrollController,
    super.key,
  }) : assert(
         renderMode != AutocompleteRenderMode.inStack ||
             (panelHost != null && panelScrollController != null),
         'inStack mode requires panelHost and panelScrollController',
       );

  /// The input's controller. When it is an
  /// [InlineTokenTextEditingController] emoji are inserted as inline chips; a
  /// [ComposerMentionController] also gets mention/channel chips.
  final TextEditingController controller;

  /// The input's focus node. Losing focus dismisses the menu.
  final FocusNode focusNode;

  /// The input widget to decorate (e.g. `TextField`, `FluxerInput.multiline`).
  final Widget child;

  /// The channel providing mention/#channel/permission context. `null` or empty
  /// means no channel (e.g. a bio): mentions/channels are unavailable and every
  /// accessible custom emoji is offered without channel permission gating.
  final String? channelId;

  /// Trigger kinds this field reacts to. Defaults to all.
  final Set<ComposerAutocompleteTriggerKind> allowedTriggers;

  /// Upper bound on the controller's wire length when inserting an emoji chip.
  final int? maxActualLength;

  /// Invoked after a suggestion is applied (e.g. to mirror `onChanged`).
  final VoidCallback? onApplied;

  /// When false, autocomplete is suppressed (the [child] still renders).
  final bool enabled;

  /// How suggestion UI is positioned. Chat composer uses [AutocompleteRenderMode.inStack].
  final AutocompleteRenderMode renderMode;

  /// Host for [AutocompleteRenderMode.inStack]. Updated when suggestions change.
  final ComposerAutocompletePanelHost? panelHost;

  /// Scroll controller paired with [panelHost] for keyboard-driven selection.
  final ScrollController? panelScrollController;

  @override
  ConsumerState<ComposerAutocompleteField> createState() =>
      ComposerAutocompleteFieldState();
}

/// True on native desktop platforms, where the composer supports hardware
/// keyboard navigation of the autocomplete menu. Mirrors the chat composer's
/// historical `!kIsWeb && (linux|macOS|windows)` gate.
bool get _composerAutocompleteKeyboardEnabled {
  if (kIsWeb) {
    return false;
  }
  return defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;
}

/// Whether [key] is the main or numpad Enter/Return key.
bool isComposerSubmitKey(LogicalKeyboardKey key) {
  return key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter;
}

/// Routes hardware-keyboard navigation keys to an open autocomplete menu.
///
/// Returns [KeyEventResult.handled] when the key drove the menu (arrows move
/// the selection, Tab/Enter apply it, Escape closes it), otherwise
/// [KeyEventResult.ignored] so the input handles the key normally. Shift+Enter
/// is always ignored so multiline inputs keep inserting newlines. A no-op on
/// non-desktop platforms and when [state] has no open menu.
KeyEventResult handleComposerAutocompleteKey(
  ComposerAutocompleteFieldState? state,
  KeyEvent event,
) {
  if (state == null || !state.hasOpenMenu) {
    return KeyEventResult.ignored;
  }
  if (!_composerAutocompleteKeyboardEnabled) {
    return KeyEventResult.ignored;
  }
  if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
    return KeyEventResult.ignored;
  }
  final LogicalKeyboardKey key = event.logicalKey;
  if (key == LogicalKeyboardKey.escape) {
    state.closeAutocompleteMenu();
    return KeyEventResult.handled;
  }
  if (key == LogicalKeyboardKey.arrowDown) {
    state.moveSelection(1);
    return KeyEventResult.handled;
  }
  if (key == LogicalKeyboardKey.arrowUp) {
    state.moveSelection(-1);
    return KeyEventResult.handled;
  }
  if (key == LogicalKeyboardKey.tab) {
    state.applyCurrentSelection();
    return KeyEventResult.handled;
  }
  if (isComposerSubmitKey(key)) {
    if (HardwareKeyboard.instance.isShiftPressed) {
      return KeyEventResult.ignored;
    }
    state.applyCurrentSelection();
    return KeyEventResult.handled;
  }
  return KeyEventResult.ignored;
}
