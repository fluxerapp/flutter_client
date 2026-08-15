import 'dart:ui' show clampDouble;

import 'package:flutter/cupertino.dart'
    show CupertinoSliverRefreshControl, RefreshIndicatorMode;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:material_ui/material_ui.dart';

/// [CustomScrollView] with pull-to-refresh using [FluxerLoadingSpinner].
///
/// Uses [CupertinoSliverRefreshControl]; content must be passed as [slivers].
class FluxerRefreshScrollView extends StatelessWidget {
  const FluxerRefreshScrollView({
    required this.onRefresh,
    required this.slivers,
    super.key,
    this.controller,
    this.spinnerColor,
  });

  final Future<void> Function() onRefresh;
  final List<Widget> slivers;
  final ScrollController? controller;
  final Color? spinnerColor;

  static Widget buildSpinnerIndicator({
    required RefreshIndicatorMode refreshState,
    required double pulledExtent,
    required double refreshTriggerPullDistance,
    required double refreshIndicatorExtent,
    required Color spinnerColor,
  }) {
    const double topMargin = 16;
    final double percentageComplete = clampDouble(
      pulledExtent / refreshTriggerPullDistance,
      0,
      1,
    );
    switch (refreshState) {
      case RefreshIndicatorMode.inactive:
        return const SizedBox.shrink();
      case RefreshIndicatorMode.drag:
        const Curve opacityCurve = Interval(0, 0.35, curve: Curves.easeInOut);
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: topMargin,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: opacityCurve.transform(percentageComplete),
                  child: FluxerLoadingSpinner(color: spinnerColor),
                ),
              ),
            ],
          ),
        );
      case RefreshIndicatorMode.armed:
      case RefreshIndicatorMode.refresh:
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: topMargin,
                left: 0,
                right: 0,
                child: FluxerLoadingSpinner(color: spinnerColor),
              ),
            ],
          ),
        );
      case RefreshIndicatorMode.done:
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: topMargin,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: percentageComplete,
                  child: FluxerLoadingSpinner(color: spinnerColor),
                ),
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = spinnerColor ?? context.colors.brandPrimary;
    return CustomScrollView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
          builder:
              (
                BuildContext context,
                RefreshIndicatorMode refreshState,
                double pulledExtent,
                double refreshTriggerPullDistance,
                double refreshIndicatorExtent,
              ) {
                return buildSpinnerIndicator(
                  refreshState: refreshState,
                  pulledExtent: pulledExtent,
                  refreshTriggerPullDistance: refreshTriggerPullDistance,
                  refreshIndicatorExtent: refreshIndicatorExtent,
                  spinnerColor: color,
                );
              },
        ),
        ...slivers,
      ],
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerRefreshScrollView')
Widget fluxerRefreshScrollViewPreview() {
  return SizedBox(
    height: 220,
    width: 280,
    child: ColoredBox(
      color: const Color(0xFF2B2D31),
      child: FluxerRefreshScrollView(
        spinnerColor: const Color(0xFF5865F2),
        onRefresh: () async {
          await Future<void>.delayed(const Duration(seconds: 1));
        },
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List<Widget>.generate(
                  8,
                  (int i) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Builder(
                      builder: (BuildContext context) => Text(
                        'Pull from top — row ${i + 1}',
                        style: context.textStyles.bodyMedium.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
