import 'dart:io';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/features/settings/domain/default_web_browser.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/platform_browser_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalUrlBrowserStyle {
  const ExternalUrlBrowserStyle({
    required this.toolbarBackground,
    required this.controlTint,
    required this.navigationBar,
    required this.navigationBarDivider,
  });

  factory ExternalUrlBrowserStyle.fromColorTheme(FluxerColorTheme colors) {
    return ExternalUrlBrowserStyle(
      toolbarBackground: colors.backgroundHeaderPrimary,
      controlTint: colors.textPrimary,
      navigationBar: colors.backgroundPrimary,
      navigationBarDivider: colors.borderColor,
    );
  }

  final Color toolbarBackground;
  final Color controlTint;
  final Color navigationBar;
  final Color navigationBarDivider;
}

class FluxerChromeSafariBrowser extends ChromeSafariBrowser {}

final FluxerChromeSafariBrowser _chromeSafariBrowser =
    FluxerChromeSafariBrowser();

final RegExp _bareEmailPattern = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

ChromeSafariBrowserSettings _buildBrowserSettings(
  ExternalUrlBrowserStyle style,
) {
  return ChromeSafariBrowserSettings(
    barCollapsingEnabled: true,
    noHistory: Platform.isAndroid,
    toolbarBackgroundColor: style.toolbarBackground,
    navigationBarColor: style.navigationBar,
    navigationBarDividerColor: style.navigationBarDivider,
    secondaryToolbarColor: style.toolbarBackground,
    preferredBarTintColor: style.toolbarBackground,
    preferredControlTintColor: style.controlTint,
  );
}

Uri? parseExternalLinkUri(String url) {
  final String trimmed = url.trim();
  final Uri? uri = Uri.tryParse(trimmed);
  if (uri == null) {
    return null;
  }
  if (uri.scheme.isEmpty && _bareEmailPattern.hasMatch(trimmed)) {
    return Uri(scheme: 'mailto', path: trimmed);
  }
  return uri;
}

bool _canOpenInSafariView(Uri uri) {
  final String scheme = uri.scheme.toLowerCase();
  if (scheme != 'http' && scheme != 'https') {
    return false;
  }
  return uri.host.isNotEmpty && uri.userInfo.isEmpty;
}

Future<bool> _tryLaunch(Uri uri, LaunchMode mode) async {
  try {
    return await launchUrl(uri, mode: mode);
  } on Object {
    return false;
  }
}

Future<bool> _launchNativeApp(Uri uri) async {
  if (await _tryLaunch(uri, LaunchMode.externalNonBrowserApplication)) {
    return true;
  }
  return _tryLaunch(uri, LaunchMode.externalApplication);
}

Future<void> closeInAppBrowserIfOpen() async {
  if (!Platform.isAndroid || !_chromeSafariBrowser.isOpened()) {
    return;
  }
  try {
    await _chromeSafariBrowser.close();
  } on Object {
    // Ignore already closed error
  }
}

Future<void> _closeInAppBrowserBestEffort() async {
  try {
    await _chromeSafariBrowser.close();
  } on Object {
    // Ignore stale session close errors
  }
}

Future<bool> _openInAppBrowser(
  Uri uri, {
  ExternalUrlBrowserStyle? style,
}) async {
  try {
    final WebUri webUri = WebUri(uri.toString());
    if (Platform.isAndroid) {
      if (_chromeSafariBrowser.isOpened()) {
        try {
          await _chromeSafariBrowser.launchUrl(url: webUri);
          return true;
        } on Object {
          await _closeInAppBrowserBestEffort();
        }
      } else {
        await _closeInAppBrowserBestEffort();
      }
    } else if (_chromeSafariBrowser.isOpened()) {
      await _chromeSafariBrowser.close();
    }
    await _chromeSafariBrowser.open(
      url: webUri,
      settings: style != null
          ? _buildBrowserSettings(style)
          : ChromeSafariBrowserSettings(
              barCollapsingEnabled: true,
              noHistory: Platform.isAndroid,
            ),
    );
    return true;
  } on Object {
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<bool> openExternalUrl(
  Uri uri, {
  ExternalUrlBrowserStyle? style,
  DefaultWebBrowser browser = DefaultWebBrowser.inApp,
}) async {
  if (!isFluxerNativeMobileOs) {
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  final String scheme = uri.scheme.toLowerCase();
  if (scheme == 'mailto' || scheme == 'tel' || scheme == 'sms') {
    return _launchNativeApp(uri);
  }

  if (!_canOpenInSafariView(uri)) {
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  if (await _tryLaunch(uri, LaunchMode.externalNonBrowserApplication)) {
    return true;
  }

  if (browser == DefaultWebBrowser.inApp) {
    return _openInAppBrowser(uri, style: style);
  }
  return launchInDefaultWebBrowser(uri, browser);
}
