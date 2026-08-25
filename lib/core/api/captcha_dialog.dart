import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_captcha/fluxer_captcha.dart';

const Duration _kNavigatorContextPollInterval = Duration(milliseconds: 100);
const int _kNavigatorContextMaxAttempts = 10;

/// Shows a captcha verification modal that supports error display and provider
/// switching.
///
/// Returns a record of `(token, providerUsed)` on success, or `null` if
/// cancelled.
Future<(String, CaptchaProvider)?> showCaptchaDialog({
  required GlobalKey<NavigatorState> navigatorKey,
  required CaptchaProvider preferredProvider,
  required String? turnstileSiteKey,
  required String? hcaptchaSiteKey,
  required String baseUrl,
}) async {
  for (var attempt = 0; attempt < _kNavigatorContextMaxAttempts; attempt++) {
    final context = navigatorKey.currentState?.context;
    if (context != null && context.mounted) {
      return _showCaptchaDialogWithContext(
        context: context,
        preferredProvider: preferredProvider,
        turnstileSiteKey: turnstileSiteKey,
        hcaptchaSiteKey: hcaptchaSiteKey,
        baseUrl: baseUrl,
      );
    }
    await Future<void>.delayed(_kNavigatorContextPollInterval);
    await SchedulerBinding.instance.endOfFrame;
  }
  return null;
}

Future<(String, CaptchaProvider)?> _showCaptchaDialogWithContext({
  required BuildContext context,
  required CaptchaProvider preferredProvider,
  required String? turnstileSiteKey,
  required String? hcaptchaSiteKey,
  required String baseUrl,
}) {
  final l10n = FluxerLocalizations.of(context);

  return FluxerModal.show<(String, CaptchaProvider)>(
    context,
    title: l10n.captchaTitle,
    builder: (dialogContext, close) => _CaptchaDialogContent(
      preferredProvider: preferredProvider,
      turnstileSiteKey: turnstileSiteKey,
      hcaptchaSiteKey: hcaptchaSiteKey,
      baseUrl: baseUrl,
      onVerified: (token, provider) {
        Navigator.of(dialogContext).pop((token, provider));
      },
    ),
    actions: [
      FluxerButton.secondary(
        onPressed: () => Navigator.of(context).pop(),
        label: l10n.cancel,
        fitContent: true,
      ),
    ],
  );
}

class _CaptchaDialogContent extends StatefulWidget {
  const _CaptchaDialogContent({
    required this.preferredProvider,
    required this.turnstileSiteKey,
    required this.hcaptchaSiteKey,
    required this.baseUrl,
    required this.onVerified,
  });

  final CaptchaProvider preferredProvider;
  final String? turnstileSiteKey;
  final String? hcaptchaSiteKey;
  final String baseUrl;
  final void Function(String token, CaptchaProvider provider) onVerified;

  @override
  State<_CaptchaDialogContent> createState() => _CaptchaDialogContentState();
}

class _CaptchaDialogContentState extends State<_CaptchaDialogContent> {
  late CaptchaProvider _currentProvider;
  String? _error;

  @override
  void initState() {
    super.initState();
    _currentProvider = _resolveInitialProvider();
  }

  CaptchaProvider _resolveInitialProvider() {
    if (widget.preferredProvider == CaptchaProvider.turnstile &&
        widget.turnstileSiteKey != null) {
      return CaptchaProvider.turnstile;
    }
    if (widget.preferredProvider == CaptchaProvider.hcaptcha &&
        widget.hcaptchaSiteKey != null) {
      return CaptchaProvider.hcaptcha;
    }
    if (widget.turnstileSiteKey != null) {
      return CaptchaProvider.turnstile;
    }
    return CaptchaProvider.hcaptcha;
  }

  String? get _currentSiteKey => _currentProvider == CaptchaProvider.turnstile
      ? widget.turnstileSiteKey
      : widget.hcaptchaSiteKey;

  bool get _canSwitch {
    final alternateKey = _currentProvider == CaptchaProvider.turnstile
        ? widget.hcaptchaSiteKey
        : widget.turnstileSiteKey;
    return alternateKey != null;
  }

  void _switchProvider() {
    setState(() {
      _error = null;
      _currentProvider = _currentProvider == CaptchaProvider.turnstile
          ? CaptchaProvider.hcaptcha
          : CaptchaProvider.turnstile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final siteKey = _currentSiteKey;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.captchaDescription,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
        ),
        SizedBox(height: layout.s3),
        if (_error != null) ...[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(layout.s3),
            decoration: BoxDecoration(
              color: colors.textDanger.withValues(alpha: 0.1),
              borderRadius: layout.radiusSm,
            ),
            child: Text(
              _error!,
              style: textStyles.bodySmall.copyWith(color: colors.textDanger),
            ),
          ),
          SizedBox(height: layout.s3),
        ],
        if (siteKey != null)
          FluxerCaptcha(
            key: ValueKey(_currentProvider),
            provider: _currentProvider,
            siteKey: siteKey,
            baseUrl: widget.baseUrl,
            options: CaptchaOptions(theme: CaptchaTheme.dark),
            onTokenReceived: (token) {
              widget.onVerified(token, _currentProvider);
            },
            onError: (error) {
              setState(() {
                _error = error.message;
              });
            },
          ),
        if (_canSwitch) ...[
          SizedBox(height: layout.s4),
          FluxerGestureDetector(
            onTap: _switchProvider,
            child: Text(
              _currentProvider == CaptchaProvider.turnstile
                  ? l10n.captchaSwitchToHcaptcha
                  : l10n.captchaSwitchToTurnstile,
              style: textStyles.bodySmall.copyWith(color: colors.textLink),
            ),
          ),
        ],
      ],
    );
  }
}
