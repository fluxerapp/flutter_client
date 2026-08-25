import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceChatUnreadBadge extends ConsumerWidget {
  const VoiceChatUnreadBadge({required this.channelId, super.key});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UnreadState> unreadAsync = ref.watch(
      channelUnreadProvider(channelId),
    );
    final UnreadState? unread = unreadAsync.value;
    if (unread == null || !unread.hasUnread) {
      return const SizedBox.shrink();
    }
    final int badgeCount = unread.mentionCount > 0 ? unread.mentionCount : 1;
    final String label = badgeCount > 9 ? '9+' : '$badgeCount';
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          color: context.colors.statusDanger,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textOnBrandPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            height: 1,
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
