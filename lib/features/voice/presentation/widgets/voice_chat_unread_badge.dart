import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceChatUnreadBadge extends ConsumerWidget {
  const VoiceChatUnreadBadge({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UnreadState? unread = ref.watch(
      channelUnreadOrLastKnownProvider(channelId),
    );
    if (unread == null || !unread.hasUnread) {
      return const SizedBox.shrink();
    }
    return Positioned(
      top: 0,
      right: 0,
      child: ExcludeSemantics(
        child: FluxerBadgeEntrance(
          child: FluxerBadge.count(
            count: unread.mentionCount > 0 ? unread.mentionCount : 1,
          ),
        ),
      ),
    );
  }
}

String voiceChatAccessibilityLabel({
  required FluxerLocalizations l10n,
  required UnreadState? unread,
}) {
  if (unread == null || !unread.hasUnread) {
    return l10n.voiceTextChatShow;
  }
  final int count = unread.mentionCount > 0
      ? unread.mentionCount
      : (unread.hasUnreadMessages ? 1 : 0);
  if (count <= 0) {
    return l10n.voiceTextChatShow;
  }
  return l10n.voiceTextChatShowUnread(count);
}
