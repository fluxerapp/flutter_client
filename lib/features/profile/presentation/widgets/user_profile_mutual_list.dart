import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/profile/providers/user_profile_guild_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum UserProfileMutualListType { friends, communities }

class UserProfileMutualList extends ConsumerWidget {
  const UserProfileMutualList({
    required this.type,
    required this.friends,
    required this.communities,
    required this.onFriendTap,
    required this.onCommunityTap,
    super.key,
  });

  final UserProfileMutualListType type;
  final List<UserPartialResponse> friends;
  final List<MutualGuildResponse> communities;
  final ValueChanged<UserPartialResponse> onFriendTap;
  final ValueChanged<MutualGuildResponse> onCommunityTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (type) {
      UserProfileMutualListType.friends => _MutualFriendList(
        friends: friends,
        onFriendTap: onFriendTap,
      ),
      UserProfileMutualListType.communities => _MutualCommunityList(
        communities: communities,
        onCommunityTap: onCommunityTap,
      ),
    };
  }
}

class _MutualFriendList extends StatelessWidget {
  const _MutualFriendList({required this.friends, required this.onFriendTap});

  final List<UserPartialResponse> friends;
  final ValueChanged<UserPartialResponse> onFriendTap;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (friends.isEmpty) {
      return _MutualEmptyState(
        icon: PhosphorIconsFill.usersThree,
        label: l10n.userProfileNoMutualFriends,
      );
    }
    return FluxerListSection(
      dividers: false,
      children: friends
          .map((UserPartialResponse friend) {
            return FluxerListRow(
              leading: FluxerAvatar.user(
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: friend.id,
                  hash: friend.avatar,
                ),
                fallbackText: friend.globalName ?? friend.username,
                avatarColor: friend.avatarColor,
                userId: friend.id,
                showStatus: false,
              ),
              title: friend.globalName ?? friend.username,
              subtitle: '${friend.username}#${friend.discriminator}',
              onTap: () => onFriendTap(friend),
            );
          })
          .toList(growable: false),
    );
  }
}

class _MutualCommunityList extends ConsumerWidget {
  const _MutualCommunityList({
    required this.communities,
    required this.onCommunityTap,
  });

  final List<MutualGuildResponse> communities;
  final ValueChanged<MutualGuildResponse> onCommunityTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (communities.isEmpty) {
      return _MutualEmptyState(
        icon: PhosphorIconsFill.usersThree,
        label: l10n.userProfileNoMutualCommunities,
      );
    }
    final List<String> guildIds = communities
        .map((MutualGuildResponse community) => community.id)
        .toList(growable: false);
    final String guildIdsKey = guildIds.join(',');
    final Map<String, db.Server> serversById =
        ref.watch(userProfileMutualGuildInfoProvider(guildIdsKey)).value ??
        const <String, db.Server>{};
    return FluxerListSection(
      dividers: false,
      children: communities
          .map((MutualGuildResponse community) {
            final db.Server? server = serversById[community.id];
            final String title = server?.name ?? community.nick ?? community.id;
            final String? nick = community.nick?.trim();
            return FluxerListRow(
              leading: FluxerGuildIconAvatar(
                name: title,
                imageUrl: server == null ? null : Guild.fromRow(server).iconUrl,
                size: 40,
              ),
              title: title,
              subtitle: nick == null || nick.isEmpty
                  ? null
                  : l10n.userProfileMutualCommunityNickname(nick),
              onTap: () => onCommunityTap(community),
            );
          })
          .toList(growable: false),
    );
  }
}

class _MutualEmptyState extends StatelessWidget {
  const _MutualEmptyState({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s8, horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PhosphorIcon(icon, size: 40, color: colors.textPrimaryMuted),
          SizedBox(height: layout.s2),
          Text(
            label,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
