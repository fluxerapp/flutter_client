import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double _kTooltipMaxWidth = 350;
const double _kTooltipPointerGap = 18;
const double _kTooltipScreenInset = 8;

final _LinkDestinationTooltipHost _host = _LinkDestinationTooltipHost();

void handleMaskedLinkHover(
  BuildContext context,
  String href,
  PointerEvent event, {
  required bool entered,
}) {
  if (!entered) {
    _host.hide(href);
    return;
  }
  if (!context.mounted || !usesDesktopPointerUi(context)) {
    return;
  }
  _host.show(
    context,
    href: href,
    position: event.position,
    untrusted: _isUntrustedDestination(context, href),
  );
}

bool _isUntrustedDestination(BuildContext context, String href) {
  if (instanceChannelJumpLinkPattern().hasMatch(href)) {
    return false;
  }
  final Uri? uri = parseExternalLinkUri(href);
  if (uri == null ||
      (uri.scheme != 'http' && uri.scheme != 'https') ||
      uri.host.isEmpty) {
    return false;
  }
  final ProviderContainer container = ProviderScope.containerOf(
    context,
    listen: false,
  );
  return !container
      .read(userSettingsViewModelProvider.notifier)
      .isTrustedDomain(uri.host);
}

class _LinkDestinationTooltipHost {
  OverlayEntry? _entry;
  String? _href;
  bool _routeAttached = false;

  void show(
    BuildContext context, {
    required String href,
    required Offset position,
    required bool untrusted,
  }) {
    _remove();
    final OverlayState? overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) {
      return;
    }
    _href = href;
    final OverlayEntry entry = OverlayEntry(
      builder: (BuildContext overlayContext) => IgnorePointer(
        child: CustomSingleChildLayout(
          delegate: _PointerTooltipLayout(
            pointer: position,
            padding:
                MediaQuery.paddingOf(overlayContext) +
                const EdgeInsets.all(_kTooltipScreenInset),
          ),
          child: _LinkDestinationBubble(href: href, untrusted: untrusted),
        ),
      ),
    );
    _entry = entry;
    overlay.insert(entry);
    if (!_routeAttached) {
      GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointer);
      _routeAttached = true;
    }
  }

  void hide(String href) {
    if (_href == href) {
      _remove();
    }
  }

  void _handlePointer(PointerEvent event) {
    if (event is PointerDownEvent || event is PointerScrollEvent) {
      _remove();
    }
  }

  void _remove() {
    _entry?.remove();
    _entry = null;
    _href = null;
    if (_routeAttached) {
      GestureBinding.instance.pointerRouter.removeGlobalRoute(_handlePointer);
      _routeAttached = false;
    }
  }
}

class _PointerTooltipLayout extends SingleChildLayoutDelegate {
  const _PointerTooltipLayout({required this.pointer, required this.padding});

  final Offset pointer;
  final EdgeInsets padding;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final double minX = padding.left;
    final double maxX = size.width - padding.right - childSize.width;
    final double x = (pointer.dx - childSize.width / 2).clamp(
      minX,
      maxX < minX ? minX : maxX,
    );
    final double below = pointer.dy + _kTooltipPointerGap;
    final double y = below + childSize.height > size.height - padding.bottom
        ? pointer.dy - _kTooltipPointerGap - childSize.height
        : below;
    return Offset(x, y < padding.top ? padding.top : y);
  }

  @override
  bool shouldRelayout(_PointerTooltipLayout oldDelegate) =>
      pointer != oldDelegate.pointer || padding != oldDelegate.padding;
}

class _LinkDestinationBubble extends StatelessWidget {
  const _LinkDestinationBubble({required this.href, required this.untrusted});

  final String href;
  final bool untrusted;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _kTooltipMaxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: fluxerDesktopFloatingDecoration(
          context,
          shadows: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.22 : 0.12),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (untrusted) ...<Widget>[
              PhosphorIcon(
                PhosphorIconsFill.warning,
                size: 16,
                color: context.colors.textWarning,
              ),
              const SizedBox(width: 4),
            ],
            Flexible(
              child: Text(
                href,
                style: fluxerDesktopMenuLabelStyle(
                  context,
                ).copyWith(color: context.colors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
