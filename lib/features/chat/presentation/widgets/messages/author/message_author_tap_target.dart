import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/author/message_author_context_menu.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class MessageAuthorTapTarget extends ConsumerWidget {
  const MessageAuthorTapTarget({
    required this.child,
    this.target,
    this.onOpenProfile,
    this.onPointerDown,
    this.onMenuOpenChanged,
    super.key,
  });

  final MessageAuthorMenuTarget? target;
  final ValueChanged<BuildContext>? onOpenProfile;
  final ValueChanged<int>? onPointerDown;
  final ValueChanged<bool>? onMenuOpenChanged;
  final Widget child;

  bool get _interactive => onOpenProfile != null || target != null;

  void _handleTap(BuildContext context, WidgetRef ref) {
    final MessageAuthorMenuTarget? target = this.target;
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    if (target != null &&
        usesDesktopPointerUi(context) &&
        keyboard.isShiftPressed &&
        !keyboard.isMetaPressed &&
        !keyboard.isControlPressed &&
        !keyboard.isAltPressed &&
        insertMessageAuthorMention(ref, target)) {
      return;
    }
    onOpenProfile?.call(context);
  }

  Future<void> _openMenu(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) async {
    final MessageAuthorMenuTarget? target = this.target;
    if (target == null) {
      return;
    }
    onMenuOpenChanged?.call(true);
    try {
      await showMessageAuthorContextMenu(
        context,
        ref,
        position: position,
        target: target,
      );
    } finally {
      onMenuOpenChanged?.call(false);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!_interactive) {
      return child;
    }
    final bool desktop = usesDesktopPointerUi(context);
    final ValueChanged<int>? onPointerDown = this.onPointerDown;
    return Listener(
      onPointerDown: onPointerDown == null
          ? null
          : (PointerDownEvent event) => onPointerDown(event.pointer),
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        cursor: onOpenProfile == null ? MouseCursor.defer : null,
        onTap: () => _handleTap(context, ref),
        onSecondaryTapUp: desktop && target != null
            ? (TapUpDetails details) =>
                  unawaited(_openMenu(context, ref, details.globalPosition))
            : null,
        child: child,
      ),
    );
  }
}
