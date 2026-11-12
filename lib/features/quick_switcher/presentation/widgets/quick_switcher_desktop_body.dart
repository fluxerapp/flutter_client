import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_result_unread_state.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_provider.dart';
import 'package:fluxer_app/features/quick_switcher/utils/quick_switcher_navigation.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

const double kQuickSwitcherDesktopWidth = 576;
const double _kScrollerHeight = 320;
const double _kRowHeight = 36;
const double _kRowGap = 2;
const double _kIconSize = 24;

class QuickSwitcherDesktopBody extends ConsumerStatefulWidget {
  const QuickSwitcherDesktopBody({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  ConsumerState<QuickSwitcherDesktopBody> createState() =>
      _QuickSwitcherDesktopBodyState();
}

class _QuickSwitcherDesktopBodyState
    extends ConsumerState<QuickSwitcherDesktopBody> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _rowKeys = <int, GlobalKey>{};

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleQueryChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleQueryChanged() {
    ref.read(quickSwitcherProvider.notifier).setQuery(_controller.text);
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final int delta = switch (event.logicalKey) {
      LogicalKeyboardKey.arrowDown => 1,
      LogicalKeyboardKey.arrowUp => -1,
      _ => 0,
    };
    if (delta == 0) {
      return KeyEventResult.ignored;
    }
    ref.read(quickSwitcherProvider.notifier).moveSelection(delta);
    WidgetsBinding.instance.addPostFrameCallback((_) => _revealSelected());
    return KeyEventResult.handled;
  }

  void _revealSelected() {
    if (!mounted) {
      return;
    }
    final int index = ref.read(quickSwitcherProvider).selectedIndex;
    final BuildContext? rowContext = _rowKeys[index]?.currentContext;
    if (rowContext == null) {
      return;
    }
    Scrollable.ensureVisible(
      rowContext,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    );
    Scrollable.ensureVisible(
      rowContext,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
    );
  }

  void _execute(QuickSwitcherResult result) {
    if (!isQuickSwitcherExecutable(result)) {
      return;
    }
    unawaited(
      executeQuickSwitcherResult(
        context: context,
        ref: ref,
        result: result,
        onClose: widget.onClose,
      ),
    );
  }

  void _confirmSelection() {
    final QuickSwitcherState state = ref.read(quickSwitcherProvider);
    if (state.selectedIndex < 0 ||
        state.selectedIndex >= state.results.length) {
      return;
    }
    _execute(state.results[state.selectedIndex]);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final (
      List<QuickSwitcherResult> results,
      bool hasQuery,
      Map<String, QuickSwitcherUnreadChannel> unreadByChannelId,
    ) = ref.watch(
      quickSwitcherProvider.select(
        (QuickSwitcherState s) =>
            (s.results, s.query.trim().isNotEmpty, s.unreadByChannelId),
      ),
    );
    final bool showScroller = results.isNotEmpty || hasQuery;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12),
          child: Focus(
            onKeyEvent: _handleKey,
            canRequestFocus: false,
            skipTraversal: true,
            child: FluxerInput(
              controller: _controller,
              focusNode: _focusNode,
              hint: l10n.quickSwitcherSearchPlaceholder,
              autofocus: true,
              autocorrect: false,
              enableSuggestions: false,
              onSubmitted: (_) => _confirmSelection(),
              desktopFillColor: Theme.of(context).brightness == Brightness.light
                  ? context.colors.backgroundSecondary
                  : context.colors.backgroundPrimary,
            ),
          ),
        ),
        if (showScroller)
          SizedBox(
            height: _kScrollerHeight,
            child: results.isEmpty
                ? _buildEmptyState(context, l10n)
                : _buildResults(context, results, unreadByChannelId),
          ),
        const _QuickSwitcherDesktopFooter(),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            l10n.quickSwitcherNoMatchesFound,
            textAlign: TextAlign.center,
            style: textStyles.label.copyWith(
              color: colors.textPrimaryMuted,
              fontWeight: FontWeight.w500,
              height: 20 / 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.quickSwitcherEmptyHint,
            textAlign: TextAlign.center,
            style: textStyles.timestamp.copyWith(
              color: colors.textPrimaryMuted,
              height: 16 / 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(
    BuildContext context,
    List<QuickSwitcherResult> results,
    Map<String, QuickSwitcherUnreadChannel> unreadByChannelId,
  ) {
    final List<List<int>> sections = <List<int>>[];
    for (int i = 0; i < results.length; i++) {
      if (sections.isEmpty || results[i] is QuickSwitcherHeaderResult) {
        sections.add(<int>[]);
      }
      sections.last.add(i);
    }
    _rowKeys.removeWhere((int index, GlobalKey _) {
      return index >= results.length;
    });
    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      children: <Widget>[
        for (int s = 0; s < sections.length; s++)
          Padding(
            padding: EdgeInsets.fromLTRB(4, s == 0 ? 4 : 0, 4, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildSection(results, unreadByChannelId, sections[s]),
            ),
          ),
      ],
    );
  }

  List<Widget> _buildSection(
    List<QuickSwitcherResult> results,
    Map<String, QuickSwitcherUnreadChannel> unreadByChannelId,
    List<int> indices,
  ) {
    final List<Widget> children = <Widget>[];
    bool previousWasRow = false;
    for (final int index in indices) {
      final QuickSwitcherResult result = results[index];
      if (result is QuickSwitcherHeaderResult) {
        children.add(_QuickSwitcherDesktopSectionHeader(title: result.title));
        previousWasRow = false;
        continue;
      }
      if (previousWasRow) {
        children.add(const SizedBox(height: _kRowGap));
      }
      children.add(
        _QuickSwitcherDesktopRow(
          key: _rowKeys.putIfAbsent(index, GlobalKey.new),
          index: index,
          result: result,
          unreadState: quickSwitcherUnreadStateForResult(
            result: result,
            unreadByChannelId: unreadByChannelId,
            isActive: false,
          ),
          onHover: () =>
              ref.read(quickSwitcherProvider.notifier).setSelectedIndex(index),
          onTap: () => _execute(result),
        ),
      );
      previousWasRow = true;
    }
    return children;
  }
}

class _QuickSwitcherDesktopFooter extends StatelessWidget {
  const _QuickSwitcherDesktopFooter();

