import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';

class MobileChannelsRootShell extends StatelessWidget {
  const MobileChannelsRootShell({
    required this.shellLocation,
    required this.bottomNav,
    super.key,
  });

  final String shellLocation;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Column(
        children: <Widget>[
          Expanded(child: mobileSidebarForLocation(context, shellLocation)),
          bottomNav,
        ],
      ),
    );
  }
}
