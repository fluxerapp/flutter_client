import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:material_ui/material_ui.dart';

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
    final EdgeInsets insets = wideSettingsModalInsets(
      context,
      maxModalWidth: maxModalWidth,
    );
    final bool hasInset = insets != EdgeInsets.zero;
    final BorderRadius borderRadius = hasInset
        ? BorderRadius.circular(16)
        : const BorderRadius.vertical(top: Radius.circular(16));
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
}

Future<void> showWideSettingsBottomSheet(
  BuildContext context, {
  required Widget child,
  double maxModalWidth = kWideSettingsModalMaxWidth,
}) {
  return showModalBottomSheet<void>(
    elevation: 7,
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
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
