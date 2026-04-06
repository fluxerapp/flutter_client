import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/external_links/external_link_warning_modal.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens a URL using the app-wide trusted-domain warning flow.
Future<void> handleExternalLinkTap(BuildContext context, String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) {
    return;
  }

  if (!_shouldWarnForUri(uri)) {
    await _openExternalUrl(uri);
    return;
  }

  final container = ProviderScope.containerOf(context, listen: false);
  final notifier = container.read(userSettingsViewModelProvider.notifier);

  if (notifier.isTrustedDomain(uri.host)) {
    await _openExternalUrl(uri);
    return;
  }

  if (!context.mounted) {
    return;
  }

  await ExternalLinkWarningModal.show(
    context,
    url: url,
    hostname: uri.host,
    onContinue: (trustDomain) async {
      if (trustDomain) {
        await notifier.addTrustedDomain(uri.host);
      }

      await _openExternalUrl(uri);
    },
  );
}

bool _shouldWarnForUri(Uri uri) {
  return (uri.scheme == 'http' || uri.scheme == 'https') && uri.host.isNotEmpty;
}

Future<void> _openExternalUrl(Uri uri) async {
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
