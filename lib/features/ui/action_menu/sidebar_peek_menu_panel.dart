import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/action_menu/sidebar_peek_menu_constants.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

export 'package:fluxer_app/features/ui/action_menu/sidebar_peek_menu_constants.dart';

double computeSidebarPeekMenuTop({
  required double anchorCenterY,
  required double menuHeight,
  required MediaQueryData mediaQuery,
}) {
  final EdgeInsets padding = mediaQuery.padding;
  final double viewTop = padding.top + kSidebarPeekMenuEdgePadding;
  final double viewBottom =
      mediaQuery.size.height - padding.bottom - kSidebarPeekMenuEdgePadding;
  final double naturalTop = anchorCenterY - menuHeight / 2;
  final double minTop = viewTop;
  final double maxTop = viewBottom - menuHeight;
  if (maxTop < minTop) {
    return minTop;
  }
  return naturalTop.clamp(minTop, maxTop);
}

double computeSidebarPeekMenuLeft({required double anchorRight}) =>
    anchorRight + kSidebarPeekMenuHorizontalGap;

double estimateSidebarPeekMenuHeight(
  BuildContext context, {
  required int rowCount,
}) {
  final layout = context.layout;
  final double titleBlock = (layout.s1 + 22) * kSidebarPeekMenuHeightScale;
  final double verticalPadding = layout.s2 * 2 * kSidebarPeekMenuHeightScale;
  final double rowMargins = rowCount * kSidebarPeekMenuItemVerticalMargin * 2;
  return verticalPadding +
      titleBlock +
      rowCount * kSidebarPeekMenuRowHeight +
      rowMargins;
}

class SidebarPeekMenuPanel extends StatelessWidget {
  const SidebarPeekMenuPanel({
    required this.title,
    required this.sections,
    super.key,
  });

  final String title;
  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;

    return Material(
      color: FluxerBottomSheet.cardColorOf(context),
      surfaceTintColor: Colors.transparent,
      borderRadius: layout.radiusXxl,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: kSidebarPeekMenuWidth,
        child: Padding(
          padding: EdgeInsets.all(layout.s2 * kSidebarPeekMenuHeightScale),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  layout.groupRowInset,
                  0,
                  layout.groupRowInset,
                  layout.s1 * kSidebarPeekMenuHeightScale,
                ),
                child: Text(
                  title,
                  style: context.textStyles.username.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              for (int i = 0; i < sections.length; i++) ...[
                if (i > 0)
                  SizedBox(height: layout.s4 * kSidebarPeekMenuHeightScale),
                sections[i],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarPeekMenuFollower extends StatefulWidget {
  const SidebarPeekMenuFollower({
    required this.anchorKey,
    required this.estimatedMenuHeight,
    required this.child,
    super.key,
  });

  final GlobalKey anchorKey;
  final double estimatedMenuHeight;
  final Widget child;

  @override
  State<SidebarPeekMenuFollower> createState() =>
      _SidebarPeekMenuFollowerState();
}

class _SidebarPeekMenuFollowerState extends State<SidebarPeekMenuFollower> {
  final GlobalKey _menuKey = GlobalKey();
  Offset? _origin;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timestamp) {
      _updatePosition();
      _schedulePositionUpdate(timestamp);
    });
  }

  @override
  void didUpdateWidget(covariant SidebarPeekMenuFollower oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.estimatedMenuHeight != widget.estimatedMenuHeight) {
      WidgetsBinding.instance.addPostFrameCallback(_schedulePositionUpdate);
    }
  }

  void _schedulePositionUpdate(Duration _) {
    if (!mounted) {
      return;
    }
    _updatePosition();
    final RenderBox? menuBox =
        _menuKey.currentContext?.findRenderObject() as RenderBox?;
    if (menuBox == null || !menuBox.hasSize) {
      WidgetsBinding.instance.addPostFrameCallback(_schedulePositionUpdate);
    }
  }

  void _updatePosition() {
    final BuildContext? anchorContext = widget.anchorKey.currentContext;
    if (anchorContext == null) {
      return;
    }
    final RenderBox? anchorBox = anchorContext.findRenderObject() as RenderBox?;
    if (anchorBox == null || !anchorBox.hasSize) {
      return;
    }

    final Offset anchorTopLeft = anchorBox.localToGlobal(Offset.zero);
    final double anchorCenterY = anchorTopLeft.dy + anchorBox.size.height / 2;
    final double anchorRight = anchorTopLeft.dx + anchorBox.size.width;

    var menuHeight = widget.estimatedMenuHeight;
    final RenderBox? menuBox =
        _menuKey.currentContext?.findRenderObject() as RenderBox?;
    if (menuBox != null && menuBox.hasSize) {
      menuHeight = menuBox.size.height;
    }

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Offset nextOrigin = Offset(
      computeSidebarPeekMenuLeft(anchorRight: anchorRight),
      computeSidebarPeekMenuTop(
        anchorCenterY: anchorCenterY,
        menuHeight: menuHeight,
        mediaQuery: mediaQuery,
      ),
    );
    if (nextOrigin != _origin) {
      setState(() => _origin = nextOrigin);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_origin == null) {
      WidgetsBinding.instance.addPostFrameCallback(_schedulePositionUpdate);
      return const SizedBox.shrink();
    }
    return Positioned(
      left: _origin!.dx,
      top: _origin!.dy,
      child: KeyedSubtree(key: _menuKey, child: widget.child),
    );
  }
}
