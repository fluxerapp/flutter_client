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
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_content_channel_gate.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/members/presentation/widgets/channel_members.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/presentation/voice_channel_page_view.dart';
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
    final bool isMemberListVisible = ref.watch(
      channelListViewModelProvider.select((s) => s.isMemberListVisible),
    );
    final Channel? channel = ref
        .watch(channelByIdProvider(widget.channelId))
        .value;
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

    ref
      ..listen<String?>(activeGuildIdProvider, (
        String? previous,
        String? next,
      ) {
        if (previous == next) {
          return;
        }
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _syncSearchContext(),
        );
      })
      ..listen<String?>(activeChannelIdProvider, (
        String? previous,
        String? next,
      ) {
        if (next == null || next.isEmpty) {
          return;
        }
        ref
            .read(channelHeaderSearchProvider.notifier)
            .bindChannel(channelId: next, guildId: widget.guildId);
      });

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
    final Widget header = ChannelHeader(
      channelId: widget.channelId,
      forceVoiceCallStyle: forceVoiceCallStyle,
    );
    final bool reserveBottomSafeArea = !ref.watch(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.slotHeight > 0,
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
              if (isWide)
                _WideChannelMemberListSync(
                  key: ValueKey<String>(widget.channelId),
                  channelId: widget.channelId,
                ),
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

class _WideChannelMemberListSync extends ConsumerStatefulWidget {
  const _WideChannelMemberListSync({required this.channelId, super.key});

  final String channelId;

  @override
  ConsumerState<_WideChannelMemberListSync> createState() =>
      _WideChannelMemberListSyncState();
}

class _WideChannelMemberListSyncState
    extends ConsumerState<_WideChannelMemberListSync> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _applyForLoadedChannel(),
    );
  }

  void _applyForLoadedChannel() {
    if (!mounted) {
      return;
    }
    final ChannelType? type = ref
        .read(channelByIdProvider(widget.channelId))
        .value
        ?.type;
    if (type == null) {
      return;
    }
    ref
        .read(channelListViewModelProvider.notifier)
        .applyAutoMemberListForChannel(type);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ChannelType?>(
      channelByIdProvider(widget.channelId).select((a) => a.value?.type),
      (ChannelType? previous, ChannelType? next) {
        if (next == null) {
          return;
        }
        ref
            .read(channelListViewModelProvider.notifier)
            .applyAutoMemberListForChannel(next);
      },
    );
    return const SizedBox.shrink();
  }
}
