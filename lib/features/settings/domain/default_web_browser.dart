import 'dart:io';

import 'package:fluxer_app/core/platform/fluxer_platform.dart';

enum DefaultWebBrowser {
  inApp,
  external,
  qwant,
  safari,
  duckDuckGo,
  firefox,
  chrome;

  static const List<DefaultWebBrowser> mobileDisplayOrder = [
    DefaultWebBrowser.inApp,
    DefaultWebBrowser.external,
    DefaultWebBrowser.qwant,
    DefaultWebBrowser.safari,
    DefaultWebBrowser.duckDuckGo,
    DefaultWebBrowser.firefox,
    DefaultWebBrowser.chrome,
  ];

  static DefaultWebBrowser fromName(String? name) {
    if (name == null || name.isEmpty) {
      return DefaultWebBrowser.inApp;
    }
    return DefaultWebBrowser.values.firstWhere(
      (DefaultWebBrowser browser) => browser.name == name,
      orElse: () => DefaultWebBrowser.inApp,
    );
  }

  bool get isAvailableOnCurrentPlatform {
    if (!isFluxerNativeMobileOs) {
      return false;
    }
    return switch (this) {
      DefaultWebBrowser.inApp ||
      DefaultWebBrowser.external ||
      DefaultWebBrowser.qwant ||
      DefaultWebBrowser.duckDuckGo ||
      DefaultWebBrowser.firefox ||
      DefaultWebBrowser.chrome => true,
      DefaultWebBrowser.safari => Platform.isIOS,
    };
  }

  static DefaultWebBrowser resolveStored(String? name) {
    final DefaultWebBrowser browser = fromName(name);
    return browser.isAvailableOnCurrentPlatform
        ? browser
        : DefaultWebBrowser.inApp;
  }
}

List<DefaultWebBrowser> availableDefaultWebBrowsers() {
  return DefaultWebBrowser.mobileDisplayOrder
      .where(
        (DefaultWebBrowser browser) => browser.isAvailableOnCurrentPlatform,
      )
      .toList(growable: false);
}
