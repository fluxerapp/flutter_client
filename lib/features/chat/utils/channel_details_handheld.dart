import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/settings/providers/swipe_right_to_left_action_preferences_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/material_ui.dart';

bool handheldChannelDetailsGesturesApply(BuildContext context) {
  final bool handheldOs =
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
  return handheldOs && !isDesktopLayout(context);
}

bool handheldChannelDetailsUsesDrawer(WidgetRef ref, BuildContext context) {
  if (!handheldChannelDetailsGesturesApply(context)) {
    return false;
  }
  return ref.read(swipeRightToLeftActionPreferencesProvider).effectiveAction ==
      SwipeRightToLeftActionPreference.channelDetails;
}

void prepareHandheldChannelDetailsPresentation({required WidgetRef ref}) {
  if (ref.read(currentRevealSideProvider) == RevealSide.left) {
    DrawerNavigationCoordinator.closeDrawer(ref.container);
  }
}

Future<ChannelDetailsJumpRequest?> openHandheldChannelDetails(
  BuildContext context, {
  required WidgetRef ref,
  required Channel? channel,
  required DmConversation? dm,
  ChannelDetailsInitialTab initialTab = ChannelDetailsInitialTab.members,
  bool openSearchImmediately = false,
}) async {
  if (channel == null && dm == null) {
    return null;
  }
  prepareHandheldChannelDetailsPresentation(ref: ref);
  if (!context.mounted) {
    return null;
  }
  if (handheldChannelDetailsUsesDrawer(ref, context)) {
    return ref
        .read(channelDetailsDrawerProvider.notifier)
        .open(
          channel: channel,
          dm: dm,
          initialTab: initialTab,
          openSearchImmediately: openSearchImmediately,
        );
  }
  return showChannelDetailsSheet(
    context,
    channel: channel,
    dm: dm,
    initialTab: initialTab,
    openSearchImmediately: openSearchImmediately,
  );
}

Future<void> openHandheldChannelDetailsAndJump(
  BuildContext context, {
  required WidgetRef ref,
  required ProviderContainer container,
  required Channel? channel,
  required DmConversation? dm,
  ChannelDetailsInitialTab initialTab = ChannelDetailsInitialTab.members,
  bool openSearchImmediately = false,
}) async {
  final ChannelDetailsJumpRequest? request = await openHandheldChannelDetails(
    context,
    ref: ref,
    channel: channel,
    dm: dm,
    initialTab: initialTab,
    openSearchImmediately: openSearchImmediately,
  );
  if (request == null) {
    return;
  }
  await executeChannelDetailsJumpRequest(
    container: container,
    request: request,
  );
}
