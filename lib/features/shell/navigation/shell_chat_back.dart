import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/providers/thread_entered_from_parent_provider.dart';
import 'package:fluxer_app/features/voice/utils/pip/phone_call_layout.dart';
import 'package:fluxer_app/material_ui.dart';

bool shellShowsConcurrentChannelList(BuildContext context) {
  if (!isMobileLayout(context)) {
    return true;
  }
  if (!isPinnedSidebarLayout(context)) {
    return false;
  }
  return !isPinnedSidebarSplitAtHinge(context);
}

Color shellChannelHeaderBackgroundColor(BuildContext context) {
  if (shellShowsConcurrentChannelList(context)) {
    return context.colors.backgroundPrimary;
  }
  return context.colors.chatInputBackground;
}

bool shouldAutoSelectDmChannel(BuildContext context) {
  if (isMobileLayout(context) && !isPinnedSidebarLayout(context)) {
    return false;
  }
  return shellShowsConcurrentChannelList(context);
}

bool showsShellChatBackButton(BuildContext context, {required bool isThread}) {
  if (isThread) {
    return true;
  }
  return !shellShowsConcurrentChannelList(context);
}

bool showsInAppShellChatBackButton(
  BuildContext context, {
  required bool isThread,
}) {
  if (!showsInAppShellBackButton(context)) {
    return false;
  }
  return showsShellChatBackButton(context, isThread: isThread);
}

bool showsChannelHeaderBackButton(
  BuildContext context,
  WidgetRef ref, {
  required bool isThread,
}) {
  return showsInAppShellChatBackButton(context, isThread: isThread) ||
      shouldMinimizePhoneVoiceCall(context, ref);
}

bool showsHostedUiChatBackButton(
  BuildContext context, {
  required bool isThread,
}) {
  if (!usesIphoneDuoHostedUi(context)) {
    return false;
  }
  return showsShellChatBackButton(context, isThread: isThread);
}

bool isThreadChatForShell(WidgetRef ref) {
  final String location = ref.read(shellLocationProvider);
  if (classifyRoute(location) != RouteKind.chat) {
    return false;
  }
  final String? channelId = extractChannelId(location);
  if (channelId == null) {
    return false;
  }
  return ref.read(channelByIdProvider(channelId)).value?.isThread ?? false;
}

bool _isThreadEnteredFromParent(WidgetRef ref) {
  final String? threadId = ref.read(threadEnteredFromParentProvider);
  return threadId != null &&
      threadId == extractChannelId(ref.read(shellLocationProvider));
}

ShellChatBackContext shellChatBackContext(BuildContext context, WidgetRef ref) {
  final bool showsConcurrentChannelList = shellShowsConcurrentChannelList(
    context,
  );
  final bool leavesThreadToParent =
      showsConcurrentChannelList || _isThreadEnteredFromParent(ref);
  return ShellChatBackContext(
    isThread: leavesThreadToParent && isThreadChatForShell(ref),
    showsConcurrentChannelList: showsConcurrentChannelList,
  );
}

class ShellChatBackContext {
  const ShellChatBackContext({
    required this.isThread,
    required this.showsConcurrentChannelList,
  });

  final bool isThread;
  final bool showsConcurrentChannelList;
}
