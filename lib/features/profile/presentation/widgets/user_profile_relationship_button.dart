import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileRelationshipButton extends StatelessWidget {
  const UserProfileRelationshipButton({
    required this.relationshipStatus,
    required this.isCurrentUser,
    required this.onUnblock,
    required this.onRemoveFriend,
    required this.onAcceptRequest,
    required this.onCancelRequest,
    required this.onSendFriendRequest,
    this.allowFriendRequests = true,
    super.key,
  });

  final FriendStatus? relationshipStatus;
  final bool isCurrentUser;
  final VoidCallback onUnblock;
  final VoidCallback onRemoveFriend;
  final VoidCallback onAcceptRequest;
  final VoidCallback onCancelRequest;
  final VoidCallback onSendFriendRequest;
  final bool allowFriendRequests;

  ({PhosphorIconData icon, VoidCallback onTap, String semanticLabel})? _resolve(
    FluxerLocalizations l10n,
  ) {
    if (isCurrentUser) {
      return null;
    }
    final status = relationshipStatus;
    return switch (status) {
      FriendStatus.accepted => (
        icon: PhosphorIconsFill.userMinus,
        onTap: onRemoveFriend,
        semanticLabel: l10n.profileRemoveFriend,
      ),
      FriendStatus.blocked => (
        icon: PhosphorIconsFill.prohibit,
        onTap: onUnblock,
        semanticLabel: l10n.profileUnblockUser,
      ),
      FriendStatus.pendingIncoming =>
        allowFriendRequests
            ? (
                icon: PhosphorIconsFill.checkCircle,
                onTap: onAcceptRequest,
                semanticLabel: l10n.profileAcceptFriendRequest,
              )
            : null,
      FriendStatus.pendingOutgoing =>
        allowFriendRequests
            ? (
                icon: PhosphorIconsFill.clockCounterClockwise,
                onTap: onCancelRequest,
                semanticLabel: l10n.profileCancelFriendRequest,
              )
            : null,
      null =>
        allowFriendRequests
            ? (
                icon: PhosphorIconsFill.userPlus,
                onTap: onSendFriendRequest,
                semanticLabel: l10n.profileSendFriendRequest,
              )
            : null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final action = _resolve(FluxerLocalizations.of(context));
    if (action == null) {
      return const SizedBox.shrink();
    }

    return FluxerButton.circleAlt(
      icon: action.icon,
      onPressed: action.onTap,
      semanticLabel: action.semanticLabel,
    );
  }
}
