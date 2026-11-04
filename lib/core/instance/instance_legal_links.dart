import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class InstanceLegalLinks extends ConsumerWidget {
  const InstanceLegalLinks({
    this.textAlign = TextAlign.center,
    this.baseStyle,
    this.linkStyle,
    super.key,
  });

  final TextAlign textAlign;
  final TextStyle? baseStyle;
  final TextStyle? linkStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final InstanceConfigSnapshot instance = ref.watch(
      refreshedActiveInstanceProvider,
    );
    final String? termsUrl = instance.termsUrl;
    final String? privacyUrl = instance.privacyUrl;
    if (termsUrl == null && privacyUrl == null) {
      return const SizedBox.shrink();
    }

    final TextStyle muted =
        baseStyle ??
        context.textStyles.timestamp.copyWith(
          color: context.colors.textPrimaryMuted,
        );
    final TextStyle links =
        linkStyle ?? muted.copyWith(color: context.colors.textLink);

    return _LegalLinksText(
      termsUrl: termsUrl,
      privacyUrl: privacyUrl,
      baseStyle: muted,
      linkStyle: links,
      textAlign: textAlign,
    );
  }
}

class InstanceLegalAgreementText extends ConsumerWidget {
  const InstanceLegalAgreementText({
    required this.prefix,
    this.textAlign = TextAlign.center,
    this.baseStyle,
    this.linkStyle,
    this.forSignIn = false,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final String prefix;
  final TextAlign textAlign;
  final TextStyle? baseStyle;
  final TextStyle? linkStyle;
  final bool forSignIn;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final InstanceConfigSnapshot instance = ref.watch(
      forSignIn
          ? authInstanceLegalSnapshotProvider
          : refreshedActiveInstanceProvider,
    );
    final String? termsUrl = instance.termsUrl;
    final String? privacyUrl = instance.privacyUrl;
    if (termsUrl == null && privacyUrl == null) {
      return const SizedBox.shrink();
    }

    final TextStyle muted =
        baseStyle ??
        context.textStyles.timestamp.copyWith(
          fontSize: 12,
          color: context.colors.textPrimaryMuted,
          height: 1.5,
        );
    final TextStyle links =
        linkStyle ?? muted.copyWith(color: context.colors.textLink);

    final Widget text = _LegalLinksText(
      termsUrl: termsUrl,
      privacyUrl: privacyUrl,
      baseStyle: muted,
      linkStyle: links,
      textAlign: textAlign,
      prefix: prefix,
      suffix: '.',
    );
    return padding == EdgeInsets.zero
        ? text
        : Padding(padding: padding, child: text);
  }
}

class _LegalLinksText extends StatefulWidget {
  const _LegalLinksText({
    required this.termsUrl,
    required this.privacyUrl,
    required this.baseStyle,
    required this.linkStyle,
    required this.textAlign,
    this.prefix = '',
    this.suffix = '',
  });

  final String? termsUrl;
  final String? privacyUrl;
  final TextStyle baseStyle;
  final TextStyle linkStyle;
  final TextAlign textAlign;
  final String prefix;
  final String suffix;

  @override
  State<_LegalLinksText> createState() => _LegalLinksTextState();
}

class _LegalLinksTextState extends State<_LegalLinksText> {
  late final TapGestureRecognizer _termsRecognizer = TapGestureRecognizer()
    ..onTap = () => _open(widget.termsUrl);
  late final TapGestureRecognizer _privacyRecognizer = TapGestureRecognizer()
    ..onTap = () => _open(widget.privacyUrl);

  void _open(String? url) {
    if (url != null) {
      unawaited(handleExternalLinkTap(context, url));
    }
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? termsUrl = widget.termsUrl;
    final String? privacyUrl = widget.privacyUrl;
    return Text.rich(
      TextSpan(
        style: widget.baseStyle,
        children: [
          if (widget.prefix.isNotEmpty) TextSpan(text: widget.prefix),
          if (termsUrl != null)
            TextSpan(
              text: l10n.premiumTermsOfService,
              style: widget.linkStyle,
              recognizer: _termsRecognizer,
              mouseCursor: SystemMouseCursors.click,
            ),
          if (termsUrl != null && privacyUrl != null)
            TextSpan(text: l10n.premiumDisclaimerAgreementMiddle),
          if (privacyUrl != null)
            TextSpan(
              text: l10n.premiumPrivacyPolicy,
              style: widget.linkStyle,
              recognizer: _privacyRecognizer,
              mouseCursor: SystemMouseCursors.click,
            ),
          if (widget.suffix.isNotEmpty) TextSpan(text: widget.suffix),
        ],
      ),
      textAlign: widget.textAlign,
    );
  }
}
