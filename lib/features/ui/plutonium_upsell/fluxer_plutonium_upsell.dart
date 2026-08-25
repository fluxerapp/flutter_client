import 'dart:async';

import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/open_user_billing_settings.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String _kPlutoniumUrl = 'https://fluxer.app/plutonium';

class FluxerPlutoniumUpsell extends StatelessWidget {
  const FluxerPlutoniumUpsell({
    required this.text,
    this.buttonLabel,
    this.onButtonPressed,
    this.onDismiss,
    this.child,
    super.key,
  });

  final String text;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onDismiss;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.brandPrimary,
        borderRadius: layout.radiusMd,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2, right: layout.s2),
              child: PhosphorIcon(
                PhosphorIconsFill.crown,
                size: 16,
                color: colors.textOnBrandPrimary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textOnBrandPrimary,
                      height: 1.4,
                    ),
                  ),
                  if (child != null) ...[SizedBox(height: layout.s2), child!],
                  SizedBox(height: layout.s2),
                  FluxerButton.inverted(
                    onPressed: onButtonPressed ?? () => _openPlutonium(context),
                    label: buttonLabel ?? l10n.getPlutonium,
                  ),
                  if (onDismiss != null) ...[
                    SizedBox(height: layout.s2),
                    FluxerGestureDetector(
                      onTap: onDismiss,
                      child: Text(
                        l10n.emojiPlutoniumUpsellDismiss,
                        style: textStyles.timestamp.copyWith(
                          color: colors.textOnBrandPrimary.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openPlutonium(BuildContext context) {
    if (AppBuildConfig.isOssWebCheckout) {
      unawaited(
        openUserBillingSettings(context, UserSettingsSection.fluxerPlutonium),
      );
      return;
    }
    unawaited(handleExternalLinkTap(context, _kPlutoniumUrl));
  }
}
