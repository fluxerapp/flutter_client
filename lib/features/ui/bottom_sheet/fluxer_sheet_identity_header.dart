import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Identity header for sheets: avatar, title, optional subtitle, close button.
class FluxerSheetIdentityHeader extends StatelessWidget {
  const FluxerSheetIdentityHeader({
    required this.leading,
    required this.title,
    this.subtitle,
    this.titlePrefix,
    this.titleAdornments,
    this.onClose,
    this.body,
    super.key,
  });

  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? titlePrefix;
  final List<Widget>? titleAdornments;
  final VoidCallback? onClose;

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final adornments = titleAdornments ?? const <Widget>[];
    final hasSubtitle = subtitle != null && subtitle!.trim().isNotEmpty;

    return Padding(
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
                padding: EdgeInsets.only(right: onClose != null ? 40 : 0),
                child: Row(
                  children: [
                    leading,
                    const SizedBox(width: 12),
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
                  right: 0,
                  top: 0,
                  child: FluxerSheetCloseButton(onTap: onClose!),
                ),
            ],
          ),
          if (body != null) ...[SizedBox(height: context.layout.s3), body!],
        ],
      ),
    );
  }
}

/// Standard close affordance for sheet headers.
class FluxerSheetCloseButton extends StatelessWidget {
  const FluxerSheetCloseButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerButton.circle(
      icon: PhosphorIconsBold.x,
      variant: FluxerButtonVariant.ghost,
      size: FluxerButtonSize.small,
      iconSize: 18,
      onPressed: onTap,
      semanticLabel: l10n.uiClose,
    );
  }
}

/// Scroll-to-bottom affordance for chat message lists.
class FluxerJumpToBottomButton extends StatelessWidget {
  const FluxerJumpToBottomButton({
    required this.onTap,
    this.enabled = true,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback onTap;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerButton.circle(
      icon: PhosphorIconsBold.arrowDown,
      variant: FluxerButtonVariant.inverted,
      size: FluxerButtonSize.small,
      iconSize: 18,
      isLoading: isLoading,
      onPressed: enabled ? onTap : null,
      semanticLabel: l10n.chatJumpToBottom,
    );
  }
}