  static const List<String> _prefixes = <String>['@', '#', '!', '*'];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<String> labels = <String>[
      l10n.quickSwitcherSectionPeople,
      l10n.quickSwitcherSectionTextChannels,
      l10n.quickSwitcherSectionVoiceChannels,
      l10n.quickSwitcherSectionCommunities,
    ];
    final List<String> markers = <String>[
      for (int i = 0; i < _prefixes.length; i++) '\u{E000}$i\u{E001}',
    ];
    final String template = l10n.quickSwitcherFooterPrefixHint(
      markers[0],
      markers[1],
      markers[2],
      markers[3],
    );
    final TextStyle textStyle = context.textStyles.timestamp.copyWith(
      fontSize: 11,
      height: 20 / 11,
      fontWeight: FontWeight.w400,
      color: colors.textPrimaryMuted,
    );
    final List<InlineSpan> spans = <InlineSpan>[];
    final RegExp pattern = RegExp('\u{E000}(\\d)\u{E001}', unicode: true);
    int cursor = 0;
    for (final RegExpMatch match in pattern.allMatches(template)) {
      if (match.start > cursor) {
        spans.add(TextSpan(text: template.substring(cursor, match.start)));
      }
      final int index = int.parse(match.group(1)!);
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: FluxerTooltip(
            message: labels[index],
            child: _QuickSwitcherFooterCode(symbol: _prefixes[index]),
          ),
        ),
      );
      cursor = match.end;
    }
    if (cursor < template.length) {
      spans.add(TextSpan(text: template.substring(cursor)));
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text.rich(TextSpan(style: textStyle, children: spans)),
      ),
    );
  }
}

