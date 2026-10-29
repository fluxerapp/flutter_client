import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_material_wrap.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/material_ui.dart';

class HostedUiRootScaffold extends StatelessWidget {
  const HostedUiRootScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!hasIphoneDuoSideStrip(context)) {
      return child;
    }
    return AdaptiveScaffold(
      backgroundColor: context.colors.backgroundPrimary,
      resizeToAvoidBottomInset: false,
      appBar: const AdaptiveAppBar(),
      body: hostedUiMaterialWrap(context, child: child),
    );
  }
}
