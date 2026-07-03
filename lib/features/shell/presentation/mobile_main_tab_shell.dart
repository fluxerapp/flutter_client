import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

class MobileMainTabShell extends StatelessWidget {
  const MobileMainTabShell({
    required this.navigationShell,
    required this.bottomNav,
    super.key,
  });

  final Widget navigationShell;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Column(
        children: <Widget>[
          Expanded(child: navigationShell),
          bottomNav,
        ],
      ),
    );
  }
}