class _QuickSwitcherFooterCode extends StatelessWidget {
  const _QuickSwitcherFooterCode({required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 20,
      constraints: const BoxConstraints(minWidth: 20),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        borderRadius: context.layout.radiusSm,
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: Center(
        widthFactor: 1,
        child: Text(
          symbol,
          style: context.textStyles.timestamp.copyWith(
            fontSize: 11,
            height: 18 / 11,
            fontWeight: FontWeight.w400,
            color: colors.textTertiary,
          ),
        ),
      ),
    );
  }
}

class _QuickSwitcherDesktopSectionHeader extends StatelessWidget {
  const _QuickSwitcherDesktopSectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 6),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.smallText.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: context.colors.textTertiary,
        ),
      ),
    );
  }
}

class _QuickSwitcherDesktopRow extends ConsumerWidget {
  const _QuickSwitcherDesktopRow({
    required this.index,
    required this.result,
    required this.unreadState,
    required this.onHover,
    required this.onTap,
    super.key,
  });

  final int index;
  final QuickSwitcherResult result;
  final QuickSwitcherResultUnreadState unreadState;
  final VoidCallback onHover;
  final VoidCallback onTap;

  bool get _isHighlight =>
      (unreadState.hasUnread || unreadState.mentionCount > 0) &&
      (result is QuickSwitcherTextChannelResult ||
          result is QuickSwitcherVoiceChannelResult ||
          result is QuickSwitcherGroupDmResult);

  String get _title => switch (result) {
    QuickSwitcherUserResult(:final title) => title,
    QuickSwitcherGroupDmResult(:final title) => title,
    QuickSwitcherTextChannelResult(:final title) => title,
    QuickSwitcherVoiceChannelResult(:final title) => title,
    QuickSwitcherGuildResult(:final title) => title,
    QuickSwitcherVirtualGuildResult(:final title) => title,
    QuickSwitcherSettingsResult(:final title) => title,
    QuickSwitcherLinkResult(:final title) => title,
    QuickSwitcherHeaderResult(:final title) => title,
  };

  String? get _subtitle {
    final String? value = switch (result) {
      QuickSwitcherUserResult(:final subtitle) => subtitle,
      QuickSwitcherGroupDmResult(:final subtitle) => subtitle,
      QuickSwitcherTextChannelResult(:final subtitle) => subtitle,
      QuickSwitcherVoiceChannelResult(:final subtitle) => subtitle,
      QuickSwitcherGuildResult(:final subtitle) => subtitle,
      QuickSwitcherVirtualGuildResult(:final subtitle) => subtitle,
      QuickSwitcherSettingsResult(:final subtitle) => subtitle,
      QuickSwitcherLinkResult(:final subtitle) => subtitle,
      QuickSwitcherHeaderResult() => null,
    };
    return value == null || value.isEmpty ? null : value;
  }

