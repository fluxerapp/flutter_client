import 'package:flutter/material.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FriendSelector extends StatelessWidget {
  const FriendSelector({
    required this.friends,
    required this.selectedUserIds,
    required this.onToggle,
    required this.searchQuery,
    required this.l10n,
    this.scrollController,
    this.maxSelections,
    this.excludeUserIds = const <String>[],
    this.stickyUserIds = const <String>[],
    this.showSelectedPills = true,
    super.key,
  });

  final List<Friend> friends;
  final List<String> selectedUserIds;
  final ValueChanged<String> onToggle;
  final String searchQuery;
  final FluxerLocalizations l10n;
  final ScrollController? scrollController;
  final int? maxSelections;
  final List<String> excludeUserIds;
  final List<String> stickyUserIds;
  final bool showSelectedPills;

  @override
  Widget build(BuildContext context) {
    final List<Friend> accepted =
        friends
            .where(
              (Friend friend) =>
                  friend.friendStatus == FriendStatus.accepted &&
                  !excludeUserIds.contains(friend.id),
            )
            .toList()
          ..sort(
            (Friend a, Friend b) => a.displayName.toLowerCase().compareTo(
              b.displayName.toLowerCase(),
            ),
          );
    final String query = searchQuery.trim().toLowerCase();
    bool matchesQuery(Friend friend) {
      if (query.isEmpty) {
        return true;
      }
      return friend.displayName.toLowerCase().contains(query) ||
          friend.username.toLowerCase().contains(query) ||
          (friend.nickname?.toLowerCase().contains(query) ?? false);
    }

    final Set<String> stickySet = stickyUserIds
        .where(selectedUserIds.contains)
        .toSet();
    final List<Friend> stickyFriends = accepted
        .where((Friend friend) => stickySet.contains(friend.id))
        .toList();
    final List<Friend> filtered = accepted.where(matchesQuery).toList();
    final Map<String, List<Friend>> groups = <String, List<Friend>>{};
    for (final Friend friend in filtered) {
      if (stickySet.contains(friend.id)) {
        continue;
      }
      final String letter = _groupLetter(friend.displayName);
      groups.putIfAbsent(letter, () => <Friend>[]).add(friend);
    }
    final List<String> letters = groups.keys.toList()..sort();
    final List<Widget> children = <Widget>[];
    if (showSelectedPills && selectedUserIds.isNotEmpty) {
      children.add(
        _SelectedFriendPills(
          friends: accepted,
          selectedUserIds: selectedUserIds,
          onToggle: onToggle,
          l10n: l10n,
        ),
      );
    }
    if (accepted.isEmpty) {
      children.add(_FriendSelectorEmpty(title: l10n.createDmNoFriendsYet));
    } else if (filtered.isEmpty && stickyFriends.isEmpty) {
      children.add(_FriendSelectorEmpty(title: l10n.createDmNoFriendsFound));
    } else {
      if (stickyFriends.isNotEmpty) {
        children.addAll(
          stickyFriends.map(
            (Friend friend) => _FriendSelectorRow(
              friend: friend,
              isSelected: selectedUserIds.contains(friend.id),
              isAtMax: _isAtMax(friend.id),
              onToggle: () => onToggle(friend.id),
            ),
          ),
        );
      }
      for (final String letter in letters) {
        children.add(
          Padding(
            padding: EdgeInsets.only(
              top: context.layout.s2,
              bottom: context.layout.s1,
            ),
            child: Text(
              letter,
              style: context.textStyles.smallText.copyWith(letterSpacing: 0.64),
            ),
          ),
        );
        for (final Friend friend in groups[letter]!) {
          children.add(
            _FriendSelectorRow(
              friend: friend,
              isSelected: selectedUserIds.contains(friend.id),
              isAtMax: _isAtMax(friend.id),
              onToggle: () => onToggle(friend.id),
            ),
          );
        }
      }
    }
    return ListView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
      ),
      children: children,
    );
  }

  bool _isAtMax(String userId) {
    return maxSelections != null &&
        selectedUserIds.length >= maxSelections! &&
        !selectedUserIds.contains(userId);
  }

  String _groupLetter(String displayName) {
    final String trimmed = displayName.trim();
    if (trimmed.isEmpty) {
      return '#';
    }
    return trimmed[0].toUpperCase();
  }
}

class _SelectedFriendPills extends StatelessWidget {
  const _SelectedFriendPills({
    required this.friends,
    required this.selectedUserIds,
    required this.onToggle,
    required this.l10n,
  });

  final List<Friend> friends;
  final List<String> selectedUserIds;
  final ValueChanged<String> onToggle;
  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final Map<String, Friend> friendById = <String, Friend>{
      for (final Friend friend in friends) friend.id: friend,
    };
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s2),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: selectedUserIds.map((String userId) {
          final Friend? friend = friendById[userId];
          final String label = friend?.displayName ?? userId;
          return InputChip(
            label: Text(label),
            deleteIcon: const PhosphorIcon(PhosphorIconsBold.x, size: 14),
            onDeleted: () => onToggle(userId),
            deleteButtonTooltipMessage: l10n.createDmRemoveFriend(label),
          );
        }).toList(),
      ),
    );
  }
}

class _FriendSelectorRow extends StatelessWidget {
  const _FriendSelectorRow({
    required this.friend,
    required this.isSelected,
    required this.isAtMax,
    required this.onToggle,
  });

  final Friend friend;
  final bool isSelected;
  final bool isAtMax;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isAtMax ? null : onToggle,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: <Widget>[
              FluxerAvatar.userPresence(
                fallbackText: friend.displayName,
                userId: friend.id,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: friend.id,
                  hash: friend.avatar,
                ),
                avatarColor: friend.avatarColor,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  friend.displayName,
                  style: context.textStyles.username.copyWith(
                    color: colors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FluxerCheckbox(
                value: isSelected,
                onChanged: isAtMax && !isSelected ? (_) {} : (_) => onToggle(),
                enabled: !isAtMax || isSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FriendSelectorEmpty extends StatelessWidget {
  const _FriendSelectorEmpty({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.layout.s8),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.textStyles.label.copyWith(
            color: context.colors.textTertiary,
          ),
        ),
      ),
    );
  }
}
