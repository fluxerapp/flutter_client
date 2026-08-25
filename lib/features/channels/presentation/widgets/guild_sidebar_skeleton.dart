import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildSidebarSkeleton extends StatelessWidget {
  const GuildSidebarSkeleton({super.key});

  static const int itemCount = 24;
  static const int _cycleLength = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        final int cycleIndex = index % _cycleLength;
        if (cycleIndex == 0) {
          return const _GuildSidebarCategorySkeleton();
        }
        return const _GuildSidebarChannelSkeleton();
      },
    );
  }
}

class _GuildSidebarSkeletonBar extends StatelessWidget {
  const _GuildSidebarSkeletonBar({required this.width, this.height = 12});

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
  const _GuildSidebarCategorySkeleton();

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s2, layout.s3, layout.s2, layout.s1),
      child: const _GuildSidebarSkeletonBar(width: 96, height: 10),
    );
  }
}

class _GuildSidebarChannelSkeleton extends StatelessWidget {
  const _GuildSidebarChannelSkeleton();

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s2),
        child: Row(
          children: <Widget>[
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondaryAlt,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            const _GuildSidebarSkeletonBar(width: 120),
          ],
        ),
      ),
    );
  }
}
