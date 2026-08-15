import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_mutuals_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_mutual_list.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileMutualsSection extends StatelessWidget {
  const UserProfileMutualsSection({
    required this.friends,
    required this.communities,
    required this.onFriendTap,
    required this.onCommunityTap,
    super.key,
  });

  final List<UserPartialResponse> friends;
  final List<UserProfileFullResponseMutualGuilds> communities;
  final ValueChanged<UserPartialResponse> onFriendTap;
  final ValueChanged<UserProfileFullResponseMutualGuilds> onCommunityTap;

  void _showSheet(BuildContext context, UserProfileMutualListType type) {
    unawaited(
      UserProfileMutualsSheet.show(
        context,
        friends: friends,
        communities: communities,
        initialType: type,
        onFriendTap: onFriendTap,
        onCommunityTap: onCommunityTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerListSection(
      backgroundColor: context.colors.backgroundSecondary,
      children: <Widget>[
        FluxerListRow(
          leading: const FluxerAvatar.icon(icon: PhosphorIconsFill.users),
          title: l10n.userProfileMutualFriends(friends.length),
          trailing: const PhosphorIcon(PhosphorIconsBold.caretRight, size: 18),
          onTap: () => _showSheet(context, UserProfileMutualListType.friends),
        ),
        FluxerListRow(
          leading: const FluxerAvatar.icon(icon: PhosphorIconsFill.usersThree),
          title: l10n.userProfileMutualCommunities(communities.length),
          trailing: const PhosphorIcon(PhosphorIconsBold.caretRight, size: 18),
          onTap: () =>
              _showSheet(context, UserProfileMutualListType.communities),
        ),
      ],
    );
  }
}
