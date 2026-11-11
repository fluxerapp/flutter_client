part of 'fluxer_bottom_sheet.dart';

const double _kDesktopModalSmallWidth = 440;
const double _kDesktopModalMediumWidth = 600;
const double _kDesktopModalMaxHeight = 720;
const double _kDesktopModalMinHeight = 160;
const double _kDesktopMenuMaxHeight = 480;
const double _kDesktopPopoutMaxHeight = 640;
const double _kDesktopPopoutWidth = 340;
const double _kDesktopModalOuterVertical = 24;
const double _kDesktopModalOuterHorizontal = 16;

Future<T?> _showFluxerDesktopSheet<T>(
  BuildContext context, {
  required FluxerDesktopSurface surface,
  required FluxerDesktopPresentation presentation,
  required bool useRootNavigator,
  required bool isDismissible,
  required Widget? Function(BuildContext context) buildHeader,
  required Widget Function(BuildContext sheetContext) buildBody,
  double defaultModalWidth = _kDesktopModalSmallWidth,
  Color? barrierColor,
  ValueNotifier<bool>? canDismissNotifier,
  VoidCallback? onBack,
  double? maxHeight,
}) {
  final NavigatorState navigator = Navigator.of(
    context,
    rootNavigator: useRootNavigator,
  );
  final Route<dynamic>? origin = ModalRoute.of(context);
  final FluxerDesktopRoute<dynamic>? last = _lastDesktopByNavigator[navigator];
  if (last != null &&
      origin != null &&
      identical(last.origin, origin) &&
      last.isCurrent &&
      last.isEntering) {
    return Future<T?>.value();
  }

  final bool isModal = surface == FluxerDesktopSurface.modal;
  final BuildContext? anchorContext = presentation.anchorContext;
  final Rect? anchor = isModal
      ? null
      : anchorContext != null
      ? fluxerDesktopWidgetRectOf(anchorContext, navigator: navigator)
      : surface == FluxerDesktopSurface.popout
      ? fluxerDesktopPressAnchorOf(context, navigator: navigator)
      : null;
  final Offset? position = !isModal && anchor == null
      ? fluxerDesktopPressPosition(context, navigator: navigator)
      : null;

  Widget buildColumn(BuildContext sheetContext) {
    final Widget? header = buildHeader(sheetContext);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [?header, buildBody(sheetContext)],
    );
  }

  return pushFluxerDesktopRoute<T>(
    context,
    navigator: navigator,
    surface: surface,
    origin: origin,
    dismissible: isDismissible,
    barrierTint: barrierColor,
    onCreated: (FluxerDesktopRoute<T> route) {
      _lastDesktopByNavigator[navigator] = route;
    },
    builder: (BuildContext sheetContext) {
      final Widget content = Builder(builder: buildColumn);
      return _buildSheetWithBackHandler(
        child: isModal
            ? _FluxerDesktopModalFrame(
                width: presentation.width ?? defaultModalWidth,
                borderRadius: presentation.borderRadius ?? 8,
                maxHeight: maxHeight,
                child: content,
              )
            : _FluxerDesktopAnchoredFrame(
                surface: surface,
                presentation: presentation,
                anchor: anchor,
                position: position,
                maxHeight: maxHeight,
                child: content,
              ),
        onBack: onBack,
        canDismissNotifier: canDismissNotifier,
      );
    },
  );
}

Widget? _buildDesktopHeader(
  BuildContext context, {
  required String? title,
  required Widget? subtitle,
  required Widget? leading,
  required Widget? trailing,
  required VoidCallback? onBack,
  required bool isDismissible,
}) {
  if (!_hasSheetHeader(
    title: title,
    subtitle: subtitle,
    leading: leading,
    trailing: trailing,
    onBack: onBack,
  )) {
    return null;
  }
  final FluxerDesktopSurface? surface = FluxerDesktopSurfaceScope.maybeOf(
    context,
  );
  if (surface == FluxerDesktopSurface.menu) {
    return onBack == null
        ? null
        : FluxerBottomSheetHeader(title: title ?? '', onBack: onBack);
  }
  if (surface == FluxerDesktopSurface.popout) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.layout.s3,
        bottom: context.layout.s2,
      ),
      child: FluxerBottomSheetHeader(
        title: title ?? '',
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        onBack: onBack,
      ),
    );
  }
  final Widget? closeButton = isDismissible
      ? const FluxerDesktopModalCloseButton()
      : null;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: context.layout.s4),
    child: FluxerBottomSheetHeader(
      title: title ?? '',
      subtitle: subtitle,
      leading: leading,
      onBack: onBack,
      trailing: trailing != null && closeButton != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                trailing,
                SizedBox(width: context.layout.s2),
                closeButton,
              ],
            )
          : trailing ?? closeButton,
    ),
  );
}

class FluxerDesktopModalCloseButton extends StatelessWidget {
  const FluxerDesktopModalCloseButton({this.onTap, super.key});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onTap ?? () => Navigator.of(context).maybePop(),
      semanticLabel: FluxerLocalizations.of(context).uiClose,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        final bool pressed = states.contains(WidgetState.pressed);
        return Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hovered
                ? colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: context.layout.radiusSm,
          ),
          child: Opacity(
            opacity: pressed
                ? 0.8
                : hovered
                ? 1
                : 0.5,
            child: PhosphorIcon(
              PhosphorIconsBold.x,
              size: 24,
              color: hovered ? colors.textPrimary : colors.textPrimaryMuted,
            ),
          ),
        );
      },
    );
  }
}

