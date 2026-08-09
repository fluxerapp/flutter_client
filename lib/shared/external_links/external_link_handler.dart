import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_navigator.dart';
import 'package:fluxer_app/features/settings/providers/default_apps_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/external_links/external_link_warning_sheet.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';

/// Opens a URL using the app-wide trusted-domain warning flow.
Future<void> handleExternalLinkTap(
  BuildContext context,
  String url, {
  bool useRootNavigator = false,
}) async {
  if (isInviteLink(url)) {
    await handleInviteLinkTap(context, url);
    return;
  }

  final uri = Uri.tryParse(url);
  if (uri == null) {
    return;
  }

  if (!_shouldWarnForUri(uri)) {
    await _openExternalUrl(context, uri);
    return;
  }

  final container = ProviderScope.containerOf(context, listen: false);
  final notifier = container.read(userSettingsViewModelProvider.notifier);

  if (notifier.isTrustedDomain(uri.host)) {
    await _openExternalUrl(context, uri);
    return;
  }

  if (!context.mounted) {
    return;
  }

  await ExternalLinkWarningSheet.show(
    context,
    url: url,
    hostname: uri.host,
    useRootNavigator: useRootNavigator,
    onContinue: ({required bool trustDomain}) async {
      if (trustDomain) {
        await notifier.addTrustedDomain(uri.host);
      }

      if (!context.mounted) {
        return;
      }

      await _openExternalUrl(context, uri);
    },
  );
}

bool _shouldWarnForUri(Uri uri) {
  return (uri.scheme == 'http' || uri.scheme == 'https') && uri.host.isNotEmpty;
}

Future<void> _openExternalUrl(BuildContext context, Uri uri) async {
  final container = ProviderScope.containerOf(context, listen: false);
  final browser = container.read(defaultAppsPreferencesProvider);
  await openExternalUrl(
    uri,
    style: ExternalUrlBrowserStyle.fromColorTheme(context.colors),
    browser: browser,
  );
}
