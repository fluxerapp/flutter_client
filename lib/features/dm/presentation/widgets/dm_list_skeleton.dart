import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

class DmListSkeleton extends StatelessWidget {
  const DmListSkeleton({super.key});

  static const int itemCount = 20;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = isMobileLayout(context);
    final double rowHeight = isMobile ? 52 : 42;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemExtent: rowHeight,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return _DmListSkeletonRow(rowHeight: rowHeight);
      },
    );
  }
}

class _DmListSkeletonBar extends StatelessWidget {
  const _DmListSkeletonBar({required this.width, this.height = 12});

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

class _DmListSkeletonRow extends StatelessWidget {
  const _DmListSkeletonRow({required this.rowHeight});

  final double rowHeight;

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    final double avatarSize = rowHeight > 44 ? 36 : 32;
    return SizedBox(
      height: rowHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s2),
        child: Row(
          children: <Widget>[
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondaryAlt,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const _DmListSkeletonBar(width: 120),
                  SizedBox(height: layout.s1),
                  const _DmListSkeletonBar(width: 72, height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
