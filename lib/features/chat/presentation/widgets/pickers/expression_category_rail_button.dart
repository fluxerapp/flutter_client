import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_acronym.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

const double kExpressionCategoryRailButtonSize = 26;
const double kExpressionCategoryRailGap = 8;
const double kExpressionCategoryRailIconSize = 24;

class ExpressionCategoryRailButton extends StatefulWidget {
  const ExpressionCategoryRailButton({
    required this.onTap,
    required this.builder,
    this.tooltip,
    this.selected = false,
    super.key,
  });

  final VoidCallback onTap;
  final Widget Function(BuildContext context, bool hovered) builder;
  final String? tooltip;
  final bool selected;

  @override
  State<ExpressionCategoryRailButton> createState() =>
      _ExpressionCategoryRailButtonState();
}

class _ExpressionCategoryRailButtonState
    extends State<ExpressionCategoryRailButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    Widget button = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: kExpressionCategoryRailButtonSize,
          height: kExpressionCategoryRailButtonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _hovered
                ? context.colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: ExcludeSemantics(child: widget.builder(context, _hovered)),
        ),
      ),
    );
    final String? tooltip = widget.tooltip;
    if (tooltip != null) {
      button = Tooltip(message: tooltip, child: button);
    }
    return Semantics(
      button: true,
      label: tooltip,
      selected: widget.selected,
      child: Padding(
        padding: const EdgeInsets.only(bottom: kExpressionCategoryRailGap),
        child: Center(child: button),
      ),
    );
  }
}

class ExpressionCategoryRailIconButton extends StatelessWidget {
  const ExpressionCategoryRailIconButton({
    required this.icon,
    required this.onTap,
    this.tooltip,
    this.selected = false,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;
  final bool selected;

  @override
  Widget build(BuildContext context) => ExpressionCategoryRailButton(
    tooltip: tooltip,
    selected: selected,
    onTap: onTap,
    builder: (BuildContext context, bool hovered) => PhosphorIcon(
      icon,
      size: kExpressionCategoryRailIconSize,
      color: selected || hovered
          ? context.colors.textPrimary
          : context.colors.textPrimaryMuted,
    ),
  );
}

class ExpressionCategoryRailGuildButton extends StatelessWidget {
  const ExpressionCategoryRailGuildButton({
    required this.guild,
    required this.onTap,
    this.selected = false,
    super.key,
  });

  final Guild guild;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) => ExpressionCategoryRailButton(
    tooltip: guild.name,
    selected: selected,
    onTap: onTap,
    builder: (BuildContext context, bool hovered) => DecoratedBox(
      decoration: selected
          ? BoxDecoration(
              border: Border.all(color: context.colors.textPrimary, width: 2),
              borderRadius: BorderRadius.circular(8),
            )
          : const BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(selected ? 2 : 0),
        child: ExpressionGuildIcon(
          guild: guild,
          size: selected ? 18 : kExpressionCategoryRailIconSize,
        ),
      ),
    ),
  );
}

class ExpressionGuildIcon extends StatelessWidget {
  const ExpressionGuildIcon({
    required this.guild,
    required this.size,
    super.key,
  });

  final Guild guild;
  final double size;

  @override
  Widget build(BuildContext context) {
    final String? iconUrl = guild.iconUrl;
    final Widget initial = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: FluxerGuildAcronym(
        name: guild.name,
        color: context.colors.textPrimaryMuted,
      ),
    );
    if (iconUrl == null) {
      return initial;
    }
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: iconUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => initial,
      ),
    );
  }
}
