import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_composer_column.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_expression_expandable_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_scroll_physics.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';
import 'package:fluxer_app/features/ui/ui.dart';

const double _kChannelChatStatusRailMinHeight = 32;
const double _kChannelChatStatusMessageInset =
    _kChannelChatStatusRailMinHeight / 2;

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
    final String listChannelId = widget.displayChannelId;
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
    final bool isLoadingMore = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoadingMore),
    );
    final bool isLoadingNewer = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoadingNewer),
    );
    final bool isActiveReadChannel =
        effectiveChannelId.isNotEmpty &&
        readViewport.channelId == effectiveChannelId;
    final bool isBusy = isLoadingMore || isLoadingNewer || isSyncingMessages;
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
    final bool showSlowmodeIndicator =
        effectiveChannelId.isNotEmpty &&
        ref.watch(
          channelByIdProvider(effectiveChannelId).select(
            (AsyncValue<Channel?> channel) =>
                (channel.value?.rateLimitPerUser ?? 0) > 0,
          ),
        );
    final VoidCallback? onClose = widget.onClose;
    final bool stripKeyboardInsets =
        mobileChannelScaffoldShouldRemoveKeyboardInset(
          isChatRoute: true,
          isExpressionPanelOpen: false,
        );
    final bool isMobile = isMobileLayout(context);
    final bool isPanelOpen =
        isMobile &&
        widget.showInlineEmojiPicker &&
        ref.watch(expressionPanelProvider);
    final Widget messageList = RepaintBoundary(
      child: MessageList(
        key: ValueKey<String>(listChannelId),
        expectedChannelId: listChannelId,
        targetMessageId: widget.targetMessageId,
        visible: widget.loadMessages,
      ),
    );
    return ColoredBox(
      color: context.colors.chatBackground,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double sheetContentHeight = 0;
          double dragHandleHeight = 0;
          if (isPanelOpen) {
            final ({
              double? anchoredKeyboardHeight,
              double fallbackKeyboardHeight,
              double safeAreaBottom,
            })
            panelMetrics = ref.watch(
              mobileKeyboardMetricsProvider.select(
                (MobileKeyboardMetricsState metrics) => (
                  anchoredKeyboardHeight: metrics.anchoredKeyboardHeight,
                  fallbackKeyboardHeight: metrics.fallbackKeyboardHeight,
                  safeAreaBottom: metrics.safeAreaBottom,
                ),
              ),
            );
            final double slotHeight = ref.watch(
              bottomInputSlotProvider.select(
                (BottomInputSlotState state) => state.slotHeight,
              ),
            );
            final double panelAnchorHeight = bottomInputSlotAnchorHeight(
              anchoredKeyboardHeight: panelMetrics.anchoredKeyboardHeight,
              fallbackHeight: panelMetrics.fallbackKeyboardHeight,
              safeAreaBottom: panelMetrics.safeAreaBottom,
            );
            dragHandleHeight = inlineExpressionPanelDragHandleHeight(
              bottomSpacing: context.layout.s2,
            );
            final double grossAnchorHeight = inlineExpressionPanelAnchorHeight(
              anchoredKeyboardHeight: panelMetrics.anchoredKeyboardHeight,
              fallbackHeight: panelMetrics.fallbackKeyboardHeight,
            );
            final double reservedHeight = resolvePanelReservedLayoutHeight(
              slotHeight: slotHeight,
              netAnchorHeight: panelAnchorHeight,
              grossAnchorHeight: grossAnchorHeight,
            );
            sheetContentHeight = inlineExpressionPanelDockedContentHeight(
              keyboardAnchorNet: reservedHeight,
              dragHandleHeight: dragHandleHeight,
            );
          }
          return Stack(
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
                            child: Offstage(
                              offstage: !widget.loadMessages,
                              child: TickerMode(
                                enabled: widget.loadMessages,
                                child: stripKeyboardInsets
                                    ? MediaQuery.removeViewInsets(
                                        context: context,
                                        removeBottom: true,
                                        child: messageList,
                                      )
                                    : messageList,
                              ),
                            ),
                          ),
                        ),
                        if (onClose != null || showJumpToBottom)
                          Positioned(
                            right: 8,
                            bottom: showSlowmodeIndicator
                                ? _kChannelChatStatusMessageInset
                                : 0,
                            child: Column(
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
                                      enabled: !isBusy,
                                      isLoading: isSyncingMessages,
                                      onTap: () => ref
                                          .read(chatViewModelProvider.notifier)
                                          .scrollToBottom(),
                                    ),
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
                  ChannelChatComposerBoundary(
                    composer: ChatComposerColumn(
                      autocompletePanelHost: _composerAutocompletePanelHost,
                      autocompletePanelScrollController:
                          _composerAutocompletePanelScroll,
                      showInlineEmojiPicker: widget.showInlineEmojiPicker,
                    ),
                    leadingStatus: const TypingIndicatorBar(),
                    trailingStatuses: <Widget>[
                      if (showNeko) const NekoSprite(),
                      SlowmodeIndicator(leadingSpacing: showNeko ? 8 : 0),
                    ],
                  ),
                ],
              ),
              if (isPanelOpen)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -inlineExpressionPanelHomeIndicatorInset(
                    MediaQuery.of(context),
                  ),
                  child: ChatExpressionExpandableSheet(
                    collapsedHeight: math.max(
                      sheetContentHeight,
                      kExpressionPanelMinContentHeight,
                    ),
                    dragHandleHeight: dragHandleHeight,
                    parentHeight: constraints.maxHeight,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class ChannelChatComposerBoundary extends StatelessWidget {
  const ChannelChatComposerBoundary({
    required this.composer,
    required this.leadingStatus,
    required this.trailingStatuses,
    super.key,
  });

  final Widget composer;
  final Widget leadingStatus;
  final List<Widget> trailingStatuses;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        composer,
        Positioned(
          top: -_kChannelChatStatusMessageInset,
          left: 0,
          right: 0,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: _kChannelChatStatusRailMinHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                spacing: 8,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: leadingStatus,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: trailingStatuses,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
