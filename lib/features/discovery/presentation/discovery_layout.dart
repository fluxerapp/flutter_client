import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/presentation/discovery_page.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/root_overlay_back_scope.dart';

class DiscoveryLayout extends StatelessWidget {
  const DiscoveryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const Widget page = DiscoveryPage();
    if (!isMobileLayout(context)) {
      return page;
    }
    return RootOverlayBackScope(
      child: Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        body: page,
      ),
    );
  }
}
