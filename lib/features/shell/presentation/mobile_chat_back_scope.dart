import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer_panel.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_handler.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class MobileChatBackScope extends ConsumerWidget {
  final Widget child;

  const MobileChatBackScope({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileLayout(context)) {
      return child;
    }

    ref.watch(expressionPanelProvider);
    ref.watch(attachmentPanelProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) {
          return;
        }
        applyShellBackAction(
          context: context,
          container: ref.container,
          action: resolveShellBackAction(
            hasPopupOverlay: ref.read(shellHasPopupOverlayProvider),
            hasManualGestureBlock: ref.read(shellManualGestureBlockProvider),
            hasExpressionPanelOpen: isComposerPanelOpen(
              expressionPanelOpen: ref.read(expressionPanelProvider),
              attachmentPanelOpen: ref.read(attachmentPanelProvider),
            ),
            revealSide: ref.read(currentRevealSideProvider),
            shellLocation: ref.read(shellLocationProvider),
          ),
          closeExpressionPanel: () {
            ref.read(expressionPanelProvider.notifier).close();
            ref.read(attachmentPanelProvider.notifier).close();
          },
        );
      },
      child: child,
    );
  }
}
