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

bool _isHttpOrHttps(Uri uri) => uri.scheme == 'http' || uri.scheme == 'https';

Future<bool> _tryLaunchInNativeApp(Uri uri) async {
  try {
    return await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
  } on Object {
    return false;
  }
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
  if (isFluxerNativeMobileOs && _isHttpOrHttps(uri)) {
    if (await _tryLaunchInNativeApp(uri)) {
      return true;
    }
    if (browser == DefaultWebBrowser.inApp) {
      return _openInAppBrowser(uri, style: style);
    }
    return launchInDefaultWebBrowser(uri, browser);
  }
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}
