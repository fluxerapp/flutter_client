import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_segmented_tabs.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_expression_tabs.dart';
import 'package:fluxer_app/features/chat/utils/composer/emoji_picker_precache.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

const double kExpressionPanelSearchHorizontalPadding = 8;
const double kExpressionPanelSearchTopPadding = 8;
const double kExpressionPanelSearchBottomPadding = 0;
const Duration kExpressionPanelContentFadeDuration =
    FluxerMotionTheme.hoverDuration;

class ExpressionPanelContent extends ConsumerStatefulWidget {
  const ExpressionPanelContent({
    required this.onClose,
    required this.scrollController,
    required this.searchFocusNode,
    this.onEmojiSelect,
    this.onGifSelect,
    this.onStickerSelect,
    this.onFavoriteMemeSelect,
    this.onSearchActivated,
    this.sheetDragHandlers,
    this.onBackspace,
    super.key,
  });

  final VoidCallback onClose;
  final ScrollController scrollController;
  final void Function(String name, String surrogates)? onEmojiSelect;
  final ValueChanged<FluxerSelectedGif>? onGifSelect;
  final ValueChanged<StickerEntry>? onStickerSelect;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelect;
  final VoidCallback? onSearchActivated;
  final FocusNode searchFocusNode;
  final ExpandableSheetDragHandlers? sheetDragHandlers;
  final VoidCallback? onBackspace;

  @override
  ConsumerState<ExpressionPanelContent> createState() =>
      _ExpressionPanelContentState();
}

class _ExpressionPanelContentState extends ConsumerState<ExpressionPanelContent>
    with SingleTickerProviderStateMixin {
  static const Duration _kSearchDebounce = Duration(milliseconds: 120);

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _searchDebounce;
  var _cancelEmojiWarmup = false;
  late final AnimationController _fadeController;
  late final Animation<double> _contentFade;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _fadeController = AnimationController(
      vsync: this,
      duration: kExpressionPanelContentFadeDuration,
    );
    _contentFade = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    final bool shouldFade = !ref.read(expressionPanelContentFadeProvider);
    if (shouldFade) {
      _fadeController.forward();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref.read(expressionPanelContentFadeProvider.notifier).markPlayed();
      });
    } else {
      _fadeController.value = 1;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !isMobileLayout(context)) {
        return;
      }
      scheduleEmojiPickerWarmup(
        ref: ref,
        context: context,
        isCancelled: () => _cancelEmojiWarmup,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fadeController.duration = context.motion.hover;
  }

  @override
  void dispose() {
    _cancelEmojiWarmup = true;
    _searchDebounce?.cancel();
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final String next = _searchController.text;
    if (next.isEmpty) {
      _searchDebounce?.cancel();
      if (_searchQuery.isNotEmpty) {
        setState(() => _searchQuery = '');
      }
      return;
    }
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kSearchDebounce, () {
      if (!mounted) {
        return;
      }
      setState(() => _searchQuery = _searchController.text);
    });
  }

  String _tabLabel(ExpressionPickerTab tab) =>
      expressionTabLabel(tab, FluxerLocalizations.of(context));

  @override
  Widget build(BuildContext context) {
    final String skinTone = ref.watch(emojiSkinToneProvider).value ?? '';
    final String? channelId = ref.watch(
      chatViewModelProvider.select((state) => state.channelId),
    );
    final ChannelMessagePermissions perms = channelId == null
        ? ChannelMessagePermissions.all
        : watchChannelMessagePermissionsForComposer(ref, channelId);
    final List<ExpressionPickerTab> visibleTabs = mobileExpressionPanelTabs(
      expressionPanelVisibleTabs(
        perms,
        gifEnabled: ref.watch(
          instanceRuntimeConfigProvider.select((config) => config.gifEnabled),
        ),
      ),
    );
    final ExpressionPickerTab storedTab = ref.watch(expressionPanelTabProvider);
    final ExpressionPickerTab selectedTab = resolveVisibleExpressionTab(
      storedTab,
      visibleTabs,
    );
    if (!visibleTabs.contains(storedTab)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref.read(expressionPanelTabProvider.notifier).setTab(selectedTab);
      });
    }
    return FadeTransition(
      opacity: _contentFade,
      child: Column(
        children: <Widget>[
          _buildDraggableChrome(context, selectedTab, visibleTabs),
          Expanded(
            child: ExpressionPicker(
              onClose: widget.onClose,
              onEmojiSelect: widget.onEmojiSelect,
              onGifSelect: widget.onGifSelect,
              onStickerSelect: widget.onStickerSelect,
              onFavoriteMemeSelect: widget.onFavoriteMemeSelect,
              onTabChanged: (ExpressionPickerTab tab) {
                if (tab != selectedTab) {
                  if (widget.scrollController.hasClients) {
                    widget.scrollController.jumpTo(0);
                  }
                  ref.read(expressionPanelTabProvider.notifier).setTab(tab);
                }
              },
              initialTab: selectedTab,
              visibleTabs: visibleTabs,
              showTabs: false,
              searchController: _searchController,
              searchQuery: _searchQuery,
              skinTone: skinTone,
              channelId: channelId,
              scrollController: widget.scrollController,
              contentSearchHorizontalPadding:
                  kExpressionPanelSearchHorizontalPadding,
              contentSearchTopPadding: kExpressionPanelSearchTopPadding,
              contentSearchBottomPadding: kExpressionPanelSearchBottomPadding,
              onSearchActivated: widget.onSearchActivated,
              searchFocusNode: widget.searchFocusNode,
              sheetDragHandlers: widget.sheetDragHandlers,
              onEmojiBackspace: widget.onBackspace,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDraggableChrome(
    BuildContext context,
    ExpressionPickerTab selectedTab,
    List<ExpressionPickerTab> visibleTabs,
  ) {
    final Widget chrome = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSegmentedTabs(context, selectedTab, visibleTabs),
        if (selectedTab == ExpressionPickerTab.emojis)
          PickerSearchInput(
            controller: _searchController,
            hintText: FluxerLocalizations.of(context).emojiSearchPlaceholder,
            horizontalPadding: kExpressionPanelSearchHorizontalPadding,
            topPadding: kExpressionPanelSearchTopPadding,
            bottomPadding: kExpressionPanelSearchBottomPadding,
            focusNode: widget.searchFocusNode,
            onActivated: widget.onSearchActivated,
          ),
      ],
    );
    final ExpandableSheetDragHandlers? handlers = widget.sheetDragHandlers;
    if (handlers == null) {
      return chrome;
    }
    return handlers.wrapChrome(chrome);
  }

  Widget _buildSegmentedTabs(
    BuildContext context,
    ExpressionPickerTab selectedTab,
    List<ExpressionPickerTab> visibleTabs,
  ) {
    return ExpressionSegmentedTabs(
      tabs: visibleTabs,
      selected: selectedTab,
      labelOf: _tabLabel,
      onSelected: (ExpressionPickerTab tab) {
        if (widget.scrollController.hasClients) {
          widget.scrollController.jumpTo(0);
        }
        ref.read(expressionPanelTabProvider.notifier).setTab(tab);
      },
    );
  }
}
