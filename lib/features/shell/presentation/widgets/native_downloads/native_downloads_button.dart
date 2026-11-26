import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_downloads_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_icon.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_panel.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_pressable.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/native_downloads/native_downloads_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:intl/intl.dart' show NumberFormat;

class NativeDownloadsButton extends ConsumerWidget {
  const NativeDownloadsButton({this.padding = EdgeInsets.zero, super.key});

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasDownloads = ref.watch(
      desktopDownloadsProvider.select(
        (List<DesktopDownload> downloads) => downloads.isNotEmpty,
      ),
    );
    if (!hasDownloads) {
      return const SizedBox.shrink();
    }
    return Padding(padding: padding, child: const _NativeDownloadsPopout());
  }
}

class _NativeDownloadsPopout extends ConsumerStatefulWidget {
  const _NativeDownloadsPopout();

  @override
  ConsumerState<_NativeDownloadsPopout> createState() =>
      _NativeDownloadsPopoutState();
}

class _NativeDownloadsPopoutState extends ConsumerState<_NativeDownloadsPopout>
    with SingleTickerProviderStateMixin {
  static const double _kAnchorGap = 1;
  static const double _kMinWidth = 288;
  static const double _kHiddenScale = 0.98;
  static const Duration _kDuration = Duration(milliseconds: 250);

  final OverlayPortalController _overlayController = OverlayPortalController();
  final FocusScopeNode _panelFocus = FocusScopeNode(
    debugLabel: 'NativeDownloads',
  );

  late final AnimationController _animationController;
  late final CurvedAnimation _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  FocusNode? _previousFocus;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _kDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _scaleAnimation = Tween<double>(
      begin: _kHiddenScale,
      end: 1,
    ).animate(_fadeAnimation);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : _kDuration;
  }

  @override
  void deactivate() {
    _restoreFocus();
    super.deactivate();
  }

  @override
  void dispose() {
    _fadeAnimation.dispose();
    _animationController.dispose();
    _panelFocus.dispose();
    super.dispose();
  }

  void _toggle() => _isOpen ? _close() : _open();

  void _open() {
    ref.read(desktopDownloadsProvider.notifier).refreshFileExists();
    _previousFocus = FocusManager.instance.primaryFocus;
    setState(() {
      _isOpen = true;
      _overlayController.show();
    });
    _animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _isOpen) {
        _panelFocus.requestFocus();
      }
    });
  }

  void _close() {
    if (!_isOpen) {
      return;
    }
    _restoreFocus();
    setState(() => _isOpen = false);
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && !_isOpen) {
          _overlayController.hide();
        }
      }),
    );
  }

  void _restoreFocus() {
    final FocusNode? previous = _previousFocus;
    _previousFocus = null;
    if (previous?.context != null && _panelFocus.hasFocus) {
      previous!.requestFocus();
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!_isOpen ||
        event is! KeyDownEvent ||
        event.logicalKey != LogicalKeyboardKey.escape) {
      return KeyEventResult.ignored;
    }
    _close();
    return KeyEventResult.handled;
  }

  double _viewportPadding(Size overlay) => switch (overlay.shortestSide) {
    < 768 => 8,
    < 1024 => 12,
    _ => 16,
  };

  Widget _buildOverlay(BuildContext context, OverlayChildLayoutInfo info) {
    final Size overlay = info.overlaySize;
    final Rect anchor = MatrixUtils.transformRect(
      info.childPaintTransform,
      Offset.zero & info.childSize,
    );
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final double padding = _viewportPadding(overlay);
    final double end = math.max(
      padding,
      isRtl ? anchor.left : overlay.width - anchor.right,
    );

    return Stack(
      children: [
        PositionedDirectional(
          end: end,
          top: anchor.bottom + _kAnchorGap,
          child: TapRegion(
            groupId: kNativeTitlebarTapGroup,
            child: IgnorePointer(
              ignoring: !_isOpen,
              child: ExcludeFocus(
                excluding: !_isOpen,
                child: FocusScope(
                  node: _panelFocus,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: _kMinWidth,
                          maxWidth: math.max(
                            _kMinWidth,
                            overlay.width - end - padding,
                          ),
                        ),
                        child: const IntrinsicWidth(
                          child: NativeDownloadsPanel(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      includeSemantics: false,
      onKeyEvent: _handleKeyEvent,
      child: OverlayPortal.overlayChildLayoutBuilder(
        controller: _overlayController,
        overlayChildBuilder: _buildOverlay,
        child: TapRegion(
          groupId: kNativeTitlebarTapGroup,
          onTapOutside: (_) => _close(),
          child: _NativeDownloadsTrigger(isOpen: _isOpen, onPressed: _toggle),
        ),
      ),
    );
  }
}

class _NativeDownloadsTrigger extends ConsumerWidget {
  const _NativeDownloadsTrigger({
    required this.isOpen,
    required this.onPressed,
  });

  static const double _kSize = 32;
  static const double _kIconSize = 18;

  final bool isOpen;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final BorderRadius borderRadius = context.layout.radiusLg;
    final int activeCount = ref.watch(
      desktopDownloadsProvider.select(
        (List<DesktopDownload> downloads) => downloads
            .where((DesktopDownload download) => download.isInProgress)
            .length,
      ),
    );

    return NativeDownloadsPressable(
      semanticLabel: activeCount > 0
          ? l10n.desktopDownloadsViewActive(activeCount)
          : l10n.desktopDownloadsView,
      expanded: isOpen,
      borderRadius: borderRadius,
      focusRingInset: 0,
      onPressed: onPressed,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        final bool pressed = states.contains(WidgetState.pressed);
        return SizedBox.square(
          dimension: _kSize,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedContainer(
                duration: kNativeDownloadsHoverDuration,
                curve: Curves.ease,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: pressed
                      ? colors.backgroundModifierSelected
                      : hovered
                      ? colors.backgroundModifierHover
                      : Colors.transparent,
                  borderRadius: borderRadius,
                ),
                child: NativeDownloadsIcon(
                  icon: PhosphorIconsBold.downloadSimple,
                  size: _kIconSize,
                  color: hovered ? colors.textPrimary : colors.textSecondary,
                  duration: kNativeDownloadsHoverDuration,
                ),
              ),
              if (activeCount > 0)
                PositionedDirectional(
                  top: 2,
                  end: 2,
                  child: _ActiveDownloadsBadge(count: activeCount),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ActiveDownloadsBadge extends StatelessWidget {
  const _ActiveDownloadsBadge({required this.count});

  static const double _kSize = 14;

  final int count;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return Container(
      height: _kSize,
      constraints: const BoxConstraints(minWidth: _kSize),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: colors.brandPrimary,
        borderRadius: BorderRadius.circular(_kSize / 2),
      ),
      child: Center(
        widthFactor: 1,
        child: Text(
          NumberFormat.decimalPattern(l10n.localeName).format(count),
          textScaler: TextScaler.noScaling,
          style: context.textStyles.timestamp.copyWith(
            color: colors.textOnBrandPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            height: 1,
          ),
        ),
      ),
    );
  }
}
