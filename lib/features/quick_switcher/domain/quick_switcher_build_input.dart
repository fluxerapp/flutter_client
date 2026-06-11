import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class QuickSwitcherBuildInput {
  const QuickSwitcherBuildInput({
    required this.l10n,
    required this.currentUserId,
    required this.conversations,
    required this.friends,
    required this.guildChannels,
    required this.guilds,
    required this.guildMembers,
    required this.hasFavorites,
  });

  final FluxerLocalizations l10n;
  final String? currentUserId;
  final List<DmConversation> conversations;
  final List<Friend> friends;
  final List<Channel> guildChannels;
  final List<Guild> guilds;
  final List<Member> guildMembers;
  final bool hasFavorites;
}
