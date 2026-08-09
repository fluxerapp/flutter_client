import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/features/settings/domain/default_web_browser.dart';
import 'package:url_launcher/url_launcher.dart';

const MethodChannel _browserLaunchChannel = MethodChannel(
  'fluxer_app/browser_launch',
);

String? browserLaunchUrlForIos(DefaultWebBrowser browser, Uri uri) {
  return switch (browser) {
    DefaultWebBrowser.chrome => _chromeIosLaunchUrl(uri),
    DefaultWebBrowser.firefox =>
      'firefox://open-url?url=${Uri.encodeComponent(uri.toString())}',
    DefaultWebBrowser.duckDuckGo => 'ddgQuickLink://$uri',
    DefaultWebBrowser.qwant =>
      'qwantbrowser://open?url=${Uri.encodeComponent(uri.toString())}',
    _ => null,
  };
}

String? _chromeIosLaunchUrl(Uri uri) {
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    return null;
  }
  final String scheme = uri.scheme == 'https'
      ? 'googlechromes'
      : 'googlechrome';
  final String authority = uri.hasPort && uri.port != 80 && uri.port != 443
      ? '${uri.host}:${uri.port}'
      : uri.host;
  final String path = uri.path.isEmpty ? '' : uri.path;
  final String query = uri.hasQuery ? '?${uri.query}' : '';
  final String fragment = uri.hasFragment ? '#${uri.fragment}' : '';
  return '$scheme://$authority$path$query$fragment';
}

String? androidBrowserPackageName(DefaultWebBrowser browser) {
  return switch (browser) {
    DefaultWebBrowser.chrome => 'com.android.chrome',
    DefaultWebBrowser.firefox => 'org.mozilla.firefox',
    DefaultWebBrowser.duckDuckGo => 'com.duckduckgo.mobile.android',
    DefaultWebBrowser.qwant => 'com.qwant.liberty',
    _ => null,
  };
}

Future<bool> launchInSpecificBrowser(Uri uri, DefaultWebBrowser browser) async {
  if (kIsWeb) {
    return false;
  }
  if (Platform.isIOS) {
    final String? launchUrlString = browserLaunchUrlForIos(browser, uri);
    if (launchUrlString == null) {
      return false;
    }
    final Uri? launchUri = Uri.tryParse(launchUrlString);
    if (launchUri == null) {
      return false;
    }
    return launchUrl(launchUri, mode: LaunchMode.externalApplication);
  }
  if (Platform.isAndroid) {
    final String? packageName = androidBrowserPackageName(browser);
    if (packageName == null) {
      return false;
    }
    try {
      final bool? launched = await _browserLaunchChannel.invokeMethod<bool>(
        'openUrlInBrowser',
        <String, String>{'url': uri.toString(), 'packageName': packageName},
      );
      return launched ?? false;
    } on PlatformException {
      return false;
    }
  }
  return false;
}

Future<bool> launchInDefaultWebBrowser(
  Uri uri,
  DefaultWebBrowser browser,
) async {
  switch (browser) {
    case DefaultWebBrowser.external:
    case DefaultWebBrowser.safari:
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    case DefaultWebBrowser.chrome:
    case DefaultWebBrowser.firefox:
    case DefaultWebBrowser.duckDuckGo:
    case DefaultWebBrowser.qwant:
      if (await launchInSpecificBrowser(uri, browser)) {
        return true;
      }
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    case DefaultWebBrowser.inApp:
      return false;
  }
}
