import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel_host.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
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

/// Shared message list, composer, and overlays for channel chat surfaces.
class ChannelChatPanel extends ConsumerStatefulWidget {
  const ChannelChatPanel({
    required this.displayChannelId,
    this.targetMessageId,
    this.loadMessages = true,
    this.showInlineEmojiPicker = true,
    this.onClose,
    super.key,
  });

  final String displayChannelId;
  final String? targetMessageId;
  final bool loadMessages;
  final bool showInlineEmojiPicker;
  final VoidCallback? onClose;

  @override
  ConsumerState<ChannelChatPanel> createState() => _ChannelChatPanelState();
}

class _ChannelChatPanelState extends ConsumerState<ChannelChatPanel> {
  final ComposerAutocompletePanelHost _composerAutocompletePanelHost =
      ComposerAutocompletePanelHost(null);
  final ScrollController _composerAutocompletePanelScroll = ScrollController();

  @override
  void dispose() {
    _composerAutocompletePanelScroll.dispose();
    _composerAutocompletePanelHost.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    final String listChannelId = widget.displayChannelId;
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final bool showNeko = ref.watch(
      appearancePreferencesProvider.select((state) => state.showNeko),
    );
    final ChatReadViewportState readViewport = ref.watch(
      chatReadViewportProvider,
    );
    final String effectiveChannelId = listChannelId;
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
        readViewport.channelId == effectiveChannelId;
    final bool showJumpToBottom =
        widget.loadMessages &&
        shouldShowJumpToBottomButton(
          hasMessages: hasMessages,
          isLoading: isLoading,
          isActiveReadChannel: isActiveReadChannel,
          distanceFromBottom: readViewport.distanceFromBottom,
          viewportHeight: readViewport.viewportHeight,
          hasMoreNewerMessages: hasMoreNewerMessages,
        );
    final VoidCallback? onClose = widget.onClose;
    return ColoredBox(
      color: context.colors.chatBackground,
      child: Stack(
        clipBehavior: Clip.none,
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
                        // Kept mounted while hidden (drawer revealed) so the
                        // scroll position and message window survive the
                        // reveal round-trip. `visible` suspends read acks.
                        child: Offstage(
                          offstage: !widget.loadMessages,
                          child: TickerMode(
                            enabled: widget.loadMessages,
                            child: RepaintBoundary(
                              child: MessageList(
                                key: ValueKey<String>(listChannelId),
                                expectedChannelId: listChannelId,
                                targetMessageId: widget.targetMessageId,
                                visible: widget.loadMessages,
                              ),
                            ),
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
                                      onTap: onClose,
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
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ComposerAutocompletePanelStrip(
                        host: _composerAutocompletePanelHost,
                        scrollController: _composerAutocompletePanelScroll,
                      ),
                    ),
                  ],
                ),
              ),
              RepaintBoundary(
                child: ChannelTextarea(
                  autocompletePanelHost: _composerAutocompletePanelHost,
                  autocompletePanelScrollController:
                      _composerAutocompletePanelScroll,
                ),
              ),
              if (isMobile && isPanelOpen)
                const SizedBox(height: kCollapsedPanelHeight),
            ],
          ),
          InlineExpressionPanelHost(
            showInlineEmojiPicker: widget.showInlineEmojiPicker,
          ),
        ],
      ),
    );
  }
}
