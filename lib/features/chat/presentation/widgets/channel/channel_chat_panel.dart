import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/chat_floating_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_status_row.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/mobile_composer_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slowmode_indicator.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/typing_indicator_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/chat_list_keyboard_dismiss.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pin.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_panel_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_composer_column.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_expression_expandable_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_backdrop.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:fluxer_app/features/chat/utils/composer/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/inline_expression_panel_scroll_physics.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/utils/mobile_scaffold_resize_policy.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kChannelChatNekoBottom = 0;
const double _kChannelChatNekoBottomAboveSlowmode =
    WideComposerLayout.statusLineHeight;
const double _kChannelChatJumpToBottomPaddingBottom = 10;
const double _kChannelChatJumpToBottomNekoLowerInset = 10;

@visibleForTesting
double channelChatJumpToBottomBottomOffset({
  required bool isMobile,
  required bool showNeko,
  required bool showSlowmode,
}) {
  final double fadeHeight = WideComposerLayout.fadeHeightFor(
    isMobile: isMobile,
  );
  if (!showNeko) {
    return isMobile && !showSlowmode
        ? kChatFloatingButtonGap - MobileComposerLayout.topInset
        : fadeHeight;
  }
  final double nekoBottom = showSlowmode
      ? _kChannelChatNekoBottomAboveSlowmode
      : _kChannelChatNekoBottom;
  final double nekoTop = nekoBottom + kNekoSpriteSize;
  final double defaultButtonBottom =
      fadeHeight - _kChannelChatJumpToBottomPaddingBottom;
  final double raiseBy = math.max(0, nekoTop - defaultButtonBottom);
  return fadeHeight + raiseBy - _kChannelChatJumpToBottomNekoLowerInset;
}

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

Widget _attachmentPanelContent(
  BuildContext _,
  ScrollController scrollController,
) {
  return AttachmentPanelContent(scrollController: scrollController);
}

class ChannelChatPanel extends ConsumerStatefulWidget {
  const ChannelChatPanel({
    required this.displayChannelId,
    this.targetMessageId,
    this.loadMessages = true,
    this.showInlineEmojiPicker = true,
    this.applyWallpaper = true,
    this.onClose,
    super.key,
  });

  final String displayChannelId;
  final String? targetMessageId;
  final bool loadMessages;
  final bool showInlineEmojiPicker;
  final bool applyWallpaper;
  final VoidCallback? onClose;

  @override
  ConsumerState<ChannelChatPanel> createState() => _ChannelChatPanelState();
}

class _ChannelChatPanelState extends ConsumerState<ChannelChatPanel> {
  final ComposerAutocompletePanelHost _composerAutocompletePanelHost =
      ComposerAutocompletePanelHost(null);
  final ScrollController _composerAutocompletePanelScroll = ScrollController();
  DockedComposerPanel? _dockedPanel;

  @override
  void dispose() {
    _composerAutocompletePanelScroll.dispose();
    _composerAutocompletePanelHost.dispose();
    super.dispose();
  }

  Widget _maybeWallpaperText(Widget child) {
    if (!widget.applyWallpaper) {
      return child;
    }
    return ChatWallpaperTextTheme(child: child);
  }

