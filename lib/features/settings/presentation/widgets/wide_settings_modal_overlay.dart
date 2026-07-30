import 'package:flutter/material.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:go_router/go_router.dart';

class WideSettingsModalOverlay extends StatelessWidget {
  const WideSettingsModalOverlay({
    required this.child,
    this.maxModalWidth = kWideSettingsModalMaxWidth,
    super.key,
  });

  final Widget child;
  final double maxModalWidth;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets insets = wideSettingsModalInsets(
      context,
      maxModalWidth: maxModalWidth,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: () => context.pop(),
            behavior: HitTestBehavior.opaque,
            child: ColoredBox(color: Colors.black.withValues(alpha: 0.35)),
          ),
          Padding(
            padding: insets,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxModalWidth),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
