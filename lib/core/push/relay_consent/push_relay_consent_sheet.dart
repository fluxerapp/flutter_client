import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/push/web_push/web_push_relay.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String kPushRelayNoticeUrl =
    '${InstanceConstants.defaultMarketingBaseUrl}/push-relay';

Future<bool?> showPushRelayConsentSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  final colors = context.colors;
  final textStyles = context.textStyles;

  Widget buildContent(BuildContext overlayContext) {
    return _PushRelayConsentSheetContent(
      onAgree: () =>
          Navigator.of(overlayContext, rootNavigator: true).pop(true),
      onDecline: () =>
          Navigator.of(overlayContext, rootNavigator: true).pop(false),
    );
  }

  if (isMobileLayout(context)) {
    return FluxerBottomSheet.show<bool>(
      context,
      useRootNavigator: true,
      isDismissible: false,
      enableDrag: false,
      title: l10n.pushRelayConsentTitle,
      subtitle: Text(
        l10n.pushRelayConsentDescription(
          pushRelayProviderName(isApple: PushProviderGuard.isApple),
        ),
        style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
      ),
      builder: (sheetContext, close) => buildContent(sheetContext),
    );
  }

  return FluxerModal.show<bool>(
    context,
    useRootNavigator: true,
    centered: true,
    title: l10n.pushRelayConsentTitle,
    description: l10n.pushRelayConsentDescription(
      pushRelayProviderName(isApple: PushProviderGuard.isApple),
    ),
    trailing: Opacity(
      opacity: 0.7,
      child: FluxerButton.ghost(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop(false),
        icon: PhosphorIconsBold.x,
        isSquare: true,
        semanticLabel: l10n.uiClose,
      ),
    ),
    builder: (dialogContext, close) => buildContent(dialogContext),
  );
}

class _PushRelayConsentSheetContent extends StatelessWidget {
  const _PushRelayConsentSheetContent({
    required this.onAgree,
    required this.onDecline,
  });

  final VoidCallback onAgree;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final TextStyle bodyStyle = textStyles.bodySmall.copyWith(
      color: colors.textSecondary,
    );

    return PopScope(
      canPop: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              TextSpan(
                style: bodyStyle,
                children: [
                  TextSpan(text: l10n.pushRelayConsentNoticePrefix),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: FluxerTextLink(
                      text: l10n.pushRelayConsentNoticeLink,
                      url: kPushRelayNoticeUrl,
                      style: bodyStyle,
                    ),
                  ),
                  TextSpan(text: l10n.pushRelayConsentNoticeSuffix),
                ],
              ),
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: onAgree,
              label: l10n.pushRelayConsentAgree,
            ),
            SizedBox(height: layout.s2),
            FluxerButton.secondary(
              onPressed: onDecline,
              label: l10n.pushRelayConsentDecline,
            ),
          ],
        ),
      ),
    );
  }
}
