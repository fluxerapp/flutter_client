import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class QuickSwitcherFriendsList extends ConsumerWidget {
  const QuickSwitcherFriendsList({
    required this.searchQuery,
    required this.onFriendSelected,
    required this.scrollController,
    super.key,
  });

  final String searchQuery;
  final VoidCallback onFriendSelected;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final friends = ref
        .watch(dmViewModelProvider)
        .friendsList
        .where((Friend f) => f.friendStatus == FriendStatus.accepted)
        .toList();
    final String query = searchQuery.trim().toLowerCase();
    final List<Friend> filtered = query.isEmpty
        ? friends
        : friends
              .where((Friend friend) => _matchesFriend(friend, query))
              .toList();
    if (friends.isEmpty) {
      return _buildScrollableEmpty(
        context,
        title: l10n.quickSwitcherFriendsEmptyTitle,
        hint: l10n.quickSwitcherFriendsEmptyHint,
      );
    }
    if (filtered.isEmpty) {
      return _buildScrollableEmpty(
        context,
        title: l10n.quickSwitcherFriendsNoMatchTitle,
        hint: l10n.quickSwitcherFriendsNoMatchHint,
      );
    }
    final Map<String, List<Friend>> groups = _groupFriends(filtered);
    final List<String> letters = groups.keys.toList()..sort();
    return ListView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: context.layout.s3,
        right: context.layout.s3,
        bottom: context.layout.s5,
      ),
      children: <Widget>[
        for (final String letter in letters) ...<Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: context.layout.s1 + 2),
            child: Text(
              letter,
              style: TextStyle(
                color: context.colors.textPrimaryMuted,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.64,
              ),
            ),
          ),
          ...groups[letter]!.map(
            (Friend friend) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: _FriendRow(
                friend: friend,
                onTap: () {
                  onFriendSelected();
                  if (!context.mounted) {
                    return;
                  }
                  FluxerUserProfileSheet.show(context, userId: friend.id);
                },
              ),
            ),
          ),
          SizedBox(height: context.layout.s3),
        ],
      ],
    );
  }

  bool _matchesFriend(Friend friend, String query) {
    final List<String> haystacks = <String>[
      friend.displayName,
      friend.username,
      if (friend.nickname != null) friend.nickname!,
    ];
    return haystacks.any(
      (String value) => value.toLowerCase().contains(query),
    );
  }

  Widget _buildScrollableEmpty(
    BuildContext context, {
    required String title,
    required String hint,
  }) {
    return ListView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.layout.s8),
      children: <Widget>[
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: _EmptyState(title: title, hint: hint),
        ),
      ],
    );
  }

  Map<String, List<Friend>> _groupFriends(List<Friend> friends) {
    final Map<String, List<Friend>> groups = <String, List<Friend>>{};
    for (final Friend friend in friends) {
      final String letter = friend.displayName.isNotEmpty
          ? friend.displayName[0].toUpperCase()
          : '#';
      groups.putIfAbsent(letter, () => <Friend>[]).add(friend);
    }
    for (final List<Friend> group in groups.values) {
      group.sort(
        (Friend a, Friend b) => a.displayName.toLowerCase().compareTo(
          b.displayName.toLowerCase(),
        ),
      );
    }
    return groups;
  }
}

class _FriendRow extends StatelessWidget {
  const _FriendRow({
    required this.friend,
    required this.onTap,
  });

  final Friend friend;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String statusLabel = _statusLabel(friend.status);
    return Material(
      color: colors.backgroundSecondaryAlt,
      borderRadius: context.layout.radiusLg,
      child: InkWell(
        onTap: onTap,
        borderRadius: context.layout.radiusLg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: <Widget>[
              FluxerAvatar.user(
                fallbackText: friend.displayName,
                userId: friend.id,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: friend.id,
                  hash: friend.avatar,
                ),
                avatarColor: friend.avatarColor,
                status: friend.status,
                size: 32,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      friend.displayName,
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 18 / 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (statusLabel.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 1),
                      Text(
                        statusLabel,
                        style: TextStyle(
                          color: colors.textPrimaryMuted,
                          fontSize: 13,
                          height: 16 / 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              PhosphorIcon(
                PhosphorIconsRegular.caretRight,
                size: 16,
                color: colors.textPrimaryMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _statusLabel(String status) {
    if (status.isEmpty || status == 'offline') {
      return '';
    }
    return status[0].toUpperCase() + status.substring(1);
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.title, required this.hint});

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.textTertiary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 20 / 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              hint,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.textPrimaryMuted,
                fontSize: 12,
                height: 16 / 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
