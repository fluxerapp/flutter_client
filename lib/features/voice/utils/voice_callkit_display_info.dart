import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';

class VoiceCallKitDisplayInfo {
  const VoiceCallKitDisplayInfo({
    required this.nameCaller,
    required this.handle,
    required this.isDm,
    this.subtitle,
    this.avatar,
  });

  final String nameCaller;
  final String handle;
  final bool isDm;
  final String? subtitle;
  final String? avatar;

  String get notificationSubtitle => subtitle ?? handle;
}

Channel? _resolveGuildChannel(Ref ref, String channelId) {
  return ref.read(channelByIdProvider(channelId)).value ??
      findChannelById(ref.read(channelListViewModelProvider), channelId);
}

Guild? _resolveGuild(Ref ref, String guildId) {
  return ref.read(guildByIdProvider(guildId)).value ??
      ref
          .read(guildListViewModelProvider)
          .guilds
          .where((Guild guild) => guild.id == guildId)
          .firstOrNull;
}

DmConversation? _resolveDmConversation(Ref ref, String channelId) {
  return findDmById(
    ref.read(
      dmViewModelProvider.select((DmViewState state) => state.conversations),
    ),
    channelId,
  );
}

VoiceCallKitDisplayInfo resolveVoiceCallKitDisplayInfo({
  required Ref ref,
  required String channelId,
  required FluxerLocalizations l10n,
  String? guildId,
  bool forActiveVoice = false,
}) {
  final Channel? guildChannel = _resolveGuildChannel(ref, channelId);
  if (guildChannel != null) {
    final String channelName = guildChannel.name;
    final String title = channelName.isNotEmpty ? channelName : channelId;
    final Guild? guild =
        _resolveGuild(ref, guildChannel.guildId) ??
        (guildId != null && guildId.isNotEmpty
            ? _resolveGuild(ref, guildId)
            : null);
    final String guildName = guild?.name ?? '';
    final String subtitle = guildName.isNotEmpty ? guildName : title;
    return VoiceCallKitDisplayInfo(
      nameCaller: title,
      handle: subtitle,
      subtitle: subtitle,
      isDm: false,
      avatar: guild?.iconUrl,
    );
  }
  final DmConversation? dm = _resolveDmConversation(ref, channelId);
  if (dm != null) {
    if (dm.isGroup) {
      return VoiceCallKitDisplayInfo(
        nameCaller: dm.displayName,
        handle: dm.displayName,
        isDm: true,
      );
    }
    return VoiceCallKitDisplayInfo(
      nameCaller: dm.displayName,
      handle: dm.recipientName,
      isDm: true,
      avatar: FluxerMediaUrl.userAvatar(
        userId: dm.recipientId,
        hash: dm.recipientAvatar,
      ),
    );
  }
  if (guildId != null && guildId.isNotEmpty) {
    final Guild? guild = _resolveGuild(ref, guildId);
    if (guild != null) {
      final String guildName = guild.name;
      final String subtitle = guildName.isNotEmpty ? guildName : channelId;
      return VoiceCallKitDisplayInfo(
        nameCaller: channelId,
        handle: subtitle,
        subtitle: subtitle,
        isDm: false,
        avatar: guild.iconUrl,
      );
    }
  }
  if (forActiveVoice) {
    return VoiceCallKitDisplayInfo(
      nameCaller: channelId,
      handle: channelId,
      isDm: false,
    );
  }
  return VoiceCallKitDisplayInfo(
    nameCaller: l10n.incomingVoiceCallTitle,
    handle: l10n.incomingVoiceCallLabel,
    isDm: false,
  );
}
