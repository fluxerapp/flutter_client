import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatVideoPlaybackFailureOverlay extends StatelessWidget {
  const ChatVideoPlaybackFailureOverlay({
    required this.fallbackUrl,
    this.useRootNavigator = false,
    this.onClose,
    this.onOpenOptions,
    super.key,
  });

  final String fallbackUrl;
  final bool useRootNavigator;
  final VoidCallback? onClose;
  final VoidCallback? onOpenOptions;

  bool get _canOpenInBrowser => fallbackUrl.isNotEmpty;

  Future<void> _openInBrowser(BuildContext context) async {
    if (!_canOpenInBrowser) {
      return;
    }
    await handleExternalLinkTap(
      context,
      fallbackUrl,
      useRootNavigator: useRootNavigator,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const PhosphorIcon(
            PhosphorIconsFill.warningCircle,
            color: Colors.white70,
            size: 40,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.chatVideoPlaybackFailed,
            textAlign: TextAlign.center,
            style: context.textStyles.channelName.copyWith(color: Colors.white),
          ),
          if (_canOpenInBrowser) ...<Widget>[
            const SizedBox(height: 20),
            FluxerButton.primary(
              onPressed: () => _openInBrowser(context),
              label: l10n.mediaViewerOpenInBrowser,
              trailingIcon: PhosphorIconsBold.arrowSquareOut,
            ),
          ],
        ],
      ),
    );
    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.82),
      child: SafeArea(
        child: onClose == null
            ? Center(child: content)
            : Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Center(child: content),
                  Positioned(
                    top: 4,
                    left: 8,
                    child: IconButton(
                      onPressed: onClose,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withValues(alpha: 0.5),
                        foregroundColor: Colors.white,
                      ),
                      tooltip: l10n.mediaViewerClose,
                      icon: const PhosphorIcon(
                        PhosphorIconsBold.x,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  if (onOpenOptions != null)
                    Positioned(
                      top: 4,
                      right: 8,
                      child: IconButton(
                        onPressed: onOpenOptions,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withValues(alpha: 0.5),
                          foregroundColor: Colors.white,
                        ),
                        tooltip: l10n.mediaViewerOptions,
                        icon: const PhosphorIcon(
                          PhosphorIconsBold.dotsThree,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
