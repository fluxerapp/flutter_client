import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_header.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_sidebar.dart';

class DiscoverySidebarColumn extends StatelessWidget {
  const DiscoverySidebarColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.channelSidebarBackground,
      child: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DiscoveryHeader(),
            Expanded(child: DiscoverySidebar()),
          ],
        ),
      ),
    );
  }
}