  bool get _subtitleIsMeta =>
      result is QuickSwitcherTextChannelResult ||
      result is QuickSwitcherVoiceChannelResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isActive = ref.watch(
      quickSwitcherProvider.select(
        (QuickSwitcherState s) => s.selectedIndex == index,
      ),
    );
    final colors = context.colors;
    final textStyles = context.textStyles;
    final bool highlight = _isHighlight;
    final String? subtitle = _subtitle;
    final Color titleColor = highlight
        ? colors.textPrimary
        : colors.textSecondary;
    final TextStyle titleStyle = textStyles.label.copyWith(
      fontSize: 13,
      fontWeight: highlight ? FontWeight.w700 : FontWeight.w600,
      height: 16 / 13,
      color: titleColor,
    );
    final TextStyle subtitleStyle = textStyles.timestamp.copyWith(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: result is QuickSwitcherUserResult
          ? FontWeight.w300
          : FontWeight.w400,
      color: highlight ? colors.textPrimary : colors.textPrimaryMuted,
    );
    final TextStyle metaStyle = textStyles.timestamp.copyWith(
      fontSize: 12,
      height: 16 / 12,
      color: colors.textPrimaryMuted,
    );
    return MouseRegion(
      onEnter: (_) => onHover(),
      child: FluxerTappable(
        onTap: onTap,
        semanticLabel: _title,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          return Container(
            height: _kRowHeight,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: isActive
                  ? colors.backgroundModifierAccent
                  : Colors.transparent,
              borderRadius: context.layout.radiusSm,
            ),
            child: Row(
              children: <Widget>[
                SizedBox.square(
                  dimension: _kIconSize,
                  child: Center(child: _buildIcon(context, highlight)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          _title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle,
                        ),
                      ),
                      if (unreadState.mentionCount > 0) ...<Widget>[
                        const SizedBox(width: 6),
                        FluxerBadge.count(count: unreadState.mentionCount),
                      ],
                      if (subtitle != null && !_subtitleIsMeta) ...<Widget>[
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: subtitleStyle,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (subtitle != null && _subtitleIsMeta) ...<Widget>[
                  const SizedBox(width: 12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 160),
                    child: Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: metaStyle,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(BuildContext context, bool highlight) {
    final Color iconColor = highlight
        ? context.colors.textPrimary
        : context.colors.textPrimaryMuted;
    return switch (result) {
      QuickSwitcherUserResult(
        :final userId,
        :final avatar,
        :final avatarColor,
        :final title,
      ) =>
        FluxerAvatar.userPresence(
          fallbackText: title,
          userId: userId,
          imageUrl: FluxerMediaUrl.userAvatar(userId: userId, hash: avatar),
          avatarColor: avatarColor,
          size: _kIconSize,
        ),
      QuickSwitcherGroupDmResult(
        :final channelId,
        :final icon,
        :final groupMembers,
      ) =>
        GroupDmAvatar(
          iconUrl: FluxerMediaUrl.guildIcon(guildId: channelId, hash: icon),
          members: groupMembers,
          size: _kIconSize,
        ),
      QuickSwitcherTextChannelResult(:final channelType) => ChannelIcon(
        type: channelType,
        color: iconColor,
      ),
      QuickSwitcherVoiceChannelResult() => ChannelIcon(
        type: ChannelType.guildVoice,
        color: iconColor,
      ),
      QuickSwitcherGuildResult(:final guild) => FluxerGuildIconAvatar(
        name: guild.name,
        imageUrl: guild.iconUrl,
        isCircle: true,
        size: _kIconSize,
      ),
      QuickSwitcherVirtualGuildResult(:final virtualGuildType) => PhosphorIcon(
        virtualGuildType == QuickSwitcherVirtualGuildType.favorites
            ? PhosphorIconsFill.star
            : PhosphorIconsFill.house,
        size: 20,
        color: iconColor,
      ),
      QuickSwitcherSettingsResult(:final target) => PhosphorIcon(
        switch (target) {
          QuickSwitcherSettingsTarget.userSettings =>
            PhosphorIconsFill.userGear,
          QuickSwitcherSettingsTarget.notifications => PhosphorIconsFill.bell,
          QuickSwitcherSettingsTarget.bookmarks => PhosphorIconsFill.bookmark,
          QuickSwitcherSettingsTarget.mentions => PhosphorIconsFill.at,
        },
        size: 20,
        color: iconColor,
      ),
      QuickSwitcherLinkResult() => PhosphorIcon(
        PhosphorIconsBold.arrowRight,
        size: 20,
        color: iconColor,
      ),
      QuickSwitcherHeaderResult() => const SizedBox.shrink(),
    };
  }
}
