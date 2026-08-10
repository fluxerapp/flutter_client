import 'package:flutter/material.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
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
    return Navigator(
      key: shellTabOverlayNavigatorKey,
      onGenerateInitialRoutes: (NavigatorState navigator, String initialRoute) {
        return <Route<void>>[
          MaterialPageRoute<void>(
            builder: (BuildContext navContext) => Scaffold(
              backgroundColor: context.colors.backgroundPrimary,
              body: Column(
                children: <Widget>[
                  Expanded(child: navigationShell),
                  bottomNav,
                ],
              ),
            ),
          ),
        ];
      },
    );
  }
}
