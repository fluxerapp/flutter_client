import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InvalidDeepLinkScreen extends StatelessWidget {
  const InvalidDeepLinkScreen({this.uri, super.key});

  final Uri? uri;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: context.colors.backgroundTertiary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: PhosphorIcon(
                    PhosphorIconsFill.linkBreak,
                    size: 36,
                    color: context.colors.textTertiaryMuted,
                  ),
                ),
              ),
              SizedBox(height: layout.s4),
              Text(
                l10n.invalidDeepLinkTitle,
                textAlign: TextAlign.center,
                style: context.textStyles.heading.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              SizedBox(height: layout.s2),
              Text(
                l10n.invalidDeepLinkDescription,
                textAlign: TextAlign.center,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                  height: 1.4,
                ),
              ),
              SizedBox(height: layout.s6),
              SizedBox(
                width: double.infinity,
                child: FluxerButton.primary(
                  label: l10n.invalidDeepLinkGoHomeButton,
                  onPressed: () => context.go(RoutePaths.me),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
