import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class WideSettingsModalFrame extends StatelessWidget {
  const WideSettingsModalFrame({
    required this.child,
    this.includeOuterPadding = true,
    this.maxModalWidth = kWideSettingsModalMaxWidth,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final bool includeOuterPadding;
  final double maxModalWidth;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context);
    }
    final EdgeInsets insets = wideSettingsModalInsets(
      context,
      maxModalWidth: maxModalWidth,
    );
    final bool hasInset = insets != EdgeInsets.zero;
    final BorderRadius borderRadius = hasInset
        ? BorderRadius.circular(16)
        : const BorderRadius.vertical(top: Radius.circular(24));
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double height = hasInset
        ? screenHeight - insets.vertical
        : screenHeight * 0.92;

    final Widget shell = ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: backgroundColor ?? context.colors.backgroundPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: context.colors.borderColor),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(height: height, child: child),
      ),
    );

    if (!includeOuterPadding) {
      return shell;
    }

    return Padding(
      padding: insets,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxModalWidth),
          child: shell,
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    final EdgeInsets insets = wideSettingsDesktopModalInsets(context);
    final BorderRadius borderRadius = BorderRadius.circular(
      wideSettingsDesktopModalRadius(context),
    );
    final double height = MediaQuery.sizeOf(context).height - insets.vertical;
    final Widget shell = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: wideSettingsDesktopModalShadows(),
      ),
      child: Material(
        color: backgroundColor ?? wideSettingsContentBackground(context),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: context.colors.backgroundHeaderSecondary),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(height: height, child: child),
      ),
    );
    if (!includeOuterPadding) {
      return shell;
    }
    return Padding(
      padding: insets,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: wideSettingsDesktopModalMaxWidth(context),
          ),
          child: shell,
        ),
      ),
    );
  }
}

Future<void> showWideSettingsBottomSheet(
  BuildContext context, {
  required Widget child,
  double maxModalWidth = kWideSettingsModalMaxWidth,
}) {
  if (usesDesktopPointerUi(context)) {
    return pushFluxerDesktopRoute<void>(
      context,
      navigator: Navigator.of(context, rootNavigator: true),
      surface: FluxerDesktopSurface.modal,
      builder: (BuildContext routeContext) => Padding(
        padding: wideSettingsDesktopModalInsets(routeContext),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: math.min(
                maxModalWidth,
                wideSettingsDesktopModalMaxWidth(routeContext),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
  return showModalBottomSheet<void>(
    elevation: 7,
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    sheetAnimationStyle: fluxerBottomSheetAnimationStyle(context),
    constraints: BoxConstraints(maxWidth: maxModalWidth),
    builder: (BuildContext sheetContext) {
      final EdgeInsets insets = wideSettingsModalInsets(
        sheetContext,
        maxModalWidth: maxModalWidth,
      );
      return Padding(padding: insets, child: child);
    },
  );
}
