import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel_host.dart';
import 'package:fluxer_app/features/chat/providers/core/active_read_channel_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';

void listenChatViewModelErrors(WidgetRef ref) {
  ref.listen<String?>(
    chatViewModelProvider.select((ChatViewState s) => s.errorMessage),
    (String? previous, String? next) {
      if (next == null || next == previous) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: next, variant: FluxerToastVariant.danger));
      ref.read(chatViewModelProvider.notifier).clearErrorMessage();
    },
  );
}

/// Shared message list, composer, and overlay chrome for channel chat surfaces.
class ChannelChatPanel extends ConsumerWidget {
  const ChannelChatPanel({
    this.displayChannelId,
    this.targetMessageId,
    this.loadMessages = true,
    this.showInlineEmojiPicker = true,
    this.onClose,
    super.key,
  });

  final String? displayChannelId;
  final String? targetMessageId;
  final bool loadMessages;
  final bool showInlineEmojiPicker;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = isMobileLayout(context);
    final String? listChannelId = displayChannelId;
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final bool showNeko = ref.watch(
      appearancePreferencesProvider.select((state) => state.showNeko),
    );
    final ActiveReadChannelState activeRead = ref.watch(
      activeReadChannelProvider,
    );
    final String effectiveChannelId =
        listChannelId ??
        ref.watch(
          chatViewModelProvider.select((ChatViewState s) => s.channelId),
        );
    final bool hasMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.messages.isNotEmpty),
    );
    final bool isLoading = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoading),
    );
    final bool hasMoreNewerMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.hasMoreNewerMessages),
    );
    final bool isSyncingMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isSyncingMessages),
    );
    final bool isActiveReadChannel =
        effectiveChannelId.isNotEmpty &&
        activeRead.channelId == effectiveChannelId;
    final bool showJumpToBottom =
        loadMessages &&
        listChannelId != null &&
        shouldShowJumpToBottomButton(
          hasMessages: hasMessages,
          isLoading: isLoading,
          isActiveReadChannel: isActiveReadChannel,
          distanceFromBottom: activeRead.distanceFromBottom,
          viewportHeight: activeRead.viewportHeight,
          hasMoreNewerMessages: hasMoreNewerMessages,
        );
    return ColoredBox(
      color: context.colors.chatBackground,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Listener(
                        behavior: HitTestBehavior.translucent,
                        onPointerDown: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        child: !loadMessages
                            ? const SizedBox.expand()
                            : listChannelId == null
                            ? const SizedBox.expand()
                            : RepaintBoundary(
                                child: MessageList(
                                  key: ValueKey<String>(listChannelId),
                                  expectedChannelId: listChannelId,
                                  targetMessageId: targetMessageId,
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      right: 8,
                      bottom: 0,
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: TypingIndicatorBar(),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              if (onClose != null)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Material(
                                    color: context.colors.backgroundPrimary,
                                    shape: const CircleBorder(),
                                    child: FluxerSheetCloseButton(
                                      onTap: onClose!,
                                    ),
                                  ),
                                ),
                              if (showJumpToBottom)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: FluxerJumpToBottomButton(
                                    enabled: !isSyncingMessages,
                                    onTap: () => ref
                                        .read(chatViewModelProvider.notifier)
                                        .scrollToBottom(),
                                  ),
                                ),
                              if (showNeko) const NekoSprite(),
                              const SlowmodeIndicator(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const RepaintBoundary(child: ChannelTextarea()),
              if (isMobile && isPanelOpen)
                const SizedBox(height: kCollapsedPanelHeight),
            ],
          ),
          InlineExpressionPanelHost(
            showInlineEmojiPicker: showInlineEmojiPicker,
          ),
        ],
      ),
    );
  }
}
