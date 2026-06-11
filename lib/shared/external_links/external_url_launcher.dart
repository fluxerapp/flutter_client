import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
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
    toolbarBackgroundColor: style.toolbarBackground,
    navigationBarColor: style.navigationBar,
    navigationBarDividerColor: style.navigationBarDivider,
    secondaryToolbarColor: style.toolbarBackground,
    preferredBarTintColor: style.toolbarBackground,
    preferredControlTintColor: style.controlTint,
  );
}

Future<bool> openExternalUrl(Uri uri, {ExternalUrlBrowserStyle? style}) async {
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    try {
      await _chromeSafariBrowser.open(
        url: WebUri(uri.toString()),
        settings: style != null
            ? _buildBrowserSettings(style)
            : ChromeSafariBrowserSettings(barCollapsingEnabled: true),
      );
      return true;
    } on Object {
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}
