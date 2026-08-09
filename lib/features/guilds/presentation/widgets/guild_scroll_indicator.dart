import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator_selection.dart';

enum GuildScrollIndicatorSeverity { unread, mention }

typedef GuildScrollIndicatorState = ({
  bool show,
  GuildScrollIndicatorSeverity severity,
  String? targetId,
});

const GuildScrollIndicatorState _hiddenGuildScrollIndicatorState = (
  show: false,
  severity: GuildScrollIndicatorSeverity.unread,
  targetId: null,
);

class GuildScrollIndicatorController {
  GuildScrollIndicatorController({
    required this._scrollController,
    required this._itemKeys,
    required this._resolveSeverity,
    this._isMounted,
    this._hideTopWhen,
  });

  static const double _scrollDirectionEpsilon = 0.5;

  final ScrollController _scrollController;
  final Map<String, GlobalKey> _itemKeys;
  final GuildScrollIndicatorSeverity? Function(String itemId) _resolveSeverity;
  final bool Function()? _isMounted;
  final bool Function(double scrollOffset)? _hideTopWhen;

  final ValueNotifier<GuildScrollIndicatorState> topIndicator = ValueNotifier(
    _hiddenGuildScrollIndicatorState,
  );
  final ValueNotifier<GuildScrollIndicatorState> bottomIndicator =
      ValueNotifier(_hiddenGuildScrollIndicatorState);

  bool _updateScheduled = false;
  double _lastScrollOffset = 0;
  GuildScrollIndicatorEdge? _preferredEdge;
  GuildScrollIndicatorEdge? _lastEdge;

  void attach() {
    _scrollController.addListener(_onScroll);
  }

  void detach() {
    _scrollController.removeListener(_onScroll);
    topIndicator.dispose();
    bottomIndicator.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final double currentOffset = _scrollController.offset;
      if (currentOffset > _lastScrollOffset + _scrollDirectionEpsilon) {
        _preferredEdge = GuildScrollIndicatorEdge.bottom;
      } else if (currentOffset < _lastScrollOffset - _scrollDirectionEpsilon) {
        _preferredEdge = GuildScrollIndicatorEdge.top;
      }
      _lastScrollOffset = currentOffset;
    }
    scheduleUpdate();
  }

  void scheduleUpdate() {
    if (_updateScheduled) {
      return;
    }
    _updateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScheduled = false;
      update();
    });
  }

  void update() {
    final bool Function()? isMounted = _isMounted;
    if (isMounted != null && !isMounted()) {
      return;
    }
    if (!_scrollController.hasClients) {
      return;
    }
    final ScrollPosition scrollPosition = _scrollController.position;
    final RenderBox? scrollableRenderObject = _laidOutBox(
      scrollPosition.context.storageContext,
    );
    if (scrollableRenderObject == null) {
      return;
    }
    final double scrollableTop = scrollableRenderObject
        .localToGlobal(Offset.zero)
        .dy;
    final double scrollableBottom =
        scrollableTop + scrollPosition.viewportDimension;
    GuildScrollIndicatorCandidate? topCandidate;
    GuildScrollIndicatorCandidate? bottomCandidate;
    var order = 0;
    for (final MapEntry<String, GlobalKey> entry in _itemKeys.entries) {
      final GuildScrollIndicatorSeverity? severity = _resolveSeverity(
        entry.key,
      );
      if (severity == null) {
        order++;
        continue;
      }
      final RenderBox? itemBox = _laidOutBox(entry.value.currentContext);
      if (itemBox == null) {
        order++;
        continue;
      }
      final double itemTop = itemBox.localToGlobal(Offset.zero).dy;
      final double itemBottom = itemTop + itemBox.size.height;
      if (itemBottom <=
          scrollableTop + kGuildScrollIndicatorVisibilityEpsilon) {
        final GuildScrollIndicatorCandidate candidate = (
          id: entry.key,
          severity: severity,
          distance: (scrollableTop - itemBottom).clamp(0, double.infinity),
          order: order,
        );
        if (_isBetterCandidate(candidate, topCandidate)) {
          topCandidate = candidate;
        }
      } else if (itemTop >=
          scrollableBottom - kGuildScrollIndicatorVisibilityEpsilon) {
        final GuildScrollIndicatorCandidate candidate = (
          id: entry.key,
          severity: severity,
          distance: (itemTop - scrollableBottom).clamp(0, double.infinity),
          order: order,
        );
        if (_isBetterCandidate(candidate, bottomCandidate)) {
          bottomCandidate = candidate;
        }
      }
      order++;
    }
    GuildScrollIndicatorSelection? selection = selectGuildScrollIndicator(
      topCandidate: topCandidate,
      bottomCandidate: bottomCandidate,
      preferredEdge: _preferredEdge,
      previousEdge: _lastEdge,
    );
    final bool hideTop = _hideTopWhen?.call(scrollPosition.pixels) ?? false;
    if (selection?.edge == GuildScrollIndicatorEdge.top && hideTop) {
      selection = bottomCandidate != null
          ? (edge: GuildScrollIndicatorEdge.bottom, candidate: bottomCandidate)
          : null;
    }
    topIndicator.value = _hiddenGuildScrollIndicatorState;
    bottomIndicator.value = _hiddenGuildScrollIndicatorState;
    if (selection != null) {
      final GuildScrollIndicatorState state = (
        show: true,
        severity: selection.candidate.severity,
        targetId: selection.candidate.id,
      );
      if (selection.edge == GuildScrollIndicatorEdge.top) {
        topIndicator.value = state;
      } else {
        bottomIndicator.value = state;
      }
      _lastEdge = selection.edge;
    }
  }

  void scrollTo(String? itemId) {
    if (itemId == null) {
      return;
    }
    final BuildContext? context = _itemKeys[itemId]?.currentContext;
    if (context == null) {
      return;
    }
    unawaited(
      Scrollable.ensureVisible(
        context,
        duration: context.motion.panel,
        curve: Curves.easeOut,
      ),
    );
  }

  static RenderBox? _laidOutBox(BuildContext? context) {
    final RenderObject? renderObject = context?.findRenderObject();
    if (renderObject is! RenderBox || !_isLaidOut(renderObject)) {
      return null;
    }
    return renderObject;
  }

  static bool _isLaidOut(RenderObject renderObject) {
    RenderObject? current = renderObject;
    while (current != null) {
      if (!current.attached) {
        return false;
      }
      if (current is RenderBox && !current.hasSize) {
        return false;
      }
      current = current.parent;
    }
    return true;
  }

  static bool _isBetterCandidate(
    GuildScrollIndicatorCandidate candidate,
    GuildScrollIndicatorCandidate? current,
  ) {
    if (current == null) {
      return true;
    }
    final int candidateSeverity =
        candidate.severity == GuildScrollIndicatorSeverity.mention ? 2 : 1;
    final int currentSeverity =
        current.severity == GuildScrollIndicatorSeverity.mention ? 2 : 1;
    if (candidateSeverity != currentSeverity) {
      return candidateSeverity > currentSeverity;
    }
    if (candidate.distance != current.distance) {
      return candidate.distance < current.distance;
    }
    return candidate.order < current.order;
  }
}

