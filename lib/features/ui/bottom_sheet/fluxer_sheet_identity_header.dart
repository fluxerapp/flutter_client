import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerSheetIdentityHeader extends StatelessWidget {
  const FluxerSheetIdentityHeader({
    required this.leading,
    required this.title,
    this.subtitle,
    this.titlePrefix,
    this.titleAdornments,
    this.onClose,
    this.closeOnLeading = false,
    this.hideLeading = false,
    this.body,
    super.key,
  });

  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? titlePrefix;
  final List<Widget>? titleAdornments;
  final VoidCallback? onClose;
  final bool closeOnLeading;
  final bool hideLeading;

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final adornments = titleAdornments ?? const <Widget>[];
    final hasSubtitle = subtitle != null && subtitle!.trim().isNotEmpty;

    return FluxerBottomSheetDragArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.layout.s4,
          context.layout.s2,
          context.layout.s4,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: onClose != null && closeOnLeading ? 40 : 0,
                    right: onClose != null && !closeOnLeading ? 40 : 0,
                  ),
                  child: Row(
                    children: [
                      if (!hideLeading) ...[leading, const SizedBox(width: 12)],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                if (titlePrefix != null) ...[
                                  titlePrefix!,
                                  const SizedBox(width: 6),
                                ],
                                Flexible(
                                  child: Text(
                                    title,
                                    style: context.textStyles.channelName
                                        .copyWith(fontSize: 18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                for (final a in adornments) ...[
                                  const SizedBox(width: 6),
                                  a,
                                ],
                              ],
                            ),
                            if (hasSubtitle) ...[
                              const SizedBox(height: 2),
                              Text(
                                subtitle!,
                                style: context.textStyles.bodySmall.copyWith(
                                  color: context.colors.textSecondary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (onClose != null)
                  Positioned(
                    left: closeOnLeading ? 0 : null,
                    right: closeOnLeading ? null : 0,
                    top: 0,
                    child: closeOnLeading
                        ? FluxerSheetCloseButton(
                            onTap: onClose!,
                            icon: PhosphorIconsBold.arrowLeft,
                            semanticLabel: FluxerLocalizations.of(context).back,
                          )
                        : FluxerSheetCloseButton(onTap: onClose!),
                  ),
              ],
            ),
            if (body != null) ...[SizedBox(height: context.layout.s3), body!],
          ],
        ),
      ),
    );
  }
}

class FluxerSheetCloseButton extends StatelessWidget {
  const FluxerSheetCloseButton({
    required this.onTap,
    this.icon = PhosphorIconsBold.x,
    this.semanticLabel,
    super.key,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerButton.circle(
      icon: icon,
      variant: FluxerButtonVariant.ghost,
      size: FluxerButtonSize.small,
      iconSize: 18,
      onPressed: onTap,
      semanticLabel: semanticLabel ?? l10n.uiClose,
    );
  }
}
