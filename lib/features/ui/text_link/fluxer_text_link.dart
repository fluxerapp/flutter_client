import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class FluxerTextLink extends StatelessWidget {
  const FluxerTextLink({
    required this.text,
    this.url,
    this.onTap,
    this.style,
    this.color,
    this.selectable = false,
    super.key,
  });

  final String text;
  final String? url;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Color? color;
  final bool selectable;

  void _handleTap(BuildContext context) {
    if (onTap != null) {
      onTap!();
      return;
    }
    if (url != null) {
      unawaited(handleExternalLinkTap(context, url!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final baseStyle = (style ?? DefaultTextStyle.of(context).style).copyWith(
      color: color ?? colors.textLink,
    );

    return FluxerTappable(
      onTap: () => _handleTap(context),
      link: true,
      linkUrl: url != null ? Uri.tryParse(url!) : null,
      button: false,
      semanticLabel: text,
      excludeChildSemantics: !selectable,
      builder: (context, states) {
        final isHovered = states.contains(WidgetState.hovered);
        final linkStyle = baseStyle.copyWith(
          decoration: isHovered
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: baseStyle.color,
        );

        if (selectable) {
          return SelectableText(text, style: linkStyle);
        }

        return Text(text, style: linkStyle);
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerTextLink')
Widget fluxerTextLinkPreview() {
  return FluxerTextLink(text: 'Open documentation', onTap: () {});
}