class _FluxerDesktopModalFrame extends StatelessWidget {
  const _FluxerDesktopModalFrame({
    required this.child,
    required this.width,
    required this.borderRadius,
    this.maxHeight,
  });

  final Widget child;
  final double width;
  final double borderRadius;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final BorderRadius radius = BorderRadius.circular(borderRadius);
    final double available = math.max(
      0,
      mediaQuery.size.height -
          mediaQuery.viewInsets.bottom -
          _kDesktopModalOuterVertical * 2,
    );
    final double surfaceWidth = math.min(
      width,
      mediaQuery.size.width - _kDesktopModalOuterHorizontal * 2,
    );

    return Padding(
      padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
      child: CreaseAwareAlign(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: surfaceWidth,
            minWidth: surfaceWidth,
            maxHeight: available * (maxHeight ?? 1),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: radius,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 24,
                  spreadRadius: -4,
                  offset: Offset(0, 8),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 48,
                  spreadRadius: -8,
                  offset: Offset(0, 20),
                ),
              ],
            ),
            child: Material(
              color: colors.backgroundSecondary,
              surfaceTintColor: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: radius,
                side: BorderSide(color: colors.backgroundHeaderSecondary),
              ),
              child: FluxerDesktopSurfaceScope(
                surface: FluxerDesktopSurface.modal,
                child: _FluxerSheetSurfaceScope(
                  child: FluxerBottomSheetScope(
                    bottomScrollPadding: context.layout.s4,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FluxerDesktopAnchoredFrame extends StatelessWidget {
  const _FluxerDesktopAnchoredFrame({
    required this.surface,
    required this.presentation,
    required this.child,
    this.anchor,
    this.position,
    this.maxHeight,
  });

  final FluxerDesktopSurface surface;
  final FluxerDesktopPresentation presentation;
  final Widget child;
  final Rect? anchor;
  final Offset? position;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    final double available = MediaQuery.sizeOf(context).height;
    final Widget scoped = _FluxerSheetSurfaceScope(child: child);
    final Widget panel = surface == FluxerDesktopSurface.menu
        ? FluxerDesktopMenuPanel(
            width: presentation.width ?? kFluxerDesktopMenuDefaultWidth,
            child: scoped,
          )
        : FluxerDesktopPopoutPanel(
            width: presentation.width ?? _kDesktopPopoutWidth,
            showBorder: presentation.showPanelBorder,
            borderRadius: presentation.borderRadius ?? 8,
            child: FluxerBottomSheetScope(
              bottomScrollPadding: context.layout.s3,
              child: scoped,
            ),
          );
    return CustomSingleChildLayout(
      delegate: FluxerDesktopAnchoredLayoutDelegate(
        posture: deviceFoldPostureOf(context),
        anchor: anchor,
        position: position,
        placement: presentation.placement,
        positionGap: surface == FluxerDesktopSurface.menu
            ? kFluxerDesktopMenuPointerOffset
            : 0,
      ),
      child: maxHeight == null
          ? panel
          : ConstrainedBox(
              constraints: BoxConstraints(maxHeight: available * maxHeight!),
              child: panel,
            ),
    );
  }
}

class _FluxerDesktopScrollableBody extends StatefulWidget {
  const _FluxerDesktopScrollableBody({
    required this.header,
    required this.builder,
    this.maxHeight,
    this.heightFactor,
  });

  final Widget? Function(BuildContext context) header;
  final Widget Function(BuildContext context, ScrollController controller)
  builder;
  final double? maxHeight;
  final double? heightFactor;

  @override
  State<_FluxerDesktopScrollableBody> createState() =>
      _FluxerDesktopScrollableBodyState();
}

class _FluxerDesktopScrollableBodyState
    extends State<_FluxerDesktopScrollableBody>
    implements FluxerSheetDragTarget {
  late final FluxerSheetScrollController _controller =
      FluxerSheetScrollController(
        this,
        drivesSheet: false,
        onContentExtent: _handleContentExtent,
      );
  double _contentHeight = 0;
  double _height = 0;
  bool _fitScheduled = false;

  void _handleContentExtent(double viewportExtent, double contentExtent) {
    if ((contentExtent - viewportExtent).abs() < 0.5) {
      return;
    }
    final double next = _height - viewportExtent + contentExtent;
    if (_contentHeight > 0 && next <= _contentHeight + 0.5) {
      return;
    }
    _contentHeight = next;
    if (_fitScheduled) {
      return;
    }
    _fitScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitScheduled = false;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get canExpand => false;

  @override
  void dragBy(double deltaDy) {}

  @override
  void endDrag(double velocityDy) {}

  @override
  Widget build(BuildContext context) {
    final bool isMenu = FluxerDesktopSurfaceScope.isMenu(context);
    final double cap = switch (FluxerDesktopSurfaceScope.maybeOf(context)) {
      FluxerDesktopSurface.menu => _kDesktopMenuMaxHeight,
      FluxerDesktopSurface.popout => _kDesktopPopoutMaxHeight,
      _ => _kDesktopModalMaxHeight,
    };
    final Widget? header = widget.header(context);

    return Flexible(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double limit = math.min(
            constraints.maxHeight * (widget.heightFactor ?? 1),
            math.min(cap, widget.maxHeight ?? cap),
          );
          _height = _contentHeight > 0
              ? _contentHeight
                    .clamp(
                      isMenu ? 0.0 : math.min(_kDesktopModalMinHeight, limit),
                      limit,
                    )
                    .toDouble()
              : limit;
          return SizedBox(
            height: _height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ?header,
                Expanded(
                  child: Builder(
                    builder: (BuildContext scopedContext) =>
                        widget.builder(scopedContext, _controller),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
