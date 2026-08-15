import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/dm/presentation/create_dm_flow.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_modal.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/presentation/keyboard_shortcuts_cheatsheet_modal.dart';
import 'package:fluxer_app/features/input/providers/chat_keybind_effects_provider.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/input/providers/focused_message_provider.dart';
import 'package:fluxer_app/features/input/providers/keybind_handler_registry.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/input/services/keybind_navigation.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/sheets/quick_switcher_bottom_sheet.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_provider.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_providers.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts_provider.dart';
import 'package:fluxer_app/features/voice/tts/tts_locale_utils.dart';
import 'package:fluxer_app/features/voice/utils/incoming_voice_call_actions.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:material_ui/material_ui.dart';

void registerKeybindHandlers({
  required WidgetRef ref,
  required BuildContext context,
}) {
  final KeybindHandlerRegistry registry = ref.read(
    keybindHandlerRegistryProvider,
  );
  final KeybindNavigation nav = KeybindNavigation(ref);
  final ComposerFocusCoordinator composerFocus = ref.read(
    composerFocusCoordinatorProvider,
  );

  Message? focusedMessage() {
    return lookupFocusedMessage(
      ref.read(focusedMessageProvider),
      ref.read(chatViewModelProvider).messages,
    );
  }

  Future<bool> withFocusedMessage(
    FutureOr<bool> Function(Message message) action,
  ) async {
    final Message? message = focusedMessage();
    if (message == null) {
      return false;
    }
    return action(message);
  }

  registry
    ..register(KeybindAction.systemToggleShortcutsOverlay, () async {
      if (!context.mounted) {
        return false;
      }
      await KeyboardShortcutsCheatsheetModal.show(context);
      return true;
    })
    ..register(KeybindAction.systemToggleSettings, () async {
      if (!context.mounted) {
        return false;
      }
      await UserSettingsModal.show(context);
      return true;
    })
    ..register(KeybindAction.navQuickSwitcher, () async {
      if (!context.mounted) {
        return false;
      }
      if (ref.read(quickSwitcherProvider).isOpen) {
        return false;
      }
      await QuickSwitcherBottomSheet.show(context, ref);
      return true;
    })
    ..register(KeybindAction.navAddGuild, () async {
      if (!context.mounted) {
        return false;
      }
      await showAddGuildModal(context, ref);
      return true;
    })
    ..register(KeybindAction.navGuildPrev, () async {
      nav.goToAdjacentGuild(previous: true);
      return true;
    })
    ..register(KeybindAction.navGuildNext, () async {
      nav.goToAdjacentGuild(previous: false);
      return true;
    })
    ..register(KeybindAction.navChannelPrev, () async {
      if (!context.mounted) {
        return false;
      }
      await nav.goToAdjacentChannel(context: context, previous: true);
      return true;
    })
    ..register(KeybindAction.navChannelNext, () async {
      if (!context.mounted) {
        return false;
      }
      await nav.goToAdjacentChannel(context: context, previous: false);
      return true;
    })
    ..register(KeybindAction.navHistoryBack, () async {
      if (!context.mounted) {
        return false;
      }
      await nav.goHistory(context: context, back: true);
      return true;
    })
    ..register(KeybindAction.navHistoryForward, () async {
      if (!context.mounted) {
        return false;
      }
      await nav.goHistory(context: context, back: false);
      return true;
    })
    ..register(KeybindAction.navToggleLastGuildDms, () async {
      nav.toggleLastGuildAndDms();
      return true;
    })
    ..register(KeybindAction.navGuildTabPrev, () async {
      nav.goToAdjacentGuildTab(previous: true);
      return true;
    })
    ..register(KeybindAction.navGuildTabNext, () async {
      nav.goToAdjacentGuildTab(previous: false);
      return true;
    })
    ..register(KeybindAction.navCurrentCall, () async {
      if (!context.mounted) {
        return false;
      }
      await nav.goToCurrentCall(context: context);
      return true;
    })
    ..register(KeybindAction.navGuildSlot1, () async {
      nav.goToGuildSlot(1);
      return true;
    })
    ..register(KeybindAction.navGuildSlot2, () async {
      nav.goToGuildSlot(2);
      return true;
    })
    ..register(KeybindAction.navGuildSlot3, () async {
      nav.goToGuildSlot(3);
      return true;
    })
    ..register(KeybindAction.navGuildSlot4, () async {
      nav.goToGuildSlot(4);
      return true;
    })
    ..register(KeybindAction.navGuildSlot5, () async {
      nav.goToGuildSlot(5);
      return true;
    })
    ..register(KeybindAction.navGuildSlot6, () async {
      nav.goToGuildSlot(6);
      return true;
    })
    ..register(KeybindAction.navGuildSlot7, () async {
      nav.goToGuildSlot(7);
      return true;
    })
    ..register(KeybindAction.navGuildSlot8, () async {
      nav.goToGuildSlot(8);
      return true;
    })
    ..register(KeybindAction.navGuildSlot9, () async {
      nav.goToGuildSlot(9);
      return true;
    })
    ..register(KeybindAction.chatFocusTextarea, () async {
      composerFocus.requestComposerFocus();
      return true;
    })
    ..register(KeybindAction.chatToggleMemberList, () async {
      final String? channelId = ref.read(activeChannelIdProvider);
      if (channelId == null) {
        return false;
      }
      final Channel? channel = ref.read(channelByIdProvider(channelId)).value;
      ref
          .read(channelListViewModelProvider.notifier)
          .toggleMemberList(channelId: channelId, channelType: channel?.type);
      return true;
    })
    ..register(KeybindAction.chatToggleEmoji, () async {
      ref.read(expressionPanelTabProvider.notifier).tab =
          ExpressionPickerTab.emojis;
      ref.read(expressionPanelProvider.notifier).open();
      return true;
    })
    ..register(KeybindAction.chatToggleGif, () async {
      ref.read(expressionPanelTabProvider.notifier).tab =
          ExpressionPickerTab.gifs;
      ref.read(expressionPanelProvider.notifier).open();
      return true;
    })
    ..register(KeybindAction.chatToggleSticker, () async {
      ref.read(expressionPanelTabProvider.notifier).tab =
          ExpressionPickerTab.stickers;
      ref.read(expressionPanelProvider.notifier).open();
      return true;
    })
    ..register(KeybindAction.chatTogglePins, () async {
      ref
          .read(chatKeybindEffectsProvider.notifier)
          .emit(ChatKeybindEffect.togglePins);
      return true;
    })
    ..register(KeybindAction.chatUpload, () async {
      ref
          .read(chatKeybindEffectsProvider.notifier)
          .emit(ChatKeybindEffect.triggerUpload);
      return true;
    })
    ..register(KeybindAction.chatScrollUp, () async {
      ref
          .read(chatKeybindEffectsProvider.notifier)
          .emit(ChatKeybindEffect.scrollPageUp);
      return true;
    })
    ..register(KeybindAction.chatScrollDown, () async {
      ref
          .read(chatKeybindEffectsProvider.notifier)
          .emit(ChatKeybindEffect.scrollPageDown);
      return true;
    })
    ..register(KeybindAction.chatJumpOldestUnread, () async {
      await ref.read(chatViewModelProvider.notifier).jumpToFirstUnread();
      return true;
    })
    ..register(KeybindAction.chatNewDm, () async {
      if (!context.mounted) {
        return false;
      }
      await CreateDmFlow.show(context);
      return true;
    })
    ..register(KeybindAction.chatCopyChannelLink, () async {
      final String? channelId = ref.read(activeChannelIdProvider);
      if (channelId == null || !context.mounted) {
        return false;
      }
      final String? guildId = ref.read(activeGuildIdProvider);
      await copyToClipboard(
        context: context,
        value: channelLink(channelId, guildId),
      );
      return true;
    })
    ..register(KeybindAction.chatMarkGuildRead, () async {
      final String? guildId = ref.read(activeGuildIdProvider);
      if (guildId == null) {
        return false;
      }
      await markGuildAsRead(
        guildId,
        ref.read(fluxerDatabaseProvider),
        ref.read(fluxerClientProvider),
      );
      return true;
    })
    ..register(KeybindAction.chatMarkChannelRead, () async {
      final String? channelId = ref.read(activeChannelIdProvider);
      if (channelId == null) {
        return false;
      }
      final unread = ref.read(channelUnreadProvider(channelId)).value;
      if (unread == null || !unread.hasUnreadMessages) {
        return false;
      }
      final repo = ref.read(readStateRepositoryProvider);
      final String? messageId = await repo.latestAckableMessageId(channelId);
      if (messageId == null) {
        return false;
      }
      await repo.applyLocalAckUpTo(channelId, messageId);
      unawaited(repo.sendAckHttp(channelId, messageId));
      return true;
    })
    ..register(KeybindAction.chatToggleInbox, () async {
      ref.read(fluxerRouterProvider).go('/notifications');
      return true;
    })
    ..register(KeybindAction.chatMarkInboxRead, () async {
      final List<UnreadInboxEntry> entries = await ref.read(
        unreadInboxChannelListProvider.future,
      );
      if (entries.isEmpty) {
        return false;
      }
      final NotificationsRepository repo = ref.read(
        notificationsRepositoryProvider,
      );
      await repo.markAllInboxChannelsAsRead(<UnreadInboxEntry>[entries.first]);
      ref.invalidate(unreadInboxChannelListProvider);
      return true;
    })
    ..register(KeybindAction.miscSearch, () async {
      final String? channelId = ref.read(activeChannelIdProvider);
      final String? guildId = ref.read(activeGuildIdProvider);
      if (channelId == null) {
        return false;
      }
      ref
          .read(channelHeaderSearchProvider.notifier)
          .activateSearch(channelId: channelId, guildId: guildId);
      return true;
    })
    ..register(KeybindAction.voiceToggleMute, () async {
      await ref.read(localVoiceStateProvider.notifier).toggleSelfMute();
      return true;
    })
    ..register(KeybindAction.voiceToggleDeafen, () async {
      final voice = ref.read(localVoiceStateProvider);
      await ref
          .read(localVoiceStateProvider.notifier)
          .setSelfDeaf(deafened: !voice.selfDeaf);
      return true;
    })
    ..register(KeybindAction.voiceAnswerCall, () async {
      final List<String> pending = ref.read(
        pendingIncomingVoiceChannelIdsProvider,
      );
      if (pending.isEmpty || !context.mounted) {
        return false;
      }
      await executeAcceptIncomingVoiceCall(ref, context, pending.first);
      return true;
    })
    ..register(KeybindAction.voiceDeclineCall, () async {
      final List<String> pending = ref.read(
        pendingIncomingVoiceChannelIdsProvider,
      );
      if (pending.isEmpty || !context.mounted) {
        return false;
      }
      await executeDeclineIncomingVoiceCall(ref, context, pending.first);
      return true;
    })
    ..register(KeybindAction.messageEdit, () {
      return withFocusedMessage((Message message) {
        ref.read(chatViewModelProvider.notifier).startEdit(message);
        composerFocus.requestComposerFocus();
        return true;
      });
    })
    ..register(KeybindAction.messageReply, () {
      return withFocusedMessage((Message message) {
        ref.read(chatViewModelProvider.notifier).startReply(message);
        composerFocus.requestComposerFocus();
        return true;
      });
    })
    ..register(KeybindAction.messageDelete, () {
      return withFocusedMessage((Message message) async {
        await ref
            .read(chatViewModelProvider.notifier)
            .deleteMessage(message.id);
        return true;
      });
    })
    ..register(KeybindAction.messageMarkUnread, () {
      return withFocusedMessage((Message message) async {
        await ref
            .read(chatViewModelProvider.notifier)
            .markMessageUnread(message.id);
        return true;
      });
    })
    ..register(KeybindAction.messagePin, () {
      return withFocusedMessage((Message message) async {
        final String channelId = ref.read(chatViewModelProvider).channelId;
        await ref
            .read(channelPinsRepositoryProvider)
            .pinMessage(channelId: channelId, messageId: message.id);
        return true;
      });
    })
    ..register(KeybindAction.messageReact, () async {
      if (focusedMessage() == null) {
        return false;
      }
      ref
          .read(chatKeybindEffectsProvider.notifier)
          .emit(ChatKeybindEffect.addReaction);
      return true;
    })
    ..register(KeybindAction.messageForward, () {
      return withFocusedMessage((Message message) async {
        if (!context.mounted) {
          return false;
        }
        await showForwardMessageSheet(context, message: message);
        return true;
      });
    })
    ..register(KeybindAction.messageSpeak, () {
      return withFocusedMessage((Message message) async {
        final appearance = ref.read(appearancePreferencesProvider);
        await ref
            .read(fluxerTtsServiceProvider.notifier)
            .speakMessage(
              message: message,
              rate: appearance.ttsRate,
              locale: formatTtsLocaleTag(ref.read(effectiveAppLocaleProvider)),
            );
        return true;
      });
    })
    ..register(KeybindAction.messageCopyText, () {
      return withFocusedMessage((Message message) async {
        final String text = message.content.trim();
        if (text.isEmpty || !context.mounted) {
          return false;
        }
        await copyToClipboard(context: context, value: text);
        return true;
      });
    })
    ..register(KeybindAction.messageFocusTextarea, () async {
      ref.read(keyboardModeProvider.notifier).exit();
      ref.read(focusedMessageProvider.notifier).clear();
      composerFocus.requestComposerFocus();
      return true;
    })
    ..register(KeybindAction.navUnreadPrev, () async {
      if (!context.mounted) {
        return false;
      }
      final List<QuickSwitcherUnreadChannel> unread = await _loadUnread(ref);
      if (!context.mounted) {
        return false;
      }
      await nav.goUnreadChannel(
        context: context,
        previous: true,
        mentionsOnly: false,
        unread: unread,
      );
      return true;
    })
    ..register(KeybindAction.navUnreadNext, () async {
      if (!context.mounted) {
        return false;
      }
      final List<QuickSwitcherUnreadChannel> unread = await _loadUnread(ref);
      if (!context.mounted) {
        return false;
      }
      await nav.goUnreadChannel(
        context: context,
        previous: false,
        mentionsOnly: false,
        unread: unread,
      );
      return true;
    })
    ..register(KeybindAction.navMentionPrev, () async {
      if (!context.mounted) {
        return false;
      }
      final List<QuickSwitcherUnreadChannel> unread = await _loadUnread(ref);
      if (!context.mounted) {
        return false;
      }
      await nav.goUnreadChannel(
        context: context,
        previous: true,
        mentionsOnly: true,
        unread: unread,
      );
      return true;
    })
    ..register(KeybindAction.navMentionNext, () async {
      if (!context.mounted) {
        return false;
      }
      final List<QuickSwitcherUnreadChannel> unread = await _loadUnread(ref);
      if (!context.mounted) {
        return false;
      }
      await nav.goUnreadChannel(
        context: context,
        previous: false,
        mentionsOnly: true,
        unread: unread,
      );
      return true;
    });
}

Future<List<QuickSwitcherUnreadChannel>> _loadUnread(WidgetRef ref) {
  final dmState = ref.read(dmViewModelProvider);
  return ref
      .read(quickSwitcherRepositoryProvider)
      .getUnreadChannels(
        currentUserId: ref.read(currentUserIdProvider),
        conversations: dmState.conversations,
      );
}
