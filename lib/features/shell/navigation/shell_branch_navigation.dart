import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/notifications/presentation/notifications_inbox_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/current_user_profile_sheet.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

void handleMobileShellBranchSelection({
  required BuildContext context,
  required WidgetRef ref,
  required StatefulNavigationShell navigationShell,
  required int index,
}) {
  popTopShellPopupRoute();
  if (index == shellHomeBranchIndex) {
    if (navigationShell.currentIndex != shellHomeBranchIndex) {
      navigationShell.goBranch(shellHomeBranchIndex);
    }
    unawaited(_openSplitDmChannelIfNeeded(context, ref));
    return;
  }
  if (shellShowsConcurrentChannelList(context)) {
    if (index == shellNotificationsBranchIndex) {
      unawaited(NotificationsInboxSheet.show(context));
      return;
    }
    if (index == shellYouBranchIndex) {
      unawaited(CurrentUserProfileSheet.show(context, ref));
      return;
    }
  }
  navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );
}

Future<void> _openSplitDmChannelIfNeeded(
  BuildContext context,
  WidgetRef ref,
) async {
  if (!shouldAutoSelectDmChannel(context)) {
    return;
  }
  final GoRouter router = GoRouter.of(context);
  if (router.state.uri.path != RoutePaths.me) {
    return;
  }
  final String? target = await resolveDmRootRedirect(
    fullPath: RoutePaths.me,
    db: ref.read(fluxerDatabaseProvider),
  );
  if (target != null && context.mounted) {
    router.go(target);
  }
}
