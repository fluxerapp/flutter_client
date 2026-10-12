import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_acronym.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildBottomSheetAvatar extends StatelessWidget {
  final Guild guild;

  const GuildBottomSheetAvatar({required this.guild, super.key});

  @override
  Widget build(BuildContext context) {
    final iconUrl = guild.iconUrl;

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: FluxerBottomSheet.cardColorOf(context),
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: iconUrl != null
          ? CachedNetworkImage(
              imageUrl: iconUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => FluxerGuildAcronym(name: guild.name),
            )
          : FluxerGuildAcronym(name: guild.name),
    );
  }
}
