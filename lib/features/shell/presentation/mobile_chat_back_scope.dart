import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/shell/navigation/invoke_shell_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class MobileChatBackScope extends ConsumerWidget {
  const MobileChatBackScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ShellChatBackPopScope(
      enabled: isMobileLayout(context),
      child: child,
    );
  }
}

class WideShellBackScope extends ConsumerWidget {
  const WideShellBackScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ShellChatBackPopScope(enabled: isWideLayout(context), child: child);
  }
}

class _ShellChatBackPopScope extends ConsumerWidget {
  const _ShellChatBackPopScope({required this.enabled, required this.child});

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!enabled) {
      return child;
    }

    ref
      ..watch(expressionPanelProvider)
      ..watch(attachmentPanelProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) {
          return;
        }
        handleShellBack(context, ref, isSystemBack: true);
      },
      child: child,
    );
  }
}
