import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class StaffOnlyGuildNagbar extends ConsumerWidget {
  const StaffOnlyGuildNagbar({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Guild? guild = ref.watch(guildByIdProvider(guildId)).value;
    if (guild == null || !isGuildStaffOnlyAccessible(guild)) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: context.colors.statusDanger,
      textColor: Colors.white,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.guildStaffOnlyAccessibleNagbar(
          guild.name,
          ref.watch(
            instanceRuntimeConfigProvider.select(
              (config) => config.productName,
            ),
          ),
        ),
      ),
    );
  }
}
