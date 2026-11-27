part of 'guild_sidebar.dart';

class _SidebarRowAction extends StatelessWidget {
  const _SidebarRowAction({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  static const double _kExtent = 16;

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color? selectedColor = selected ? context.colors.textPrimary : null;
    return FluxerButton.desktop(
      icon: icon,
      semanticLabel: label,
      showTooltip: true,
      extent: _kExtent,
      color: selectedColor,
      hoverColor: selectedColor,
      hoverBackground: Colors.transparent,
      onPressed: onPressed,
    );
  }
}
