import 'package:fluxer_app/features/guilds/presentation/widgets/guild_unavailable_screen.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UnrecognizedChannelView extends StatelessWidget {
  const UnrecognizedChannelView({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return GuildUnavailableScreen(
      title: l10n.channelUnsupportedTitle,
      description: l10n.channelUnsupportedBody,
      icon: PhosphorIconsFill.warningCircle,
    );
  }
}
