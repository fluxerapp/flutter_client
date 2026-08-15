import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/default_web_browser.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DefaultWebBrowserIcon extends StatelessWidget {
  const DefaultWebBrowserIcon({required this.browser, super.key});

  static const Size size = Size(24, 35);

  final DefaultWebBrowser browser;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(child: _buildIcon(context)),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return switch (browser) {
      DefaultWebBrowser.inApp => PhosphorIcon(
        PhosphorIconsFill.browser,
        size: 22,
        color: context.colors.textPrimary,
      ),
      DefaultWebBrowser.external => PhosphorIcon(
        PhosphorIconsFill.globe,
        size: 22,
        color: context.colors.textPrimary,
      ),
      DefaultWebBrowser.safari => Image.asset(
        _assetPath(browser),
        width: size.width,
        height: size.height,
        fit: BoxFit.contain,
      ),
      DefaultWebBrowser.qwant => SvgPicture.asset(
        _assetPath(browser),
        width: size.width,
        height: size.height,
        colorFilter: ColorFilter.mode(
          context.colors.textPrimary,
          BlendMode.srcIn,
        ),
      ),
      DefaultWebBrowser.chrome ||
      DefaultWebBrowser.firefox ||
      DefaultWebBrowser.duckDuckGo => SvgPicture.asset(
        _assetPath(browser),
        width: size.width,
        height: size.height,
      ),
    };
  }

  static String _assetPath(DefaultWebBrowser browser) {
    return switch (browser) {
      DefaultWebBrowser.chrome => 'assets/images/browsers/chrome.svg',
      DefaultWebBrowser.firefox => 'assets/images/browsers/firefox.svg',
      DefaultWebBrowser.duckDuckGo => 'assets/images/browsers/duckduckgo.svg',
      DefaultWebBrowser.safari => 'assets/images/browsers/safari.png',
      DefaultWebBrowser.qwant => 'assets/images/browsers/qwant.svg',
      _ => throw StateError('No asset for $browser'),
    };
  }
}
