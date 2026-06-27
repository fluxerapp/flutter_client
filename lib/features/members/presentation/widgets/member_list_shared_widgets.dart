import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

const double kMemberListRowHeight = 42;
const double kMemberListGroupHeaderHeight = 28;
const double kMemberListDetailsGroupHeaderHeight = 36;
const double kMemberListDetailsMemberRowHeight = 56;

enum MemberListSkeletonStyle { sidebar, details }

class MemberListSkeletonItem extends StatelessWidget {
  const MemberListSkeletonItem({
    required this.index,
    this.style = MemberListSkeletonStyle.sidebar,
    super.key,
  });

  final int index;
  final MemberListSkeletonStyle style;

  @override
  Widget build(BuildContext context) {
    if (style == MemberListSkeletonStyle.details) {
      return _MemberListDetailsSkeletonItem(index: index);
    }
    return _MemberListSidebarSkeletonItem(index: index);
  }
}

class MemberListSkeletonRow extends StatelessWidget {
  const MemberListSkeletonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MemberListSidebarMemberSkeleton();
  }
}

class _MemberListSkeletonCircle extends StatelessWidget {
  const _MemberListSkeletonCircle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondaryAlt,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _MemberListSkeletonBar extends StatelessWidget {
  const _MemberListSkeletonBar({required this.width, this.height = 12});

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

class _MemberListSidebarSkeletonItem extends StatelessWidget {
  const _MemberListSidebarSkeletonItem({required this.index});

  final int index;

  static const int _cycleLength = 6;

  @override
  Widget build(BuildContext context) {
    final int cycleIndex = index % _cycleLength;
    if (cycleIndex == 0) {
      return const _MemberListSidebarGroupHeaderSkeleton();
    }
    return const _MemberListSidebarMemberSkeleton();
  }
}

class _MemberListSidebarGroupHeaderSkeleton extends StatelessWidget {
  const _MemberListSidebarGroupHeaderSkeleton();

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s2, layout.s3, layout.s2, layout.s1),
      child: const _MemberListSkeletonBar(width: 96, height: 10),
    );
  }
}

class _MemberListSidebarMemberSkeleton extends StatelessWidget {
  const _MemberListSidebarMemberSkeleton();

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    return SizedBox(
      height: kMemberListRowHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s2,
            vertical: layout.s1,
          ),
          child: Row(
            children: <Widget>[
              const _MemberListSkeletonCircle(size: 32),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const _MemberListSkeletonBar(width: 120),
                    SizedBox(height: layout.s1),
                    const _MemberListSkeletonBar(width: 72, height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MemberListDetailsSkeletonItem extends StatelessWidget {
  const _MemberListDetailsSkeletonItem({required this.index});

  final int index;

  static const int _cycleLength = 5;

  @override
  Widget build(BuildContext context) {
    final int cycleIndex = index % _cycleLength;
    if (cycleIndex == 0) {
      return const _MemberListDetailsGroupHeaderSkeleton();
    }
    final int memberIndex = cycleIndex - 1;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: kMemberListDetailsMemberRowHeight,
      ),
      child: MemberListDetailsMemberShell(
        isFirstInGroup: memberIndex == 0,
        isLastInGroup: memberIndex == 2,
        child: const _MemberListDetailsMemberSkeleton(),
      ),
    );
  }
}

class _MemberListDetailsGroupHeaderSkeleton extends StatelessWidget {
  const _MemberListDetailsGroupHeaderSkeleton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMemberListDetailsGroupHeaderHeight,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.layout.s3,
          bottom: context.layout.s1,
          left: context.layout.s4,
          right: context.layout.s4,
        ),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: _MemberListSkeletonBar(width: 108, height: 10),
        ),
      ),
    );
  }
}

class _MemberListDetailsMemberSkeleton extends StatelessWidget {
  const _MemberListDetailsMemberSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          const _MemberListSkeletonCircle(size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const _MemberListSkeletonBar(width: 132, height: 14),
                SizedBox(height: context.layout.s1),
                const _MemberListSkeletonBar(width: 88, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MemberListSidebarGroupHeader extends StatelessWidget {
  const MemberListSidebarGroupHeader({
    required this.groupName,
    required this.count,
    super.key,
  });

  final String groupName;
  final int count;

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s2, layout.s3, layout.s2, layout.s1),
      child: Text(
        '$groupName — $count',
        style: context.textStyles.categoryName.copyWith(
          color: context.colors.textPrimaryMuted,
        ),
      ),
    );
  }
}

class MemberListDetailsGroupHeader extends StatelessWidget {
  const MemberListDetailsGroupHeader({
    required this.groupName,
    required this.count,
    super.key,
  });

  final String groupName;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMemberListDetailsGroupHeaderHeight,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.layout.s3,
          bottom: context.layout.s1,
          left: context.layout.s4,
          right: context.layout.s4,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$groupName — $count',
            style: context.textStyles.categoryName.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
        ),
      ),
    );
  }
}

class MemberListDetailsMemberShell extends StatelessWidget {
  const MemberListDetailsMemberShell({
    required this.isFirstInGroup,
    required this.isLastInGroup,
    required this.child,
    super.key,
  });

  final bool isFirstInGroup;
  final bool isLastInGroup;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = context.colors.backgroundSecondaryAlt;
    final Color dividerColor = context.colors.backgroundHeaderSecondary
        .withValues(alpha: 0.3);
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: isFirstInGroup ? const Radius.circular(12) : Radius.zero,
      topRight: isFirstInGroup ? const Radius.circular(12) : Radius.zero,
      bottomLeft: isLastInGroup ? const Radius.circular(12) : Radius.zero,
      bottomRight: isLastInGroup ? const Radius.circular(12) : Radius.zero,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: isFirstInGroup
              ? null
              : Border(top: BorderSide(color: dividerColor)),
        ),
        child: child,
      ),
    );
  }
}

class MemberListGroupHeader extends StatelessWidget {
  const MemberListGroupHeader({
    required this.groupName,
    required this.count,
    super.key,
  });

  final String groupName;
  final int count;

  @override
  Widget build(BuildContext context) {
    return MemberListSidebarGroupHeader(groupName: groupName, count: count);
  }
}