  Widget _buildStatusOverlay({
    required bool showNeko,
    required bool showSlowmode,
    required String channelId,
  }) {
    return ChannelChatComposerBoundary(
      channelId: channelId,
      applyWallpaper: widget.applyWallpaper,
      leadingStatus: const TypingIndicatorBar(),
      trailingStatuses: <Widget>[SlowmodeIndicator(channelId: channelId)],
      neko: showNeko ? const NekoSprite() : null,
      nekoBottom: showSlowmode
          ? _kChannelChatNekoBottomAboveSlowmode
          : _kChannelChatNekoBottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String listChannelId = widget.displayChannelId;
    final bool showNeko = ref.watch(
      appearancePreferencesProvider.select((state) => state.showNeko),
    );
    final bool showSlowmode = composerSlowmodeIndicatorVisible(
      ref,
      listChannelId,
    );
    final VoidCallback? onClose = widget.onClose;
    final bool stripKeyboardInsets =
        mobileChannelScaffoldShouldRemoveKeyboardInset(
          isChatRoute: true,
          isExpressionPanelOpen: false,
        );
    final bool isMobile = isMobileLayout(context);
    final bool isExpressionOpen =
        isMobile &&
        widget.showInlineEmojiPicker &&
        ref.watch(expressionPanelProvider);
    final bool isAttachmentOpen =
        isMobile && ref.watch(attachmentPanelProvider);
    final bool isPanelOpen = isComposerPanelOpen(
      expressionPanelOpen: isExpressionOpen,
      attachmentPanelOpen: isAttachmentOpen,
    );
    final bool keyboardTakingOverPanel =
        isMobile &&
        ref.watch(
          bottomInputSlotProvider.select(
            (BottomInputSlotState state) =>
                state.transition == BottomInputTransition.lockingToKeyboard,
          ),
        );
    final DockedComposerPanel? dockedPanel = resolveDockedComposerPanel(
      expressionPanelOpen: isExpressionOpen,
      attachmentPanelOpen: isAttachmentOpen,
      keyboardTakingOver: keyboardTakingOverPanel,
      previous: _dockedPanel,
    );
    _dockedPanel = dockedPanel;
    final Widget messageList = MessageList(
      key: ValueKey<String>(listChannelId),
      expectedChannelId: listChannelId,
      targetMessageId: widget.targetMessageId,
      visible: widget.loadMessages,
    );
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (widget.applyWallpaper)
          const ChatWallpaperBackdrop()
        else
          ColoredBox(color: context.colors.chatBackground),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double sheetContentHeight = 0;
            double dragHandleHeight = 0;
            if (dockedPanel != null) {
              final ({
                double? anchoredKeyboardHeight,
                double fallbackKeyboardHeight,
              })
              panelMetrics = ref.watch(
                mobileKeyboardMetricsProvider.select(
                  (MobileKeyboardMetricsState metrics) => (
                    anchoredKeyboardHeight: metrics.anchoredKeyboardHeight,
                    fallbackKeyboardHeight: metrics.fallbackKeyboardHeight,
                  ),
                ),
              );
              final double slotHeight = ref.watch(
                bottomInputSlotProvider.select(
                  (BottomInputSlotState state) => state.slotHeight,
                ),
              );
              final double panelAnchorHeight =
                  inlineExpressionPanelAnchorHeight(
                    anchoredKeyboardHeight: panelMetrics.anchoredKeyboardHeight,
                    fallbackHeight: panelMetrics.fallbackKeyboardHeight,
                  );
              dragHandleHeight = kFluxerSheetHandleHeight;
              final double reservedHeight = resolvePanelReservedLayoutHeight(
                slotHeight: slotHeight,
                netAnchorHeight: panelAnchorHeight,
                grossAnchorHeight: panelAnchorHeight,
              );
              final double homeIndicatorInset =
                  inlineExpressionPanelHomeIndicatorInset(
                    MediaQuery.of(context),
                  );
              sheetContentHeight = inlineExpressionPanelDockedContentHeight(
                keyboardAnchorNet:
                    inlineExpressionPanelDockedReservedBodyHeight(
                      reservedHeight: reservedHeight,
                      homeIndicatorInset: homeIndicatorInset,
                    ),
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
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Positioned.fill(
                            child: _maybeWallpaperText(
                              Stack(
                                clipBehavior: Clip.none,
                                children: <Widget>[
                                  Positioned.fill(
                                    child: ChatListKeyboardDismiss(
                                      onDismissPanels: () {
                                        if (!isPanelOpen) {
                                          return;
                                        }
                                        ref
                                            .read(
                                              composerPanelDismissRequestProvider
                                                  .notifier,
                                            )
                                            .requestAnimatedClose();
                                      },
                                      child: stripKeyboardInsets
                                          ? MediaQuery.removeViewInsets(
                                              context: context,
                                              removeBottom: true,
                                              child: messageList,
                                            )
                                          : messageList,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    height: WideComposerLayout
                                        .statusFadeScrolledHeight,
                                    child: _buildStatusOverlay(
                                      showNeko: showNeko,
                                      showSlowmode: showSlowmode,
                                      channelId: listChannelId,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _ChannelChatScrollOverlay(
                            channelId: listChannelId,
                            loadMessages: widget.loadMessages,
                            showNeko: showNeko,
                            showSlowmode: showSlowmode,
                            onClose: onClose,
                          ),
                          ComposerAutocompletePanelLayer(
                            host: _composerAutocompletePanelHost,
                            scrollController: _composerAutocompletePanelScroll,
                          ),
                        ],
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: math.max(
                          0,
                          constraints.maxHeight -
                              WideComposerLayout.statusRowHeight,
                        ),
                      ),
                      child: ChatComposerColumn(
                        autocompletePanelHost: _composerAutocompletePanelHost,
                        autocompletePanelScrollController:
                            _composerAutocompletePanelScroll,
                      ),
                    ),
                  ],
                ),
                if (dockedPanel != null)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: IgnorePointer(
                      ignoring: !isPanelOpen,
                      child: ChatExpressionExpandableSheet(
                        collapsedHeight: math.max(
                          sheetContentHeight,
                          kExpressionPanelMinContentHeight,
                        ),
                        dragHandleHeight: dragHandleHeight,
                        contentBuilder:
                            dockedPanel == DockedComposerPanel.attachment
                            ? _attachmentPanelContent
                            : null,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ChannelChatScrollOverlay extends ConsumerWidget {
  const _ChannelChatScrollOverlay({
    required this.channelId,
    required this.loadMessages,
    required this.showNeko,
    required this.showSlowmode,
    this.onClose,
  });

  final String channelId;
  final bool loadMessages;
  final bool showNeko;
  final bool showSlowmode;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!loadMessages && onClose == null) {
      return const SizedBox.shrink();
    }
    final bool hasMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.messages.isNotEmpty),
    );
    final bool isLoading = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isLoading),
    );
    final bool hasMoreNewerMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.hasMoreNewerMessages),
    );
    final bool messageLoadFailed = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.messageLoadFailed),
    );
    final bool isSyncingMessages = ref.watch(
      chatViewModelProvider.select((ChatViewState s) => s.isSyncingMessages),
    );
    final ({String channelId, double distanceFromBottom}) viewport = ref.watch(
      chatReadViewportProvider.select(
        (ChatReadViewportState state) => (
          channelId: state.channelId,
          distanceFromBottom: state.distanceFromBottom,
        ),
      ),
    );
    final bool isActiveReadChannel =
        channelId.isNotEmpty && viewport.channelId == channelId;
    final bool showJumpToBottom =
        loadMessages &&
        shouldShowJumpToBottomButton(
          hasMessages: hasMessages,
          isLoading: isLoading,
          isActiveReadChannel: isActiveReadChannel,
          distanceFromBottom: viewport.distanceFromBottom,
          hasMoreNewerMessages: hasMoreNewerMessages,
          messageLoadFailed: messageLoadFailed,
        );
    final bool isMobile = isMobileLayout(context);
    final double bottom = channelChatJumpToBottomBottomOffset(
      isMobile: isMobile,
      showNeko: showNeko,
      showSlowmode: showSlowmode,
    );
    void jumpToPresent() =>
        ref.read(chatViewModelProvider.notifier).scrollToBottom();
    final bool showPresentBar =
        loadMessages && !isMobile && showJumpToBottom && hasMoreNewerMessages;
    final bool showButton =
        loadMessages && showJumpToBottom && (isMobile || !hasMoreNewerMessages);
    return Positioned.fill(
      child: Stack(
        children: <Widget>[
          Positioned(
            right: isMobile ? MobileComposerLayout.sideInset : 8,
            bottom: isMobile ? bottom : bottom + 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: kChatFloatingButtonGap,
              children: <Widget>[
                if (showButton)
                  ChatJumpToBottomButton(
                    isLoading: isSyncingMessages,
                    onTap: jumpToPresent,
                  ),
                if (onClose != null) ChatCloseButton(onTap: onClose!),
              ],
            ),
          ),
          if (showPresentBar)
            Positioned(
              left: 8,
              right: 8,
              bottom: bottom + 10,
              child: Center(
                child: ChannelChatJumpToPresentBar(
                  isLoading: isSyncingMessages,
                  onJumpToPresent: jumpToPresent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ChannelChatJumpToPresentBar extends StatelessWidget {
  const ChannelChatJumpToPresentBar({
    required this.isLoading,
    required this.onJumpToPresent,
    super.key,
  });

  final bool isLoading;
  final VoidCallback onJumpToPresent;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final bool isMobile = isMobileLayout(context);
    return Container(
      constraints: const BoxConstraints(minHeight: 44),
      padding: EdgeInsetsDirectional.fromSTEB(isMobile ? 12 : 14, 6, 8, 6),
      decoration: BoxDecoration(
        color: Color.lerp(
          colors.backgroundTextarea,
          colors.backgroundTertiary,
          0.1,
        ),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: colors.backgroundModifierAccent.withValues(
            alpha: colors.backgroundModifierAccent.a * 0.8,
          ),
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.18),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: <Widget>[
          Flexible(
            child: Text(
              l10n.chatViewingOlderMessages,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.smallText.copyWith(
                color: colors.textSecondary,
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: FluxerButton.primary(
              label: l10n.chatJumpToPresent,
              size: FluxerButtonSize.compact,
              fitContent: true,
              isLoading: isLoading,
              onPressed: onJumpToPresent,
            ),
          ),
        ],
      ),
    );
  }
}

class ChannelChatComposerBoundary extends ConsumerWidget {
  const ChannelChatComposerBoundary({
    required this.channelId,
    required this.leadingStatus,
    required this.trailingStatuses,
    this.applyWallpaper = true,
    this.neko,
    this.nekoBottom = _kChannelChatNekoBottom,
    super.key,
  });

  final String channelId;
  final Widget leadingStatus;
  final List<Widget> trailingStatuses;
  final bool applyWallpaper;
  final Widget? neko;
  final double nekoBottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = isMobileLayout(context);
    final double statusRailPaddingStart =
        WideComposerLayout.statusRailPaddingInlineFor(isMobile: isMobile);
    final double statusRailPaddingEnd = isMobile
        ? MobileComposerLayout.statusTrailingInsetEnd
        : statusRailPaddingStart;
    final bool statusVisible =
        ref
            .watch(presentableTypingUsersInChannelProvider(channelId))
            .isNotEmpty ||
        composerSlowmodeIndicatorVisible(ref, channelId);
    final bool atBottom = ref.watch(
      chatReadViewportProvider.select(
        (ChatReadViewportState state) =>
            state.channelId != channelId ||
            state.distanceFromBottom <= kMessageListPinEngageDistance,
      ),
    );
    final double fadeHeight = atBottom
        ? WideComposerLayout.statusFadeAtBottomHeight
        : WideComposerLayout.statusFadeScrolledHeight;
    final double solidFrom = fadeHeight - WideComposerLayout.statusSafeGap;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        if (statusVisible)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: fadeHeight,
            child: applyWallpaper
                ? ChatWallpaperComposerFade(solidFrom: solidFrom)
                : WideComposerFade(
                    surfaceColor: context.colors.chatBackground,
                    solidFrom: solidFrom,
                  ),
          ),
        Positioned(
          left: statusRailPaddingStart,
          right: statusRailPaddingEnd,
          bottom: 0,
          height: WideComposerLayout.statusLineHeight,
          child: Row(
            spacing: WideComposerLayout.statusRailGap,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: leadingStatus,
                ),
              ),
              Row(mainAxisSize: MainAxisSize.min, children: trailingStatuses),
            ],
          ),
        ),
        if (neko != null)
          Positioned(
            right: isMobile
                ? MobileComposerLayout.nekoInsetEnd
                : statusRailPaddingStart,
            bottom: nekoBottom,
            child: neko!,
          ),
      ],
    );
  }
}
