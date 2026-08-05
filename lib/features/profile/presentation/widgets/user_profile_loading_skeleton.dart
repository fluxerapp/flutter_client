import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const double _kBannerHeight = 184;
const double _kAvatarSize = 80;
const double _kAvatarOverlap = _kAvatarSize / 2;

class UserProfileLoadingSkeleton extends StatefulWidget {
  const UserProfileLoadingSkeleton({
    required this.scrollController,
    this.showTopHandle = false,
    super.key,
  });

  final ScrollController scrollController;
  final bool showTopHandle;

  @override
  State<UserProfileLoadingSkeleton> createState() =>
      _UserProfileLoadingSkeletonState();
}

class _UserProfileLoadingSkeletonState extends State<UserProfileLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _pulseAnimation =
        TweenSequence<double>(<TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 1, end: 0.65),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0.65, end: 1),
            weight: 50,
          ),
        ]).animate(
          CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
        );
    _pulseController.repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) {
      _pulseController.stop();
    } else if (!_pulseController.isAnimating) {
      _pulseController.repeat();
    }

    return Semantics(
      label: l10n.userProfileLoading,
      child: ExcludeSemantics(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundPrimary,
            borderRadius: BorderRadius.vertical(top: layout.radiusXxl.topLeft),
          ),
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: reduceMotion ? 1 : _pulseAnimation.value,
                child: child,
              );
            },
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: _kBannerHeight + _kAvatarOverlap,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: _kBannerHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: layout.radiusXxl.topLeft,
                            ),
                            child: const _ProfileSkeletonShape(
                              height: _kBannerHeight,
                              width: double.infinity,
                              borderRadius: BorderRadius.zero,
                              strong: true,
                            ),
                          ),
                        ),
                        if (widget.showTopHandle)
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.only(top: layout.s3),
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(9999),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          left: layout.s4,
                          top: _kBannerHeight - _kAvatarOverlap,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.backgroundPrimary,
                            ),
                            child: const _ProfileSkeletonShape(
                              width: _kAvatarSize,
                              height: _kAvatarSize,
                              shape: BoxShape.circle,
                              strong: true,
                            ),
                          ),
                        ),
                        Positioned(
                          right: layout.s4,
                          top: _kBannerHeight + layout.s2,
                          child: Row(
                            children: <Widget>[
                              _ProfileSkeletonShape(
                                width: 32,
                                height: 32,
                                borderRadius: BorderRadius.circular(9999),
                              ),
                              SizedBox(width: layout.s2),
                              _ProfileSkeletonShape(
                                width: 32,
                                height: 32,
                                borderRadius: BorderRadius.circular(9999),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    layout.s2,
                    layout.s4,
                    layout.s4 +
                        FluxerBottomSheet.scrollBottomPaddingOf(context),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate.fixed(<Widget>[
                      const _ProfileSkeletonLine(height: 22, widthFactor: 0.72),
                      SizedBox(height: layout.s1),
                      const _ProfileSkeletonLine(height: 14, widthFactor: 0.48),
                      SizedBox(height: layout.s1),
                      const _ProfileSkeletonLine(height: 16, widthFactor: 0.78),
                      SizedBox(height: layout.s4),
                      const _ProfileSkeletonShape(
                        height: 48,
                        width: double.infinity,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      SizedBox(height: layout.s4),
                      _ProfileSkeletonSection(layout: layout),
                      SizedBox(height: layout.s4),
                      _ProfileSkeletonSection(layout: layout, lineCount: 2),
                      SizedBox(height: layout.s4),
                      const _ProfileSkeletonPillRow(
                        pillWidths: <double>[68, 58, 72],
                        pillHeight: 22,
                      ),
                      SizedBox(height: layout.s4),
                      const _ProfileSkeletonPillRow(
                        pillWidths: <double>[30, 30, 30],
                        pillHeight: 30,
                        pillRadius: 6,
                      ),
                      SizedBox(height: layout.s4),
                      Row(
                        spacing: 10,
                        children: List<Widget>.generate(
                          3,
                          (_) => const Expanded(
                            child: _ProfileSkeletonShape(
                              height: 72,
                              width: double.infinity,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: layout.s4),
                      _ProfileSkeletonSection(layout: layout),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileSkeletonSection extends StatelessWidget {
  const _ProfileSkeletonSection({required this.layout, this.lineCount = 3});

  final FluxerLayoutTheme layout;
  final int lineCount;

  static const List<double> _lineWidthFactors = <double>[0.92, 0.74, 0.54];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: layout.radiusXl,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const _ProfileSkeletonLine(height: 14, widthFactor: 0.34),
            SizedBox(height: layout.s2),
            for (int index = 0; index < lineCount; index++) ...<Widget>[
              _ProfileSkeletonLine(
                height: 12,
                widthFactor: _lineWidthFactors[index],
              ),
              if (index < lineCount - 1) SizedBox(height: layout.s1),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProfileSkeletonPillRow extends StatelessWidget {
  const _ProfileSkeletonPillRow({
    required this.pillWidths,
    required this.pillHeight,
    this.pillRadius = 9999,
  });

  final List<double> pillWidths;
  final double pillHeight;
  final double pillRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: pillWidths
          .map(
            (double width) => _ProfileSkeletonShape(
              width: width,
              height: pillHeight,
              borderRadius: BorderRadius.circular(pillRadius),
            ),
          )
          .toList(growable: false),
    );
  }
}

class _ProfileSkeletonLine extends StatelessWidget {
  const _ProfileSkeletonLine({required this.height, required this.widthFactor});

  final double height;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: Alignment.centerLeft,
      child: _ProfileSkeletonShape(
        height: height,
        width: double.infinity,
        borderRadius: BorderRadius.circular(9999),
      ),
    );
  }
}

class _ProfileSkeletonShape extends StatelessWidget {
  const _ProfileSkeletonShape({
    this.width,
    this.height,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.strong = false,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final bool strong;

  @override
  Widget build(BuildContext context) {
    final Color fill = strong
        ? context.colors.backgroundTertiary
        : context.colors.backgroundSecondaryAlt;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fill,
        shape: shape,
        borderRadius: shape == BoxShape.circle ? null : borderRadius,
      ),
    );
  }
}
