import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/navigation/invoke_shell_back.dart';
import 'package:fluxer_app/material_ui.dart';

class HostedUiBackButton extends ConsumerWidget {
  const HostedUiBackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color iconColor = context.colors.textPrimary;
    return SizedBox(
      height: 38,
      width: 38,
      child: AdaptiveButton.sfSymbol(
        onPressed: () => invokeShellBack(context, ref),
        sfSymbol: SFSymbol('chevron.left', size: 20, color: iconColor),
        useSmoothRectangleBorder: false,
      ),
    );
  }
}
