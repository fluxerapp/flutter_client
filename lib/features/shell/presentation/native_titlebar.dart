import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:window_manager/window_manager.dart';

/// Height of the custom window title bar.
const kNativeTitlebarHeight = 32.0;

/// A Discord-style thin title bar with window control buttons.
///
/// Provides a [DragToMoveArea] for dragging and double-click to maximize,
/// plus minimize, maximize/restore, and close buttons on the right.
class NativeTitlebar extends ConsumerWidget {
  const NativeTitlebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guilds = ref.watch(
      guildListViewModelProvider.select((s) => s.guilds),
    );
    final router = ref.watch(fluxerRouterProvider);
    final config = router.routerDelegate.currentConfiguration;
    final location = config.isNotEmpty ? config.last.matchedLocation : '/';
    final activeGuildId = ref.watch(activeGuildIdProvider);
    final title = _resolveTitle(guilds, location, activeGuildId);

    return Material(
      color: context.colors.backgroundSecondaryAlt,
      child: GestureDetector(
        onSecondaryTap: windowManager.popUpWindowMenu,
        child: SizedBox(
          height: kNativeTitlebarHeight,
          child: Stack(
            children: [
              const DragToMoveArea(child: SizedBox.expand()),
              Positioned(
                left: 12,
                top: 0,
                bottom: 0,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.fluxerLogoText,
                    height: 14,
                    theme: SvgTheme(currentColor: context.colors.textPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: context.colors.textPrimaryMuted,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _WindowButton(
                      icon: PhosphorIconsBold.question,
                      onPressed: () => unawaited(
                        handleExternalLinkTap(
                          context,
                          'https://help.fluxer.app',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kNativeTitlebarHeight * 0.6,
                      child: VerticalDivider(
                        width: 1,
                        color: context.colors.borderColor,
                      ),
                    ),
                    _WindowButton(
                      icon: PhosphorIconsBold.minus,
                      onPressed: windowManager.minimize,
                    ),
                    const _MaximizeButton(),
                    _WindowButton(
                      icon: PhosphorIconsBold.x,
                      hoverColor: context.colors.textDanger,
                      hoverIconColor: context.colors.textOnBrandPrimary,
                      onPressed: windowManager.close,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resolveTitle(
    List<Guild> guilds,
    String location,
    String? activeGuildId,
  ) {
    if (location.startsWith('/channels/@me')) {
      return 'Direct Messages';
    }
    if (location.startsWith('/channels/@favorites')) {
      return 'Favorites';
    }
    if (activeGuildId != null) {
      final guild = guilds.where((g) => g.id == activeGuildId).firstOrNull;
      if (guild != null) {
        return guild.name;
      }
    }
    return '';
  }
}

/// A maximize/restore toggle button that listens to window state changes.
class _MaximizeButton extends StatefulWidget {
  const _MaximizeButton();

  @override
  State<_MaximizeButton> createState() => _MaximizeButtonState();
}

class _MaximizeButtonState extends State<_MaximizeButton> with WindowListener {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    unawaited(_queryMaximized());
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Future<void> _queryMaximized() async {
    final isMaximized = await windowManager.isMaximized();
    if (mounted) {
      setState(() => _isMaximized = isMaximized);
    }
  }

  @override
  void onWindowMaximize() {
    setState(() => _isMaximized = true);
  }

  @override
  void onWindowUnmaximize() {
    setState(() => _isMaximized = false);
  }

  @override
  Widget build(BuildContext context) {
    return _WindowButton(
      icon: _isMaximized
          ? PhosphorIconsBold.cornersIn
          : PhosphorIconsBold.square,
      onPressed: () async {
        if (_isMaximized) {
          await windowManager.unmaximize();
        } else {
          await windowManager.maximize();
        }
      },
    );
  }
}

/// A single window-control button with hover state.
class _WindowButton extends StatefulWidget {
  const _WindowButton({
    required this.icon,
    required this.onPressed,
    this.hoverColor,
    this.hoverIconColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? hoverColor;
  final Color? hoverIconColor;

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveHoverColor =
        widget.hoverColor ?? context.colors.backgroundModifierHover;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 46,
          height: kNativeTitlebarHeight,
          color: _isHovered ? effectiveHoverColor : Colors.transparent,
          child: Center(
            child: PhosphorIcon(
              widget.icon,
              size: 16,
              color: _isHovered && widget.hoverIconColor != null
                  ? widget.hoverIconColor
                  : context.colors.textPrimaryMuted,
            ),
          ),
        ),
      ),
    );
  }
}
