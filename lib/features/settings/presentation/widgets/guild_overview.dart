import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/ui/ui.dart';

class GuildOverview extends StatelessWidget {
  final Guild guild;
  final ScrollController? scrollController;

  const GuildOverview({required this.guild, this.scrollController, super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    controller: scrollController,
    padding: const EdgeInsets.all(40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Server Overview', style: context.textStyles.heading),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondaryAlt,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  guild.name.isNotEmpty ? guild.name[0] : '?',
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We recommend an image of '
                    'at least 512x512 for '
                    'the server.',
                    style: TextStyle(
                      color: context.colors.textPrimaryMuted,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.colors.textChat,
                      side: BorderSide(color: context.colors.interactiveMuted),
                    ),
                    child: const Text('Upload Image'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        _buildSettingsField(context, 'SERVER NAME', guild.name),
        const SizedBox(height: 24),
        _buildSettingsField(
          context,
          'DESCRIPTION',
          guild.description ?? 'No description set',
        ),
        const SizedBox(height: 24),
        _buildInfoRow(context, 'Members', '${guild.memberCount}'),
        const SizedBox(height: 8),
        _buildInfoRow(context, 'Online', '${guild.onlineCount}'),
      ],
    ),
  );

  Widget _buildSettingsField(
    BuildContext context,
    String label,
    String value,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: context.colors.textPrimaryMuted,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: context.colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          value,
          style: TextStyle(color: context.colors.textChat, fontSize: 16),
        ),
      ),
    ],
  );

  Widget _buildInfoRow(BuildContext context, String label, String value) => Row(
    children: [
      Text(
        '$label: ',
        style: TextStyle(color: context.colors.textPrimaryMuted, fontSize: 14),
      ),
      Text(
        value,
        style: TextStyle(
          color: context.colors.textChat,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
