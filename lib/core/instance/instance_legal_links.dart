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

enum InstanceLegalLinksPresence { both, terms, privacy }

InstanceLegalLinksPresence? instanceLegalLinksPresence({
  required String? termsUrl,
  required String? privacyUrl,
}) {
  if (termsUrl != null && privacyUrl != null) {
    return InstanceLegalLinksPresence.both;
  }
  if (termsUrl != null) {
    return InstanceLegalLinksPresence.terms;
  }
  if (privacyUrl != null) {
    return InstanceLegalLinksPresence.privacy;
  }
  return null;
}

final RegExp _legalLinkTag = RegExp(r'<(terms|privacy)>(.*?)</\1>');

List<InlineSpan> instanceLegalLinkSpans(
  String message, {
  required InlineSpan Function(String label) terms,
  required InlineSpan Function(String label) privacy,
}) {
  final List<InlineSpan> spans = <InlineSpan>[];
  int start = 0;
  for (final RegExpMatch match in _legalLinkTag.allMatches(message)) {
    if (match.start > start) {
      spans.add(TextSpan(text: message.substring(start, match.start)));
    }
    final String label = match.group(2)!;
    spans.add(match.group(1) == 'terms' ? terms(label) : privacy(label));
    start = match.end;
  }
  if (start < message.length) {
    spans.add(TextSpan(text: message.substring(start)));
  }
  return spans;
}

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
    final InstanceLegalLinksPresence? presence = instanceLegalLinksPresence(
      termsUrl: termsUrl,
      privacyUrl: privacyUrl,
    );
    if (presence == null) {
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
      message: FluxerLocalizations.of(
        context,
      ).instanceLegalLinksList(presence.name),
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
    required this.message,
    this.textAlign = TextAlign.center,
    this.baseStyle,
    this.linkStyle,
    this.forSignIn = false,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final String Function(String links) message;
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
    final InstanceLegalLinksPresence? presence = instanceLegalLinksPresence(
      termsUrl: termsUrl,
      privacyUrl: privacyUrl,
    );
    if (presence == null) {
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
      message: message(presence.name),
      termsUrl: termsUrl,
      privacyUrl: privacyUrl,
      baseStyle: muted,
      linkStyle: links,
      textAlign: textAlign,
    );
    return padding == EdgeInsets.zero
        ? text
        : Padding(padding: padding, child: text);
  }
}

class _LegalLinksText extends StatefulWidget {
  const _LegalLinksText({
    required this.message,
    required this.termsUrl,
    required this.privacyUrl,
    required this.baseStyle,
    required this.linkStyle,
    required this.textAlign,
  });

  final String message;
  final String? termsUrl;
  final String? privacyUrl;
  final TextStyle baseStyle;
  final TextStyle linkStyle;
  final TextAlign textAlign;

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

  TextSpan _link(String label, TapGestureRecognizer recognizer) {
    return TextSpan(
      text: label,
      style: widget.linkStyle,
      recognizer: recognizer,
      mouseCursor: SystemMouseCursors.click,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: widget.baseStyle,
        children: instanceLegalLinkSpans(
          widget.message,
          terms: (String label) => _link(label, _termsRecognizer),
          privacy: (String label) => _link(label, _privacyRecognizer),
        ),
      ),
      textAlign: widget.textAlign,
    );
  }
}
