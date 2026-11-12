import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:window_manager/window_manager.dart';

const kNativeTitlebarHeight = 32.0;

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
    final title = _resolveTitle(
      FluxerLocalizations.of(context),
      guilds,
      location,
      activeGuildId,
    );
    final bool showCustomWindowChrome = !Platform.isMacOS;

    return Material(
      color: context.colors.backgroundSecondaryAlt,
      child: FluxerGestureDetector(
        onSecondaryTap: popUpDesktopMainWindowMenu,
        child: SizedBox(
          height: kNativeTitlebarHeight,
          child: Stack(
            children: [
              const DragToMoveArea(child: SizedBox.expand()),
              if (showCustomWindowChrome)
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
                child: Text(title, style: context.textStyles.categoryName),
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
                          InstanceConstants.helpCenterUrl,
                        ),
                      ),
                    ),
                    if (showCustomWindowChrome) ...[
                      SizedBox(
                        height: kNativeTitlebarHeight * 0.6,
                        child: VerticalDivider(
                          width: 1,
                          color: context.colors.borderColor,
                        ),
                      ),
                      const _WindowButton(
                        icon: PhosphorIconsBold.minus,
                        onPressed: minimizeDesktopMainWindow,
                      ),
                      const _MaximizeButton(),
                      _WindowButton(
                        icon: PhosphorIconsBold.x,
                        hoverColor: context.colors.textDanger,
                        hoverIconColor: context.colors.textOnBrandPrimary,
                        onPressed: closeDesktopMainWindow,
                      ),
                    ],
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
    FluxerLocalizations l10n,
    List<Guild> guilds,
    String location,
    String? activeGuildId,
  ) {
    if (location.startsWith('/channels/@me')) {
      return l10n.dmListDirectMessagesTitle;
    }
    if (location.startsWith('/channels/@favorites')) {
      return l10n.favoritesTitle;
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

class _MaximizeButton extends StatelessWidget {
  const _MaximizeButton();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: desktopMainWindow,
      builder: (BuildContext context, _) => _WindowButton(
        icon: desktopMainWindow.isMaximized
            ? PhosphorIconsBold.cornersIn
            : PhosphorIconsBold.square,
        onPressed: toggleMaximizeDesktopMainWindow,
      ),
    );
  }
}

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
      child: FluxerGestureDetector(
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
