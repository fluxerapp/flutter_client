import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_candidate_builder.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_result_converters.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

/// Resolves default quick switcher rows from a channel id
class QuickSwitcherChannelResolver {
  const QuickSwitcherChannelResolver({
    required this.l10n,
    required this.guildChannelsById,
    required this.conversationsById,
    required this.guildsById,
  });

  final FluxerLocalizations l10n;
  final Map<String, Channel> guildChannelsById;
  final Map<String, DmConversation> conversationsById;
  final Map<String, Guild> guildsById;

  QuickSwitcherResult? resultForChannelId(
    String channelId, {
    String? viewContext,
  }) {
    final Channel? guildChannel = guildChannelsById[channelId];
    if (guildChannel != null) {
      return _resultFromGuildChannel(guildChannel, viewContext);
    }
    final DmConversation? conversation = conversationsById[channelId];
    if (conversation == null || conversation.isPersonalNotes) {
      return null;
    }
    if (conversation.isGroup) {
      return candidateToQuickSwitcherResult(
        quickSwitcherGroupDmCandidate(conversation, l10n: l10n),
        l10n,
        viewContext: viewContext,
      );
    }
    return candidateToQuickSwitcherResult(
      QuickSwitcherUserCandidate(
        id: conversation.recipientId,
        title: conversation.displayName,
        subtitle: conversation.recipientUsername ?? conversation.recipientName,
        userId: conversation.recipientId,
        dmChannelId: conversation.id,
        avatar: conversation.recipientAvatar,
        status: conversation.recipientStatus,
        searchValues: <String>[
          conversation.displayName,
          conversation.recipientName,
          if (conversation.recipientUsername != null)
            conversation.recipientUsername!,
          conversation.id,
        ],
        sortWeight: conversation.lastMessageTime.millisecondsSinceEpoch,
      ),
      l10n,
      viewContext: viewContext,
    );
  }

  QuickSwitcherResult? _resultFromGuildChannel(
    Channel channel,
    String? viewContext,
  ) {
    if (channel.type != ChannelType.guildText &&
        channel.type != ChannelType.guildVoice) {
      return null;
    }
    final Guild? guild = guildsById[channel.guildId];
    final String guildName = guild?.name ?? '';
    final bool isVoice = channel.type == ChannelType.guildVoice;
    return candidateToQuickSwitcherResult(
      QuickSwitcherChannelCandidate(
        id: channel.id,
        title: channel.name,
        subtitle: guildName,
        channelId: channel.id,
        guildId: channel.guildId,
        guildName: guildName,
        guildIcon: guild?.icon,
        isVoice: isVoice,
        searchValues: <String>[channel.name, guildName, channel.id],
        sortWeight: dateTimeFromSnowflakeAsLocalOrNow(
          channel.id,
        ).millisecondsSinceEpoch,
      ),
      l10n,
      viewContext: viewContext,
    );
  }
}
