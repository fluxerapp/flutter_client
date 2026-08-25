import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSettingsStatusSlate extends StatelessWidget {
  const ChannelSettingsStatusSlate({
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
    this.fullHeight = true,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool fullHeight;

  @override
  Widget build(BuildContext context) {
    final Widget content = Padding(
      padding: EdgeInsets.all(context.layout.s8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PhosphorIcon(icon, size: 40, color: context.colors.textPrimaryMuted),
          SizedBox(height: context.layout.s3),
          Text(
            title,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textChat,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.layout.s1),
          Text(
            description,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          if (actionLabel != null && onAction != null) ...<Widget>[
            SizedBox(height: context.layout.s4),
            FluxerButton.primary(label: actionLabel, onPressed: onAction),
          ],
        ],
      ),
    );
    if (!fullHeight) {
      return content;
    }
    return Center(child: content);
  }
}