class GuildScrollIndicatorLayer extends StatelessWidget {
  const GuildScrollIndicatorLayer({
    required this.controller,
    required this.label,
    required this.child,
    this.topInset = 8,
    this.bottomInset = 8,
    super.key,
  });

  final GuildScrollIndicatorController controller;
  final String label;
  final Widget child;
  final double topInset;
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: topInset,
          left: 0,
          right: 0,
          child: Center(
            child: _GuildScrollIndicatorPill(
              stateListenable: controller.topIndicator,
              label: label,
              slideUp: true,
              onTap: controller.scrollTo,
            ),
          ),
        ),
        Positioned(
          bottom: bottomInset,
          left: 0,
          right: 0,
          child: Center(
            child: _GuildScrollIndicatorPill(
              stateListenable: controller.bottomIndicator,
              label: label,
              slideUp: false,
              onTap: controller.scrollTo,
            ),
          ),
        ),
      ],
    );
  }
}

class _GuildScrollIndicatorPill extends StatelessWidget {
  const _GuildScrollIndicatorPill({
    required this.stateListenable,
    required this.label,
    required this.slideUp,
    required this.onTap,
  });

  final ValueListenable<GuildScrollIndicatorState> stateListenable;
  final String label;
  final bool slideUp;
  final void Function(String? targetId) onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GuildScrollIndicatorState>(
      valueListenable: stateListenable,
      builder: (BuildContext context, GuildScrollIndicatorState state, _) {
        return IgnorePointer(
          ignoring: !state.show,
          child: AnimatedSlide(
            offset: Offset(0, state.show ? 0 : (slideUp ? -1 : 1)),
            duration: context.motion.normal,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: state.show ? 1.0 : 0.0,
              duration: context.motion.normal,
              child: GuildScrollIndicator(
                severity: state.severity,
                label: label,
                onTap: () => onTap(state.targetId),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GuildScrollIndicator extends StatelessWidget {
  const GuildScrollIndicator({
    required this.severity,
    required this.onTap,
    required this.label,
    super.key,
  });

  final GuildScrollIndicatorSeverity severity;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color bgColor = switch (severity) {
      GuildScrollIndicatorSeverity.mention => colors.statusDanger,
      GuildScrollIndicatorSeverity.unread => colors.textSecondary.withValues(
        alpha: 0.6,
      ),
    };
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(999),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.45),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.35),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Text(
          label,
          style: context.textStyles.smallText.copyWith(
            color: colors.textOnBrandPrimary,
            fontSize: 11,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
