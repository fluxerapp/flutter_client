import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class PendingUploadToolbar extends StatelessWidget {
  const PendingUploadToolbar({
    required this.isSpoiler,
    required this.onToggleSpoiler,
    required this.onEdit,
    required this.onRemove,
    super.key,
  });

  static const double _kItemExtent = 28;
  static const double _kItemRadius = 6;
  static const double _kIconSize = 18;
  static const double _kGap = 2;
  static const double _kPadding = 3;
  static const double _kRadius = 8;
  static const List<BoxShadow> _kShadowDark = <BoxShadow>[
    BoxShadow(color: Color(0x2E000000), blurRadius: 14, offset: Offset(0, 6)),
  ];
  static const List<BoxShadow> _kShadowLight = <BoxShadow>[
    BoxShadow(color: Color(0x1A000000), blurRadius: 14, offset: Offset(0, 6)),
  ];

  final bool isSpoiler;
  final VoidCallback onToggleSpoiler;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final bool light = Theme.of(context).brightness == Brightness.light;
    final Color dangerText = fluxerDesktopMenuDangerText(colors);
    Widget item({
      required IconData icon,
      required String label,
      required VoidCallback onPressed,
      bool danger = false,
    }) {
      return FluxerButton.desktop(
        icon: icon,
        semanticLabel: label,
        showTooltip: true,
        extent: _kItemExtent,
        iconSize: _kIconSize,
        borderRadius: _kItemRadius,
        color: danger ? dangerText : colors.textTertiary,
        hoverColor: danger ? dangerText : colors.textPrimary,
        hoverBackground: danger
            ? fluxerDesktopMenuDangerBackground(colors)
            : colors.surfaceInteractiveHoverBg,
        onPressed: onPressed,
      );
    }

    return Container(
      padding: const EdgeInsets.all(_kPadding),
      decoration: BoxDecoration(
        color: light ? colors.backgroundPrimary : colors.backgroundTertiary,
        borderRadius: BorderRadius.circular(_kRadius),
        border: Border.all(color: colors.backgroundModifierAccent),
        boxShadow: light ? _kShadowLight : _kShadowDark,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: _kGap,
        children: <Widget>[
          item(
            icon: isSpoiler
                ? PhosphorIconsRegular.eyeSlash
                : PhosphorIconsRegular.eye,
            label: l10n.chatAttachmentSpoilerLabel,
            onPressed: onToggleSpoiler,
          ),
          item(
            icon: PhosphorIconsRegular.pencilSimple,
            label: l10n.chatAttachmentEditTitle,
            onPressed: onEdit,
          ),
          item(
            icon: PhosphorIconsRegular.trash,
            label: l10n.chatAttachmentRemove,
            onPressed: onRemove,
            danger: true,
          ),
        ],
      ),
    );
  }
}
