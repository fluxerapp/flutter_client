import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/l10n/api_locale.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/data/composer_autocomplete_members.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_panel.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/composer/mention_frecency_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/gif_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_slash_session.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_channel_mentions.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command_insertion.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_enter_send.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_mention_query.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_slash_commands.dart';
import 'package:fluxer_app/features/chat/utils/composer/emoji_autocomplete_search.dart';
import 'package:fluxer_app/features/chat/utils/media/klipy_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';

export 'composer_autocomplete_panel.dart';

part 'composer_autocomplete_field_state.dart';

enum AutocompleteRenderMode { overlay, inStack }

const Set<ComposerAutocompleteTriggerKind> kAllComposerAutocompleteTriggers =
    <ComposerAutocompleteTriggerKind>{
      ComposerAutocompleteTriggerKind.emojiReaction,
      ComposerAutocompleteTriggerKind.commandArgMention,
      ComposerAutocompleteTriggerKind.commandArg,
      ComposerAutocompleteTriggerKind.mention,
      ComposerAutocompleteTriggerKind.channel,
      ComposerAutocompleteTriggerKind.emoji,
      ComposerAutocompleteTriggerKind.meme,
      ComposerAutocompleteTriggerKind.gif,
      ComposerAutocompleteTriggerKind.sticker,
      ComposerAutocompleteTriggerKind.command,
    };

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
    this.slashSession,
    this.onSelectGif,
    this.onSelectSticker,
    this.onSelectMeme,
    super.key,
  }) : assert(
         renderMode != AutocompleteRenderMode.inStack ||
             (panelHost != null && panelScrollController != null),
         'inStack mode requires panelHost and panelScrollController',
       );

  final TextEditingController controller;

  final FocusNode focusNode;

  final Widget child;

  final String? channelId;

  final Set<ComposerAutocompleteTriggerKind> allowedTriggers;

  final int? maxActualLength;

  final VoidCallback? onApplied;

  final bool enabled;

  final AutocompleteRenderMode renderMode;

  final ComposerAutocompletePanelHost? panelHost;

  final ScrollController? panelScrollController;

  final ComposerSlashSession? slashSession;

  final ValueChanged<GifPickerGif>? onSelectGif;

  final ValueChanged<StickerEntry>? onSelectSticker;

  final ValueChanged<FavoriteMeme>? onSelectMeme;

  @override
  ConsumerState<ComposerAutocompleteField> createState() =>
      ComposerAutocompleteFieldState();
}

bool get _composerAutocompleteKeyboardEnabled {
  return defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;
}

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
  if (key == LogicalKeyboardKey.home) {
    state.moveSelectionToEdge(first: true);
    return KeyEventResult.handled;
  }
  if (key == LogicalKeyboardKey.end) {
    state.moveSelectionToEdge(first: false);
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
