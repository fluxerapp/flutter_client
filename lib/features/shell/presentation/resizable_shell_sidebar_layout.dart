import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_resize_handle.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/features/shell/providers/shell_sidebar_width_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class ResizableShellSidebarLayout extends ConsumerWidget {
  const ResizableShellSidebarLayout({
    required this.leftPanel,
    required this.rightChild,
    this.leftPanelWidthOverride,
    super.key,
  });

  final Widget leftPanel;
  final Widget rightChild;
  final double? leftPanelWidthOverride;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLayoutTheme layout = context.layout;
    final Size size = MediaQuery.sizeOf(context);
    final double? userPreference = ref.watch(shellSidebarWidthProvider);
    final double leftPanelWidth =
        leftPanelWidthOverride ??
        resolveShellLeftPanelWidth(
          context: context,
          windowSize: size,
          layout: layout,
          userPreference: userPreference,
        );
    final double channelSidebarWidth = leftPanelWidth - layout.guildListWidth;
    final bool showResizeHandle = shellSidebarResizeEnabled(context);
    final double resizeHandleBottomInset =
        isMobileLayout(context) && isPinnedSidebarLayout(context)
        ? 0
        : layout.userAreaHeight;

    return Row(
      children: <Widget>[
        SizedBox(width: leftPanelWidth, child: leftPanel),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Row(
                children: <Widget>[
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
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
