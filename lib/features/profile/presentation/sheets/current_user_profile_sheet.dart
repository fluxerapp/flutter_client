import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

class CurrentUserProfileSheet {
  CurrentUserProfileSheet._();

  static Future<void> show(BuildContext context, WidgetRef ref) {
    final String userId = ref.read(userSettingsViewModelProvider).userId;
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      minChildSize: 0.55,
      builder:
          (
            BuildContext _,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return UserProfileView(
              userId: userId,
              autoFocusNote: false,
              scrollController: scrollController,
              useCurrentUserCache: true,
            );
          },
    );
  }
}
