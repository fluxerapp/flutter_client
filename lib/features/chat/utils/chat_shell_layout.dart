import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

Color channelChatShellBackgroundForLayout({
  required FluxerColorTheme colors,
  required bool mobileLayout,
  required bool duoHostedUi,
}) {
  if (mobileLayout && !duoHostedUi) {
    return colors.chatInputBackground;
  }
  return colors.chatBackground;
}

Color channelChatShellBackgroundColor(BuildContext context) {
  return channelChatShellBackgroundForLayout(
    colors: context.colors,
    mobileLayout: isMobileLayout(context),
    duoHostedUi: usesIphoneDuoHostedUi(context),
  );
}

Color channelChatHostedUiBleedColor(BuildContext context) {
  if (hasIphoneDuoSideStrip(context)) {
    return context.colors.chatBackground;
  }
  return channelChatShellBackgroundColor(context);
}
