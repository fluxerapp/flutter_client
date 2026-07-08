import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_menu_data.dart';
import 'package:fluxer_app/features/channels/utils/channel_invite_capability.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  final FluxerLocalizationsEn l10n = FluxerLocalizationsEn();

  const Guild guild = Guild(id: 'guild-1', name: 'Guild');
  final Channel textChannel = Channel(
    id: 'text-1',
    guildId: guild.id,
    name: 'general',
  );
  final Channel voiceChannel = Channel(
    id: 'voice-1',
    guildId: guild.id,
    name: 'voice',
    type: ChannelType.guildVoice,
  );
  final Channel linkChannel = Channel(
    id: 'link-1',
    guildId: guild.id,
    name: 'links',
    type: ChannelType.guildLink,
    url: 'https://example.com',
  );

  group('resolveChannelInviteCapability', () {
    test('allows invite with createInstantInvite permission', () {
      final ChannelInviteCapability capability = resolveChannelInviteCapability(
        permissionBits: Permission.createInstantInvite.value,
        channel: textChannel,
        guildId: guild.id,
      );
      expect(capability.canInvite, isTrue);
      expect(capability.useVanityUrl, isFalse);
    });

    test(
      'allows invite with vanity URL when channel is visible to everyone',
      () {
        final ChannelInviteCapability capability =
            resolveChannelInviteCapability(
              permissionBits: Permission.viewChannel.value,
              channel: textChannel,
              guildId: guild.id,
              vanityUrlCode: 'fluxer',
            );
        expect(capability.canInvite, isTrue);
        expect(capability.useVanityUrl, isTrue);
        expect(capability.vanityUrlCode, 'fluxer');
      },
    );

    test('denies invite without permission or vanity URL', () {
      final ChannelInviteCapability capability = resolveChannelInviteCapability(
        permissionBits: Permission.viewChannel.value,
        channel: textChannel,
        guildId: guild.id,
      );
      expect(capability.canInvite, isFalse);
    });
  });

  group('resolveChannelMenuState', () {
    test('hides mark as read when channel is already read', () {
      final ChannelMenuState state = resolveChannelMenuState(
        channel: textChannel,
        guild: guild,
        parentCategory: null,
        permissionBits: Permission.viewChannel.value,
        hasUnread: false,
        showFavorites: false,
        isFavorite: false,
        isMuted: false,
        developerMode: false,
        nsfwAllowed: true,
        hasAgreedToMatureContent: false,
        voiceChannelJoinRequiresDoubleClick: false,
      );
      expect(state.showMarkAsRead, isFalse);
    });

    test(
      'allows edit with updateRtcRegion on voice without manageChannels',
      () {
        final ChannelMenuState state = resolveChannelMenuState(
          channel: voiceChannel,
          guild: guild,
          parentCategory: null,
          permissionBits: Permission.updateRtcRegion.value,
          hasUnread: false,
          showFavorites: false,
          isFavorite: false,
          isMuted: false,
          developerMode: false,
          nsfwAllowed: true,
          hasAgreedToMatureContent: false,
          voiceChannelJoinRequiresDoubleClick: false,
        );
        expect(state.showEditChannel, isTrue);
        expect(state.showDuplicateChannel, isFalse);
        expect(state.showOpenChat, isTrue);
      },
    );

    test('blocks edit and duplicate for minors on NSFW channels', () {
      final Channel nsfwChannel = Channel(
        id: 'nsfw-1',
        guildId: guild.id,
        name: 'nsfw',
        nsfwOverride: true,
      );
      final ChannelMenuState state = resolveChannelMenuState(
        channel: nsfwChannel,
        guild: guild,
        parentCategory: null,
        permissionBits: Permission.manageChannels.value,
        hasUnread: false,
        showFavorites: false,
        isFavorite: false,
        isMuted: false,
        developerMode: false,
        nsfwAllowed: false,
        hasAgreedToMatureContent: false,
        voiceChannelJoinRequiresDoubleClick: false,
      );
      expect(state.showEditChannel, isFalse);
      expect(state.showDuplicateChannel, isFalse);
      expect(state.showDeleteChannel, isTrue);
    });

    test('hides open chat when voice join requires double click', () {
      final ChannelMenuState state = resolveChannelMenuState(
        channel: voiceChannel,
        guild: guild,
        parentCategory: null,
        permissionBits: Permission.viewChannel.value,
        hasUnread: false,
        showFavorites: false,
        isFavorite: false,
        isMuted: false,
        developerMode: false,
        nsfwAllowed: true,
        hasAgreedToMatureContent: false,
        voiceChannelJoinRequiresDoubleClick: true,
      );
      expect(state.showOpenChat, isFalse);
    });
  });

  group('buildChannelMenuGroups', () {
    ChannelMenuState fullTextState({
      bool hasUnread = true,
      int? permissionBits,
    }) {
      return resolveChannelMenuState(
        channel: textChannel,
        guild: guild,
        parentCategory: null,
        permissionBits:
            permissionBits ??
            (Permission.manageChannels.value |
                Permission.createInstantInvite.value),
        hasUnread: hasUnread,
        showFavorites: true,
        isFavorite: false,
        isMuted: false,
        developerMode: true,
        nsfwAllowed: true,
        hasAgreedToMatureContent: true,
        voiceChannelJoinRequiresDoubleClick: false,
      );
    }

    test('omits mark as read when channel has no unread', () {
      final List<ChannelMenuGroup> groups = buildChannelMenuGroups(
        l10n: l10n,
        state: fullTextState(hasUnread: false),
      );
      final List<ChannelMenuAction> actions = flattenChannelMenuActions(groups);
      expect(actions, isNot(contains(ChannelMenuAction.markAsRead)));
    });

    test('includes notification settings for link channels without mute', () {
      final ChannelMenuState state = resolveChannelMenuState(
        channel: linkChannel,
        guild: guild,
        parentCategory: null,
        permissionBits: Permission.viewChannel.value,
        hasUnread: false,
        showFavorites: false,
        isFavorite: false,
        isMuted: false,
        developerMode: false,
        nsfwAllowed: true,
        hasAgreedToMatureContent: false,
        voiceChannelJoinRequiresDoubleClick: false,
      );
      final List<ChannelMenuGroup> groups = buildChannelMenuGroups(
        l10n: l10n,
        state: state,
      );
      final List<ChannelMenuAction> actions = flattenChannelMenuActions(groups);
      expect(actions, contains(ChannelMenuAction.notificationSettings));
      expect(actions, isNot(contains(ChannelMenuAction.mute)));
      expect(actions, contains(ChannelMenuAction.openLink));
    });

    test('orders destructive actions last and marks them danger', () {
      final List<ChannelMenuGroup> groups = buildChannelMenuGroups(
        l10n: l10n,
        state: fullTextState(),
      );
      final List<ChannelMenuAction> actions = flattenChannelMenuActions(groups);
      expect(actions.last, ChannelMenuAction.deleteMyMessages);
      expect(
        channelMenuEntryIsDanger(groups, ChannelMenuAction.deleteChannel),
        isTrue,
      );
      expect(
        channelMenuEntryIsDanger(groups, ChannelMenuAction.deleteMyMessages),
        isTrue,
      );
    });

    test('shows reset mature content only when previously agreed', () {
      final ChannelMenuState withoutAgreement = resolveChannelMenuState(
        channel: textChannel,
        guild: guild,
        parentCategory: null,
        permissionBits: Permission.viewChannel.value,
        hasUnread: false,
        showFavorites: false,
        isFavorite: false,
        isMuted: false,
        developerMode: true,
        nsfwAllowed: true,
        hasAgreedToMatureContent: false,
        voiceChannelJoinRequiresDoubleClick: false,
      );
      final List<ChannelMenuGroup> withoutGroups = buildChannelMenuGroups(
        l10n: l10n,
        state: withoutAgreement,
      );
      expect(
        flattenChannelMenuActions(withoutGroups),
        isNot(contains(ChannelMenuAction.resetMatureContentAgree)),
      );
      final ChannelMenuState withAgreement = resolveChannelMenuState(
        channel: textChannel,
        guild: guild,
        parentCategory: null,
        permissionBits: Permission.viewChannel.value,
        hasUnread: false,
        showFavorites: false,
        isFavorite: false,
        isMuted: false,
        developerMode: true,
        nsfwAllowed: true,
        hasAgreedToMatureContent: true,
        voiceChannelJoinRequiresDoubleClick: false,
      );
      final List<ChannelMenuGroup> withGroups = buildChannelMenuGroups(
        l10n: l10n,
        state: withAgreement,
      );
      expect(
        flattenChannelMenuActions(withGroups),
        contains(ChannelMenuAction.resetMatureContentAgree),
      );
    });
  });
}
