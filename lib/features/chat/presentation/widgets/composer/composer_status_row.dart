import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/settings/providers/blocked_users_view_model.dart';
import 'package:material_ui/material_ui.dart';

const double _kComposerStatusRowCollapsedHeight = 10;

bool composerTypingIndicatorVisible(WidgetRef ref, String channelId) {
  if (channelId.isEmpty) {
    return false;
  }
  final List<String> userIds = ref.watch(
    typingUsersInChannelProvider(channelId),
  );
  if (userIds.isEmpty) {
    return false;
  }
  final blocked = ref.watch(blockedUsersViewModelProvider).value;
  if (blocked == null) {
    return true;
  }
  final Set<String> blockedIds = {for (final f in blocked) f.id};
  for (final String id in userIds) {
    if (!blockedIds.contains(id)) {
      return true;
    }
  }
  return false;
}

bool composerSlowmodeIndicatorVisible(WidgetRef ref, String channelId) {
  if (channelId.isEmpty) {
    return false;
  }
  final int rateLimit = ref.watch(
    channelByIdProvider(
      channelId,
    ).select((channel) => channel.value?.rateLimitPerUser ?? 0),
  );
  return rateLimit > 0;
}

/// Mobile composer row for typing and slowmode indicators.
class ComposerStatusRow extends ConsumerWidget {
  const ComposerStatusRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String channelId = ref.watch(
      chatViewModelProvider.select((ChatViewState state) => state.channelId),
    );
    final bool showTyping = composerTypingIndicatorVisible(ref, channelId);
    final bool showSlowmode = composerSlowmodeIndicatorVisible(ref, channelId);
    final bool isVisible = showTyping || showSlowmode;
    return ClipRect(
      child: AnimatedSize(
        duration: context.motion.panel,
        curve: Curves.easeOutCubic,
        alignment: Alignment.bottomCenter,
        child: isVisible
            ? Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 6),
                child: Row(
                  spacing: 8,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: showTyping
                            ? const TypingIndicatorBar(compact: true)
                            : const SizedBox.shrink(),
                      ),
                    ),
                    if (showSlowmode) const SlowmodeIndicator(compact: true),
                  ],
                ),
              )
            : const SizedBox(
                width: double.infinity,
                height: _kComposerStatusRowCollapsedHeight,
              ),
      ),
    );
  }
}
