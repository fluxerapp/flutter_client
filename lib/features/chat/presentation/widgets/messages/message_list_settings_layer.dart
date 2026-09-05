part of 'message_list.dart';

/// User settings and channel permission watches isolated from the message list
/// body so read-state and message updates do not rebuild settings providers.
class _MessageListSettingsLayer extends ConsumerWidget {
  const _MessageListSettingsLayer({
    required this.channelId,
    required this.isDmChannel,
    required this.channelPermissionBits,
    required this.builder,
  });

  final String channelId;
  final bool isDmChannel;
  final int? channelPermissionBits;
  final Widget Function(
    BuildContext context,
    MessageRenderSettings settings,
    String? guildId, {
    required bool isGuildSendDisabled,
    required ({
      bool canSendMessages,
      bool canAddReactions,
      bool canPinMessage,
      bool canManageMessages,
    })
    channelActions,
  })
  builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChannelMessagePermissions channelMessagePerms = channelId.isEmpty
        ? ChannelMessagePermissions.unresolved
        : watchChannelMessagePermissionsForComposer(ref, channelId);
    final DmConversation? dmConversation = ref.watch(
      dmViewModelProvider.select((DmViewState dmState) {
        return findDmById(dmState.conversations, channelId);
      }),
    );
    final bool interactionsBlocked =
        dmConversation != null && isSystemDmConversation(dmConversation);
    final RenderSpoilers renderSpoilers = ref.watch(
      userSettingsViewModelProvider.select((s) => s.renderSpoilers),
    );
    final String? guildId = ref.watch(contextualGuildIdProvider);
    final bool isGuildSendDisabled =
        guildId != null &&
        guildId.isNotEmpty &&
        ref.watch(
          guildByIdProvider(guildId).select(
            (AsyncValue<Guild?> guild) => guild.value?.isSendDisabled ?? false,
          ),
        );
    final SearchEnginesState searchEngines = ref.watch(
      advancedPreferencesProvider.select((s) => s.searchEngines),
    );
    final bool messageDisplayCompact = ref.watch(
      userSettingsViewModelProvider.select((s) => s.messageDisplayCompact),
    );
    final MessageRenderSettings settings = MessageRenderSettings(
      activeGuildId: guildId,
      renderEmbeds: ref.watch(
        userSettingsViewModelProvider.select((s) => s.renderEmbeds),
      ),
      renderReactions: ref.watch(
        userSettingsViewModelProvider.select((s) => s.renderReactions),
      ),
      inlineAttachmentMedia: ref.watch(
        userSettingsViewModelProvider.select((s) => s.inlineAttachmentMedia),
      ),
      renderSpoilers: renderSpoilers,
      revealSpoilers: switch (renderSpoilers) {
        RenderSpoilers.always => true,
        RenderSpoilers.ifModerator =>
          channelId.isNotEmpty &&
              (ref.watch(spoilerAutoRevealProvider(channelId)).value ?? false),
        RenderSpoilers.onClick || RenderSpoilers.$unknown => false,
      },
      // Rebuild only when media sizes change.
      chatPreferences: _watchChatMediaPreferences(ref),
      messageGroupSpacing: ref.watch(
        appearancePreferencesProvider.select(
          (AppearancePreferencesState s) => messageGroupSpacingForDisplayMode(
            messageGroupSpacing: s.messageGroupSpacing,
            compactMessageGroupSpacing: s.compactMessageGroupSpacing,
            messageDisplayCompact: messageDisplayCompact,
          ),
        ),
      ),
      messageDisplayCompact: messageDisplayCompact,
      showUserAvatarsInCompactMode: ref.watch(
        appearancePreferencesProvider.select(
          (s) => s.showUserAvatarsInCompactMode,
        ),
      ),
      markdown: MessageMarkdownSettings(
        use12Hour: ref.watch(use12HourTimeFormatProvider),
        alwaysUnderlineLinks: ref.watch(
          appearancePreferencesProvider.select((s) => s.alwaysUnderlineLinks),
        ),
        dimStrikethroughText: ref.watch(
          appearancePreferencesProvider.select((s) => s.dimStrikethroughText),
        ),
        animateCustomEmoji: effectiveMotionOf(
          ref,
          context,
        ).effectiveAnimateEmoji,
        enableTextSelection: ref.watch(
          advancedPreferencesProvider.select((s) => s.enableTextSelection),
        ),
        searchEngines: searchEngines,
        selectionContextMenuBuilder: selectionMenuBuilderFor(searchEngines),
      ),
    );
    return builder(
      context,
      settings,
      guildId,
      isGuildSendDisabled: isGuildSendDisabled,
      channelActions: (
        canSendMessages: channelMessagePerms.canSendMessages,
        canAddReactions: canAddReactionsInChannel(
          isDmChannel: isDmChannel,
          channelPermissionBits: channelPermissionBits,
          interactionsBlocked: interactionsBlocked,
        ),
        canPinMessage: canPinMessageInChannel(
          isDmChannel: isDmChannel,
          channelPermissionBits: channelPermissionBits,
          interactionsBlocked: interactionsBlocked,
        ),
        canManageMessages: canManageMessagesInChannel(
          isDmChannel: isDmChannel,
          channelPermissionBits: channelPermissionBits,
        ),
      ),
    );
  }
}

ChatPreferencesState _watchChatMediaPreferences(WidgetRef ref) {
  ref.watch(
    chatPreferencesProvider.select(
      (ChatPreferencesState s) =>
          (s.embedMediaDimensionSize, s.attachmentMediaDimensionSize),
    ),
  );
  return ref.read(chatPreferencesProvider);
}
