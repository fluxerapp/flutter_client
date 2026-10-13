import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/locale_upper_case.dart';

enum GuildScrollIndicatorSeverity { unread, mention }

enum GuildScrollIndicatorEdge { top, bottom }

typedef GuildScrollIndicatorCandidate = ({
  String id,
  GuildScrollIndicatorSeverity severity,
  double distance,
  int order,
});

const double kGuildScrollIndicatorVisibilityEpsilon = 0.5;
const double kGuildScrollIndicatorEdgeInset = 8;
const double _kScrollTargetPadding = 12;
const double _kPillHitSlop = 10;
const double _kPillEnterOffset = 10;
const double _kPillHiddenScale = 0.96;
const Duration _kPillEnterDuration = Duration(milliseconds: 180);
const Duration _kPillLeaveDuration = Duration(milliseconds: 160);
const Color _kUnreadPillColor = Color(0xFF484B51);

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

typedef _GuildScrollIndicatorBox = ({double top, double bottom});

typedef _GuildScrollIndicatorLayout = ({
  double scrollableTop,
  double scrollableBottom,
  List<String> ids,
  List<_GuildScrollIndicatorBox?> boxes,
  int firstLaidOut,
  int lastLaidOut,
  double averageHeight,
});

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
  static const int _maxScrollToUnbuiltAttempts = 3;

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

  bool get _canMeasure {
    final bool Function()? isMounted = _isMounted;
    if (isMounted != null && !isMounted()) {
      return false;
    }
    return _scrollController.hasClients;
  }

  _GuildScrollIndicatorLayout? _measure() {
    final ScrollPosition scrollPosition = _scrollController.position;
    final RenderBox? scrollableRenderObject = _laidOutBox(
      scrollPosition.context.storageContext,
    );
    if (scrollableRenderObject == null) {
      return null;
    }
    final double scrollableTop = scrollableRenderObject
        .localToGlobal(Offset.zero)
        .dy;
    final List<String> ids =
        _orderedIds?.call() ?? _itemKeys.keys.toList(growable: false);
    final List<_GuildScrollIndicatorBox?> boxes =
        List<_GuildScrollIndicatorBox?>.filled(ids.length, null);
    int firstLaidOut = -1;
    int lastLaidOut = -1;
    int laidOutCount = 0;
    double heightSum = 0;
    for (var i = 0; i < ids.length; i++) {
      final RenderBox? itemBox = _laidOutBox(_itemKeys[ids[i]]?.currentContext);
      if (itemBox == null) {
        continue;
      }
      final double top = itemBox.localToGlobal(Offset.zero).dy;
      boxes[i] = (top: top, bottom: top + itemBox.size.height);
      heightSum += itemBox.size.height;
      laidOutCount++;
      if (firstLaidOut < 0) {
        firstLaidOut = i;
      }
      lastLaidOut = i;
    }
    return (
      scrollableTop: scrollableTop,
      scrollableBottom: scrollableTop + scrollPosition.viewportDimension,
      ids: ids,
      boxes: boxes,
      firstLaidOut: firstLaidOut,
      lastLaidOut: lastLaidOut,
      averageHeight: laidOutCount == 0 ? 0 : heightSum / laidOutCount,
    );
  }

  void update() {
    if (!_canMeasure) {
      return;
    }
    final _GuildScrollIndicatorLayout? layout = _measure();
    if (layout == null) {
      return;
    }
    final ScrollPosition scrollPosition = _scrollController.position;
    final (
      :double scrollableTop,
      :double scrollableBottom,
      :List<String> ids,
      :List<_GuildScrollIndicatorBox?> boxes,
      :int firstLaidOut,
      :int lastLaidOut,
      :double averageHeight,
    ) = layout;
    final bool placeUnbuilt = _orderedIds != null && firstLaidOut >= 0;

    GuildScrollIndicatorCandidate? topCandidate;
    GuildScrollIndicatorCandidate? bottomCandidate;
    for (var i = 0; i < ids.length; i++) {
      final _GuildScrollIndicatorBox? box = boxes[i];
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
    final bool hideTop = _hideTopWhen?.call(scrollPosition.pixels) ?? false;
    final bool animate = _settled;
    _assign(topIndicator, hideTop ? null : topCandidate, animate);
    _assign(bottomIndicator, bottomCandidate, animate);
    _settled = true;
  }

  static void _assign(
    ValueNotifier<GuildScrollIndicatorState> notifier,
    GuildScrollIndicatorCandidate? candidate,
    bool animate,
  ) {
    final GuildScrollIndicatorState next = candidate == null
        ? (
            show: false,
            severity: notifier.value.severity,
            targetId: null,
            animate: animate,
          )
        : (
            show: true,
            severity: candidate.severity,
            targetId: candidate.id,
            animate: animate,
          );
    if (_sameIndicator(notifier.value, next)) {
      return;
    }
    notifier.value = next;
  }

  void scrollTo(
    String? itemId,
    GuildScrollIndicatorEdge edge, {
    double obstruction = 0,
  }) {
    if (itemId == null) {
      return;
    }
    unawaited(
      _scrollToward(itemId, edge, obstruction, _maxScrollToUnbuiltAttempts),
    );
  }

  Future<void> _scrollToward(
    String itemId,
    GuildScrollIndicatorEdge edge,
    double obstruction,
    int attemptsLeft,
  ) async {
    if (!_canMeasure) {
      return;
    }
    final ScrollPosition position = _scrollController.position;
    final RenderBox? target = _laidOutBox(_itemKeys[itemId]?.currentContext);
    if (target != null) {
      final RenderAbstractViewport viewport = RenderAbstractViewport.of(target);
      final double padding = obstruction + _kScrollTargetPadding;
      final double offset = switch (edge) {
        GuildScrollIndicatorEdge.top =>
          viewport.getOffsetToReveal(target, 0).offset - padding,
        GuildScrollIndicatorEdge.bottom =>
          viewport.getOffsetToReveal(target, 1).offset + padding,
      };
      await _animateTo(position, offset);
      return;
    }
    if (attemptsLeft == 0) {
      return;
    }
    final double? offset = _estimatedOffsetOf(itemId);
    if (offset == null) {
      return;
    }
    await _animateTo(position, offset);
    await WidgetsBinding.instance.endOfFrame;
    await _scrollToward(itemId, edge, obstruction, attemptsLeft - 1);
  }

  static Future<void> _animateTo(ScrollPosition position, double offset) async {
    final double clamped = offset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    final Duration duration = position.context.storageContext.motion.panel;
    if (duration == Duration.zero) {
      position.jumpTo(clamped);
      return;
    }
    await position.animateTo(
      clamped,
      duration: duration,
      curve: Curves.easeOut,
    );
  }

  double? _estimatedOffsetOf(String itemId) {
    final _GuildScrollIndicatorLayout? layout = _measure();
    if (layout == null || layout.firstLaidOut < 0) {
      return null;
    }
    final int index = layout.ids.indexOf(itemId);
    final double estimatedTop;
    if (index > layout.lastLaidOut) {
      estimatedTop =
          layout.boxes[layout.lastLaidOut]!.bottom +
          (index - layout.lastLaidOut - 1) * layout.averageHeight;
    } else if (index >= 0 && index < layout.firstLaidOut) {
      estimatedTop =
          layout.boxes[layout.firstLaidOut]!.top -
          (layout.firstLaidOut - index) * layout.averageHeight;
    } else {
      return null;
    }
    final ScrollPosition position = _scrollController.position;
    final double offset =
        (position.pixels + estimatedTop - layout.scrollableTop).clamp(
          position.minScrollExtent,
          position.maxScrollExtent,
        );
    if ((offset - position.pixels).abs() < _scrollDirectionEpsilon) {
      return null;
    }
    return offset;
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
    this.animated = true,
    this.topInset = kGuildScrollIndicatorEdgeInset,
    this.bottomInset = kGuildScrollIndicatorEdgeInset,
    super.key,
  });

  final GuildScrollIndicatorController controller;
  final String label;
  final Widget child;
  final bool animated;
  final double topInset;
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: topInset - _kPillHitSlop,
          left: 0,
          right: 0,
          child: Center(
            child: _GuildScrollIndicatorPill(
              stateListenable: controller.topIndicator,
              label: label,
              edge: GuildScrollIndicatorEdge.top,
              animated: animated,
              onTap: (String? targetId) => controller.scrollTo(
                targetId,
                GuildScrollIndicatorEdge.top,
                obstruction: topInset - kGuildScrollIndicatorEdgeInset,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: bottomInset - _kPillHitSlop,
          left: 0,
          right: 0,
          child: Center(
            child: _GuildScrollIndicatorPill(
              stateListenable: controller.bottomIndicator,
              label: label,
              edge: GuildScrollIndicatorEdge.bottom,
              animated: animated,
              onTap: (String? targetId) => controller.scrollTo(
                targetId,
                GuildScrollIndicatorEdge.bottom,
                obstruction: bottomInset - kGuildScrollIndicatorEdgeInset,
              ),
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
    required this.edge,
    required this.animated,
    required this.onTap,
  });

  final ValueListenable<GuildScrollIndicatorState> stateListenable;
  final String label;
  final GuildScrollIndicatorEdge edge;
  final bool animated;
  final void Function(String? targetId) onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GuildScrollIndicatorState>(
      valueListenable: stateListenable,
      builder: (BuildContext context, GuildScrollIndicatorState state, _) {
        final bool animate =
            animated && state.animate && context.motion.normal != Duration.zero;
        final Duration duration = !animate
            ? Duration.zero
            : state.show
            ? _kPillEnterDuration
            : _kPillLeaveDuration;
        final Curve curve = state.show
            ? Curves.easeOutCubic
            : Curves.easeInOutQuad;
        final double direction = edge == GuildScrollIndicatorEdge.top ? -1 : 1;
        return IgnorePointer(
          ignoring: !state.show,
          child: AnimatedSlide(
            offset: Offset(0, state.show ? 0 : direction * _kPillHiddenSlide),
            duration: duration,
            curve: curve,
            child: AnimatedScale(
              scale: state.show ? 1 : _kPillHiddenScale,
              duration: duration,
              curve: curve,
              child: AnimatedOpacity(
                opacity: state.show ? 1.0 : 0.0,
                duration: duration,
                curve: curve,
                child: GuildScrollIndicator(
                  severity: state.severity,
                  label: label,
                  onTap: () => onTap(state.targetId),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const double _kPillHeight = 24;
const double _kPillHiddenSlide =
    _kPillEnterOffset / (_kPillHeight + 2 * _kPillHitSlop);

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
    final Color background = switch (severity) {
      GuildScrollIndicatorSeverity.mention => context.colors.statusDanger,
      GuildScrollIndicatorSeverity.unread => _kUnreadPillColor,
    };
    return FluxerGestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: _kPillHitSlop),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(999),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.75),
                blurRadius: 20,
                spreadRadius: -12,
                offset: Offset(0, 10),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.45),
                blurRadius: 6,
                spreadRadius: -2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            localeUpperCase(context, label),
            maxLines: 1,
            style: context.textStyles.smallText.copyWith(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 16 / 11,
              letterSpacing: 0.275,
            ),
          ),
        ),
      ),
    );
  }
}
