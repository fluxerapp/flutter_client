import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildSidebarSkeleton extends StatelessWidget {
  const GuildSidebarSkeleton({super.key});

  static const List<int> _fallbackCategoryChannelCounts = <int>[3, 5, 4, 6];
  static const List<double> _channelLabelWidths = <double>[
    88,
    104,
    72,
    96,
    112,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 12),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (
          var categoryIndex = 0;
          categoryIndex < _fallbackCategoryChannelCounts.length;
          categoryIndex++
        )
          _GuildSidebarCategoryGroupSkeleton(
            channelCount: _fallbackCategoryChannelCounts[categoryIndex],
            categoryIndex: categoryIndex,
          ),
      ],
    );
  }
}

class _GuildSidebarCategoryGroupSkeleton extends StatelessWidget {
  const _GuildSidebarCategoryGroupSkeleton({
    required this.channelCount,
    required this.categoryIndex,
  });

  final int channelCount;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _GuildSidebarCategorySkeleton(
          labelWidth: 72 + (categoryIndex % 3) * 16,
        ),
        for (var channelIndex = 0; channelIndex < channelCount; channelIndex++)
          _GuildSidebarChannelSkeleton(
            labelWidth:
                GuildSidebarSkeleton._channelLabelWidths[(categoryIndex +
                        channelIndex) %
                    GuildSidebarSkeleton._channelLabelWidths.length],
          ),
      ],
    );
  }
}

class _GuildSidebarSkeletonBar extends StatelessWidget {
  const _GuildSidebarSkeletonBar({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _GuildSidebarCategorySkeleton extends StatelessWidget {
  const _GuildSidebarCategorySkeleton({required this.labelWidth});

  final double labelWidth;

  static const double _lineHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 8, top: 16, bottom: 4),
      child: SizedBox(
        height: _lineHeight,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: _GuildSidebarSkeletonBar(width: labelWidth, height: 10),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondaryAlt,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GuildSidebarChannelSkeleton extends StatelessWidget {
  const _GuildSidebarChannelSkeleton({required this.labelWidth});

  final double labelWidth;

  static const double _iconSize = 20;
  static const double _labelHeight = 16;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: <Widget>[
            Container(
              width: _iconSize,
              height: _iconSize,
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondaryAlt,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
            _GuildSidebarSkeletonBar(width: labelWidth, height: _labelHeight),
          ],
        ),
      ),
    );
  }
}
