import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

enum ScrollIndicatorSeverity { unread, mention }

typedef UnreadScrollIndicatorView = ({
  bool show,
  ScrollIndicatorSeverity severity,
  String? targetId,
});

const UnreadScrollIndicatorView _hiddenUnreadScrollIndicator = (
  show: false,
  severity: ScrollIndicatorSeverity.unread,
  targetId: null,
);

class UnreadScrollIndicatorController {
  UnreadScrollIndicatorController({
    required ScrollController scrollController,
    required Map<String, GlobalKey> itemKeys,
    required ScrollIndicatorSeverity? Function(String itemId) resolveSeverity,
    bool Function()? isMounted,
    bool Function(double scrollOffset)? hideTopWhen,
  }) : _scrollController = scrollController,
       _itemKeys = itemKeys,
       _resolveSeverity = resolveSeverity,
       _isMounted = isMounted,
       _hideTopWhen = hideTopWhen;

  final ScrollController _scrollController;
  final Map<String, GlobalKey> _itemKeys;
  final ScrollIndicatorSeverity? Function(String itemId) _resolveSeverity;
  final bool Function()? _isMounted;
  final bool Function(double scrollOffset)? _hideTopWhen;

  final ValueNotifier<UnreadScrollIndicatorView> topIndicator = ValueNotifier(
    _hiddenUnreadScrollIndicator,
  );
  final ValueNotifier<UnreadScrollIndicatorView> bottomIndicator =
      ValueNotifier(_hiddenUnreadScrollIndicator);

  bool _updateScheduled = false;

  void attach() {
    _scrollController.addListener(scheduleUpdate);
  }

  void detach() {
    _scrollController.removeListener(scheduleUpdate);
    topIndicator.dispose();
    bottomIndicator.dispose();
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
    var showTop = false;
    var showBottom = false;
    var topSeverity = ScrollIndicatorSeverity.unread;
    var bottomSeverity = ScrollIndicatorSeverity.unread;
    String? topTarget;
    String? bottomTarget;
    var topDistance = double.infinity;
    var bottomDistance = double.infinity;
    for (final MapEntry<String, GlobalKey> entry in _itemKeys.entries) {
      final ScrollIndicatorSeverity? severity = _resolveSeverity(entry.key);
      if (severity == null) {
        continue;
      }
      final RenderObject? renderObject = entry.value.currentContext
          ?.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.attached) {
        continue;
      }
      final BuildContext scrollableContext =
          scrollPosition.context.storageContext;
      final RenderBox scrollableRenderObject =
          scrollableContext.findRenderObject()! as RenderBox;
      final double scrollableTop = scrollableRenderObject
          .localToGlobal(Offset.zero)
          .dy;
      final double scrollableBottom =
          scrollableTop + scrollPosition.viewportDimension;
      final double itemTop = renderObject.localToGlobal(Offset.zero).dy;
      final double itemBottom = itemTop + renderObject.size.height;
      if (itemBottom < scrollableTop) {
        final double distance = scrollableTop - itemBottom;
        if (_shouldReplaceCandidate(
          hasCandidate: showTop,
          candidateSeverity: topSeverity,
          candidateDistance: topDistance,
          severity: severity,
          distance: distance,
        )) {
          showTop = true;
          topSeverity = severity;
          topTarget = entry.key;
          topDistance = distance;
        }
      } else if (itemTop > scrollableBottom) {
        final double distance = itemTop - scrollableBottom;
        if (_shouldReplaceCandidate(
          hasCandidate: showBottom,
          candidateSeverity: bottomSeverity,
          candidateDistance: bottomDistance,
          severity: severity,
          distance: distance,
        )) {
          showBottom = true;
          bottomSeverity = severity;
          bottomTarget = entry.key;
          bottomDistance = distance;
        }
      }
    }
    final bool hideTop = _hideTopWhen?.call(scrollPosition.pixels) ?? false;
    topIndicator.value = (
      show: showTop && !hideTop,
      severity: topSeverity,
      targetId: topTarget,
    );
    bottomIndicator.value = (
      show: showBottom,
      severity: bottomSeverity,
      targetId: bottomTarget,
    );
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
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
    );
  }

  static bool _shouldReplaceCandidate({
    required bool hasCandidate,
    required ScrollIndicatorSeverity candidateSeverity,
    required double candidateDistance,
    required ScrollIndicatorSeverity severity,
    required double distance,
  }) {
    if (!hasCandidate) {
      return true;
    }
    final int severityPriority = severity == ScrollIndicatorSeverity.mention
        ? 2
        : 1;
    final int candidatePriority =
        candidateSeverity == ScrollIndicatorSeverity.mention ? 2 : 1;
    if (severityPriority > candidatePriority) {
      return true;
    }
    if (severityPriority < candidatePriority) {
      return false;
    }
    return distance < candidateDistance;
  }
}

class UnreadScrollIndicatorLayer extends StatelessWidget {
  const UnreadScrollIndicatorLayer({
    required this.controller,
    required this.label,
    required this.child,
    this.topInset = 8,
    this.bottomInset = 8,
    super.key,
  });

  final UnreadScrollIndicatorController controller;
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
            child: _UnreadScrollIndicatorPill(
              viewListenable: controller.topIndicator,
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
            child: _UnreadScrollIndicatorPill(
              viewListenable: controller.bottomIndicator,
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

class _UnreadScrollIndicatorPill extends StatelessWidget {
  const _UnreadScrollIndicatorPill({
    required this.viewListenable,
    required this.label,
    required this.slideUp,
    required this.onTap,
  });

  final ValueListenable<UnreadScrollIndicatorView> viewListenable;
  final String label;
  final bool slideUp;
  final void Function(String? targetId) onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UnreadScrollIndicatorView>(
      valueListenable: viewListenable,
      builder: (BuildContext context, UnreadScrollIndicatorView view, _) {
        return IgnorePointer(
          ignoring: !view.show,
          child: AnimatedSlide(
            offset: Offset(0, view.show ? 0 : (slideUp ? -1 : 1)),
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: view.show ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 150),
              child: GuildScrollIndicator(
                severity: view.severity,
                label: label,
                onTap: () => onTap(view.targetId),
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

  final ScrollIndicatorSeverity severity;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color bgColor = switch (severity) {
      ScrollIndicatorSeverity.mention => colors.statusDanger,
      ScrollIndicatorSeverity.unread => colors.textSecondary.withValues(
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
          style: TextStyle(
            color: colors.textOnBrandPrimary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
