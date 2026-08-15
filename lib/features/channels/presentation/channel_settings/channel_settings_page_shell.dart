import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Color channelSettingsPageBackgroundColor(BuildContext context) {
  if (isMobileLayout(context)) {
    return context.colors.backgroundSecondary;
  }
  return context.colors.backgroundPrimary;
}

class ChannelSettingsPageShell extends StatelessWidget {
  const ChannelSettingsPageShell({
    required this.tab,
    required this.body,
    super.key,
  });

  final ChannelSettingsTab tab;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final Color backgroundColor = channelSettingsPageBackgroundColor(context);
    final Color appBarColor = isMobile
        ? backgroundColor
        : context.colors.backgroundSecondary;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(channelSettingsTabTitle(l10n, tab)),
        actions: const <Widget>[SizedBox(width: 48)],
      ),
      body: body,
    );
  }
}
