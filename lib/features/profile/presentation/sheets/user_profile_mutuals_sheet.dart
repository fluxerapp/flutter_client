import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_mutual_list.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class UserProfileMutualsSheet {
  UserProfileMutualsSheet._();

  static Future<void> show(
    BuildContext context, {
    required List<UserPartialResponse> friends,
    required List<UserProfileFullResponseMutualGuilds> communities,
    required UserProfileMutualListType initialType,
    required ValueChanged<UserPartialResponse> onFriendTap,
    required ValueChanged<UserProfileFullResponseMutualGuilds> onCommunityTap,
  }) {
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: _titleFor(context, initialType),
      useRootNavigator: true,
      builder: (sheetContext, scrollController, close) => _MutualsSheetBody(
        friends: friends,
        communities: communities,
        initialType: initialType,
        scrollController: scrollController,
        close: close,
        onFriendTap: onFriendTap,
        onCommunityTap: onCommunityTap,
      ),
    );
  }

  static String _titleFor(
    BuildContext context,
    UserProfileMutualListType type,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return switch (type) {
      UserProfileMutualListType.friends => l10n.userProfileMutualFriendsTitle,
      UserProfileMutualListType.communities =>
        l10n.userProfileMutualCommunitiesTitle,
    };
  }
}

class _MutualsSheetBody extends StatelessWidget {
  const _MutualsSheetBody({
    required this.friends,
    required this.communities,
    required this.initialType,
    required this.scrollController,
    required this.close,
    required this.onFriendTap,
    required this.onCommunityTap,
  });

  final List<UserPartialResponse> friends;
  final List<UserProfileFullResponseMutualGuilds> communities;
  final UserProfileMutualListType initialType;
  final ScrollController scrollController;
  final VoidCallback close;
  final ValueChanged<UserPartialResponse> onFriendTap;
  final ValueChanged<UserProfileFullResponseMutualGuilds> onCommunityTap;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return ListView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      ),
      children: <Widget>[
        UserProfileMutualList(
          type: initialType,
          friends: friends,
          communities: communities,
          onFriendTap: (UserPartialResponse friend) {
            close();
            onFriendTap(friend);
          },
          onCommunityTap: (UserProfileFullResponseMutualGuilds community) {
            close();
            onCommunityTap(community);
          },
        ),
      ],
    );
  }
}
