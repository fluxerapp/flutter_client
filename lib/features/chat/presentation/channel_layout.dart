import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/category_channel_route_handler.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/link_channel_route_handler.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_results_panel.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_content_channel_gate.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/members/presentation/widgets/channel_members.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/presentation/voice_channel_page_view.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

/// Wrapper screen for the chat area content.
/// Takes guildId and channelId from go_router params.
class ChannelLayout extends ConsumerStatefulWidget {
  final String guildId;
  final String channelId;
  final String? messageId;

  const ChannelLayout({
    required this.guildId,
    required this.channelId,
    this.messageId,
    super.key,
  });

  static const _minWidthForMemberList = 600.0;

  @override
  ConsumerState<ChannelLayout> createState() => _ChannelLayoutState();
}

class _ChannelLayoutState extends ConsumerState<ChannelLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncSearchContext());
  }

  @override
  void didUpdateWidget(ChannelLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.guildId != widget.guildId ||
        oldWidget.channelId != widget.channelId) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _syncSearchContext());
    }
  }

  void _syncSearchContext() {
    if (!mounted) {
      return;
    }
    ref
        .read(channelHeaderSearchProvider.notifier)
        .bindChannel(channelId: widget.channelId, guildId: widget.guildId);
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide = isWideLayout(context);
    final Channel? channel = ref
        .watch(channelByIdProvider(widget.channelId))
        .value;
    final bool isMemberListVisible = ref.watch(
      channelListViewModelProvider.select(
        (ChannelListState state) => state.isMemberListVisibleForChannel(
          channelId: widget.channelId,
          channelType: channel?.type,
        ),
      ),
    );
    final bool isLinkChannel = channel?.type == ChannelType.guildLink;
    final bool isCategoryChannel = channel?.type == ChannelType.guildCategory;
    final bool isVoiceChannel = channel?.type == ChannelType.guildVoice;
    final bool isMobile = isMobileLayout(context);
    final AsyncValue<bool> showGateAsync = ref.watch(
      shouldShowMatureContentGateProvider(widget.channelId),
    );
    final bool showMatureContentGate = showGateAsync.value ?? false;
    final ChannelHeaderSearchState searchState = ref.watch(
      channelHeaderSearchProvider,
    );
    final bool isSearchActive =
        searchState.isActive && searchState.channelId == widget.channelId;
    // Keep the auto-dispose search provider alive while this channel is open.
    ref.watch(channelSearchProvider(widget.channelId, widget.guildId));
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final bool forceVoiceCallStyle =
        isVoiceChannel &&
        voice.isInVoice &&
        voice.channelId == widget.channelId &&
        voice.guildId == widget.guildId;

    void scheduleSearchContextSync(String? previous, String? next) {
      if (previous == next) {
        return;
      }
      // A route listener can fire while the scope is flushing mid-build, and a
      // provider write there throws: bind the pair after the frame instead.
      WidgetsBinding.instance.addPostFrameCallback((_) => _syncSearchContext());
    }

    ref
      ..listen<String?>(activeGuildIdProvider, scheduleSearchContextSync)
      ..listen<String?>(activeChannelIdProvider, scheduleSearchContextSync);

    final Widget primaryContent = showMatureContentGate
        ? MatureContentChannelGate(
            channelId: widget.channelId,
            guildId: widget.guildId,
            channelType: channel?.type,
          )
        : isLinkChannel && channel != null
        ? LinkChannelRouteHandler(
            guildId: widget.guildId,
            channel: channel,
            child: const SizedBox.shrink(),
          )
        : isCategoryChannel && channel != null
        ? CategoryChannelRouteHandler(
            guildId: widget.guildId,
            channel: channel,
            child: const SizedBox.shrink(),
          )
        : isVoiceChannel
        ? VoiceChannelPageView(
            guildId: widget.guildId,
            channelId: widget.channelId,
          )
        : ChannelChatContent(
            channelId: widget.channelId,
            targetMessageId: widget.messageId,
            showTopBar: false,
          );
    final Widget header = _VoiceChannelHeader(
      channelId: widget.channelId,
      forceVoiceCallStyle: forceVoiceCallStyle,
    );
    final bool reserveBottomSafeArea = chatLayoutReservesBottomSafeArea(
      isMobile: isMobile,
      keyboardSlotOccupied:
          !isMobile &&
          ref.watch(
            bottomInputSlotProvider.select(
              (BottomInputSlotState state) => state.slotHeight > 0,
            ),
          ),
    );

    return MobileChatBackScope(
      child: ColoredBox(
        color: isMobile
            ? context.colors.chatInputBackground
            : context.colors.chatBackground,
        child: SafeArea(
          bottom: reserveBottomSafeArea,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final bool showMemberList =
                      isWide &&
                      isMemberListVisible &&
                      !isSearchActive &&
                      constraints.maxWidth >=
                          ChannelLayout._minWidthForMemberList;
                  return Column(
                    children: [
                      header,
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: primaryContent),
                            if (isSearchActive)
                              ChannelSearchResultsPanel(
                                channelId: widget.channelId,
                                guildId: widget.guildId,
                                onClose: () => ref
                                    .read(channelHeaderSearchProvider.notifier)
                                    .closeSearch(),
                              ),
                            if (showMemberList)
                              ChannelMembers(
                                key: ValueKey<String>(widget.channelId),
                                guildId: widget.guildId,
                                channelId: widget.channelId,
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VoiceChannelHeader extends ConsumerWidget {
  const _VoiceChannelHeader({
    required this.channelId,
    required this.forceVoiceCallStyle,
  });

  final String channelId;
  final bool forceVoiceCallStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget header = ChannelHeader(
      channelId: channelId,
      forceVoiceCallStyle: forceVoiceCallStyle,
    );
    final bool hideableOverlay =
        forceVoiceCallStyle && isPhoneVoiceOverlay(context);
    if (!hideableOverlay) {
      return header;
    }
    final bool showsOverlay = ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    );
    return ClipRect(
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        alignment: Alignment.topCenter,
        heightFactor: showsOverlay ? 1 : 0,
        child: header,
      ),
    );
  }
}
