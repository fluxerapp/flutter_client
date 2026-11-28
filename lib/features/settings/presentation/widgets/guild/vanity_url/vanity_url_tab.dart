import 'package:fluxer_app/features/settings/presentation/widgets/desktop_settings_text.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/vanity_url/vanity_url_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildVanityUrlTab extends StatelessWidget {
  const GuildVanityUrlTab({
    required this.guildId,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DesktopSettingsPageTitle(
            title: l10n.guildVanityUrlTitle,
            description: l10n.guildVanityUrlDescription,
          ),
          const SizedBox(height: 16),
          GuildVanityUrlSection(guildId: guildId, showHeader: false),
        ],
      ),
    );
  }
}
