import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator_selection.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

enum GuildScrollIndicatorSeverity { unread, mention }

typedef GuildScrollIndicatorState = ({
  bool show,
  GuildScrollIndicatorSeverity severity,
  String? targetId,
  bool animate,
});

const GuildScrollIndicatorState _hiddenGuildScrollIndicatorState = (
  show: false,
  severity: GuildScrollIndicatorSeverity.unread,
  targetId: null,
  animate: false,
);

bool _sameIndicator(GuildScrollIndicatorState a, GuildScrollIndicatorState b) {
  return a.show == b.show &&
      a.severity == b.severity &&
      a.targetId == b.targetId;
}

class GuildScrollIndicatorController {
  GuildScrollIndicatorController({
    required this._scrollController,
    required this._itemKeys,
    required this._resolveSeverity,
    this._isMounted,
    this._hideTopWhen,
    this._orderedIds,
  });

  static const double _scrollDirectionEpsilon = 0.5;

  final ScrollController _scrollController;
  final Map<String, GlobalKey> _itemKeys;
  final GuildScrollIndicatorSeverity? Function(String itemId) _resolveSeverity;
  final bool Function()? _isMounted;
  final bool Function(double scrollOffset)? _hideTopWhen;

  final List<String> Function()? _orderedIds;

  final ValueNotifier<GuildScrollIndicatorState> topIndicator = ValueNotifier(
    _hiddenGuildScrollIndicatorState,
  );
  final ValueNotifier<GuildScrollIndicatorState> bottomIndicator =
      ValueNotifier(_hiddenGuildScrollIndicatorState);

  bool _updateScheduled = false;
  bool _settled = false;
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

  void resetAnimation() {
    _settled = false;
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
    final List<String> ids =
        _orderedIds?.call() ?? _itemKeys.keys.toList(growable: false);

    final List<({double top, double bottom})?> boxes =
        List<({double top, double bottom})?>.filled(ids.length, null);
    int firstLaidOut = -1;
    int lastLaidOut = -1;
    double heightSum = 0;
    for (var i = 0; i < ids.length; i++) {
      final RenderBox? itemBox = _laidOutBox(_itemKeys[ids[i]]?.currentContext);
      if (itemBox == null) {
        continue;
      }
      final double top = itemBox.localToGlobal(Offset.zero).dy;
      boxes[i] = (top: top, bottom: top + itemBox.size.height);
      heightSum += itemBox.size.height;
      if (firstLaidOut < 0) {
        firstLaidOut = i;
      }
      lastLaidOut = i;
    }
    final bool placeUnbuilt = _orderedIds != null && firstLaidOut >= 0;
    final double averageHeight = firstLaidOut < 0
        ? 0
        : heightSum /
              boxes
                  .where((({double top, double bottom})? b) => b != null)
                  .length;

    GuildScrollIndicatorCandidate? topCandidate;
    GuildScrollIndicatorCandidate? bottomCandidate;
    for (var i = 0; i < ids.length; i++) {
      final ({double top, double bottom})? box = boxes[i];
      final double distance;
      final bool above;
      if (box != null) {
        if (box.bottom <=
            scrollableTop + kGuildScrollIndicatorVisibilityEpsilon) {
          above = true;
          distance = scrollableTop - box.bottom;
        } else if (box.top >=
            scrollableBottom - kGuildScrollIndicatorVisibilityEpsilon) {
          above = false;
          distance = box.top - scrollableBottom;
        } else {
          continue;
        }
      } else if (placeUnbuilt && i < firstLaidOut) {
        above = true;
        distance =
            (scrollableTop - boxes[firstLaidOut]!.top).clamp(
              0,
              double.infinity,
            ) +
            (firstLaidOut - i) * averageHeight;
      } else if (placeUnbuilt && i > lastLaidOut) {
        above = false;
        distance =
            (boxes[lastLaidOut]!.bottom - scrollableBottom).clamp(
              0,
              double.infinity,
            ) +
            (i - lastLaidOut) * averageHeight;
      } else {
        continue;
      }
      final GuildScrollIndicatorSeverity? severity = _resolveSeverity(ids[i]);
      if (severity == null) {
        continue;
      }
      final GuildScrollIndicatorCandidate candidate = (
        id: ids[i],
        severity: severity,
        distance: distance.clamp(0, double.infinity),
        order: i,
      );
      if (above) {
        if (_isBetterCandidate(candidate, topCandidate)) {
          topCandidate = candidate;
        }
      } else if (_isBetterCandidate(candidate, bottomCandidate)) {
        bottomCandidate = candidate;
      }
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
    final bool animate = _settled;
    GuildScrollIndicatorState stateFor(GuildScrollIndicatorEdge edge) {
      if (selection == null || selection.edge != edge) {
        return (
          show: false,
          severity: GuildScrollIndicatorSeverity.unread,
          targetId: null,
          animate: animate,
        );
      }
      return (
        show: true,
        severity: selection.candidate.severity,
        targetId: selection.candidate.id,
        animate: animate,
      );
    }

    _assign(topIndicator, stateFor(GuildScrollIndicatorEdge.top));
    _assign(bottomIndicator, stateFor(GuildScrollIndicatorEdge.bottom));
    if (selection != null) {
      _lastEdge = selection.edge;
    }
    _settled = true;
  }

  static void _assign(
    ValueNotifier<GuildScrollIndicatorState> notifier,
    GuildScrollIndicatorState next,
  ) {
    if (_sameIndicator(notifier.value, next)) {
      return;
    }
    notifier.value = next;
  }

  void scrollTo(String? itemId) {
    if (itemId == null) {
      return;
    }
    final BuildContext? context = _itemKeys[itemId]?.currentContext;
    if (context == null) {
      return;
    }
    Scrollable.ensureVisible(
      context,
      duration: context.motion.panel,
      curve: Curves.easeOut,
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
            duration: state.animate ? context.motion.normal : Duration.zero,
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: state.show ? 1.0 : 0.0,
              duration: state.animate ? context.motion.normal : Duration.zero,
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
    return FluxerGestureDetector(
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
