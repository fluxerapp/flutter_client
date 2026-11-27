import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_resize_handle.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/user_panel_widgets.dart';
import 'package:fluxer_app/features/shell/providers/layout/shell_sidebar_width_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class ResizableShellSidebarLayout extends ConsumerWidget {
  const ResizableShellSidebarLayout({
    required this.leftPanel,
    required this.rightChild,
    this.leftPanelWidthOverride,
    this.collapsed = false,
    super.key,
  });

  final Widget leftPanel;
  final Widget rightChild;
  final double? leftPanelWidthOverride;
  final bool collapsed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLayoutTheme layout = context.layout;
    final Size size = MediaQuery.sizeOf(context);
    final double? userPreference = ref.watch(shellSidebarWidthProvider);
    final bool desktop = usesDesktopPointerUi(context);
    final double leftPanelWidth =
        leftPanelWidthOverride ??
        resolveShellLeftPanelWidth(
          context: context,
          windowSize: size,
          layout: layout,
          userPreference: userPreference,
          desktop: desktop,
        );
    final double channelSidebarWidth = leftPanelWidth - layout.guildListWidth;
    final bool showResizeHandle =
        !collapsed && shellSidebarResizeEnabled(context);
    final double resizeHandleBottomInset =
        isMobileLayout(context) && isPinnedSidebarLayout(context)
        ? 0
        : desktop
        ? kUserAreaDesktopBoxHeight + kUserAreaDesktopBoxInset + 1
        : layout.userAreaHeight;

    return Row(
      children: <Widget>[
        SizedBox(
          width: collapsed ? 0 : leftPanelWidth,
          child: OverflowBox(
            alignment: AlignmentDirectional.centerStart,
            minWidth: leftPanelWidth,
            maxWidth: leftPanelWidth,
            child: Offstage(offstage: collapsed, child: leftPanel),
          ),
        ),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Row(
                children: <Widget>[
                  VerticalDivider(
                    width: collapsed ? 0 : 1,
                    thickness: collapsed ? 0 : 1,
                    color: context.colors.backgroundModifierAccent,
                  ),
                  Expanded(child: rightChild),
                ],
              ),
              if (showResizeHandle)
                ShellSidebarResizeHandle(
                  channelSidebarWidth: channelSidebarWidth,
                  userAreaHeight: resizeHandleBottomInset,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
