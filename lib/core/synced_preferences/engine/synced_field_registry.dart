import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_overrides_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/chat_input_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/double_tap_action_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/double_tap_reaction_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorite_gifs_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorites_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/guild_folders_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/local_spam_overrides_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/member_list_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/nagbar_dismissals_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/privacy_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/search_engines_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sidebar_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sound_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/textual_preview_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/unread_channels_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/voice_prompts_synced_field.dart';

void registerDefaultSyncedFieldAdapters({
  required void Function(SyncedFieldAdapter<Object?> adapter) registerAdapter,
  required Ref ref,
  FavoritesLocalState? Function()? readSyncedLocalFavorites,
}) {
  registerAdapter(
    FavoritesSyncedField(ref, readSyncedLocal: readSyncedLocalFavorites),
  );
  registerAdapter(AccessibilitySyncedField(ref));
  registerAdapter(AccessibilityOverridesSyncedField(ref));
  registerAdapter(SearchEnginesSyncedField(ref));
  registerAdapter(SidebarSyncedField(ref));
  registerAdapter(PrivacySyncedField(ref));
  registerAdapter(MemberListSyncedField(ref));
  registerAdapter(UnreadChannelsSyncedField(ref));
  registerAdapter(VoicePromptsSyncedField(ref));
  registerAdapter(SoundSyncedField(ref));
  registerAdapter(GuildFoldersSyncedField(ref));
  registerAdapter(LocalSpamOverridesSyncedField(ref));
  registerAdapter(NagbarDismissalsSyncedField(ref));
  registerAdapter(TextualPreviewSyncedField(ref));
  registerAdapter(EmojiPickerSyncedField(ref));
  registerAdapter(StickerPickerSyncedField(ref));
  registerAdapter(FavoriteGifsSyncedField(ref));
  registerAdapter(ChatInputSyncedField(ref));
  registerAdapter(DoubleTapReactionSyncedField(ref));
  registerAdapter(DoubleTapActionSyncedField(ref));
}
