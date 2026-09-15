import 'package:fluxer_app/material_ui.dart';

/// Handles the system back button for modal overlays such as FluxerBottomSheets
/// and modals.
Widget wrapFluxerOverlayBackHandler({
  required bool canDismiss,
  required VoidCallback? onBack,
  required VoidCallback? onDismiss,
  required Widget child,
}) {
  return _FluxerOverlayBackHandler(
    canDismiss: canDismiss,
    onBack: onBack,
    onDismiss: onDismiss,
    child: child,
  );
}

class _FluxerOverlayBackHandler extends StatefulWidget {
  const _FluxerOverlayBackHandler({
    required this.canDismiss,
    required this.onBack,
    required this.onDismiss,
    required this.child,
  });

  final bool canDismiss;
  final VoidCallback? onBack;
  final VoidCallback? onDismiss;
  final Widget child;

  @override
  State<_FluxerOverlayBackHandler> createState() =>
      _FluxerOverlayBackHandlerState();
}

class _FluxerOverlayBackHandlerState extends State<_FluxerOverlayBackHandler> {
  double _viewInsetBottom = 0;
  bool _hasEditableFocus = false;

  bool get _interceptsBack => widget.onBack != null || widget.onDismiss != null;

  @override
  void initState() {
    super.initState();
    FocusManager.instance.addListener(_onFocusChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double inset = MediaQuery.viewInsetsOf(context).bottom;
    final bool keyboardClosed = _viewInsetBottom > 0 && inset == 0;
    _viewInsetBottom = inset;
    if (!keyboardClosed) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _unfocusEditableInOverlay();
      }
    });
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (!mounted || _interceptsBack) {
      return;
    }
    final bool hasEditableFocus = _hasEditableFocusInOverlay();
    if (hasEditableFocus == _hasEditableFocus) {
      return;
    }
    setState(() => _hasEditableFocus = hasEditableFocus);
  }

  void _handlePopInvoked(bool didPop) {
    if (didPop) {
      return;
    }
    if (_unfocusEditableInOverlay()) {
      return;
    }
    if (!widget.canDismiss) {
      return;
    }
    if (widget.onBack != null) {
      widget.onBack!();
      return;
    }
    widget.onDismiss?.call();
  }

  bool _hasEditableFocusInOverlay() {
    final FocusNode? primary = FocusManager.instance.primaryFocus;
    if (primary == null || !primary.hasFocus) {
      return false;
    }
    final BuildContext? focusContext = primary.context;
    if (focusContext == null || !focusContext.mounted) {
      return false;
    }
    if (focusContext.findAncestorWidgetOfExactType<EditableText>() == null) {
      return false;
    }
    return focusContext
            .findAncestorStateOfType<_FluxerOverlayBackHandlerState>() ==
        this;
  }

  bool _unfocusEditableInOverlay() {
    if (!_hasEditableFocusInOverlay()) {
      return false;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final bool canPop =
        widget.canDismiss && !_interceptsBack && !_hasEditableFocus;
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (bool didPop, _) => _handlePopInvoked(didPop),
      child: widget.child,
    );
  }
}
