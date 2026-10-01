import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_follow_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AnnouncementFollowBarrier extends StatelessWidget {
  const AnnouncementFollowBarrier({required this.channel, super.key});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: context.colors.chatInputBackground,
            border: Border(
              top: BorderSide(color: context.colors.userAreaDividerColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: PhosphorIcon(
                  PhosphorIconsFill.megaphone,
                  size: 18,
                  color: context.colors.textSecondary,
                ),
              ),
              Expanded(
                child: Text(
                  l10n.channelFollowBarrier,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSecondary,
                    height: 1.35,
                  ),
                ),
              ),
              SizedBox(width: context.layout.s2),
              FluxerButton.secondary(
                onPressed: () => unawaited(
                  ChannelFollowSheet.show(context, channel: channel),
                ),
                label: l10n.channelFollowSubmit,
                size: FluxerButtonSize.small,
                fitContent: true,
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.paddingOf(context).bottom,
          decoration: BoxDecoration(color: context.colors.chatInputBackground),
        ),
      ],
    );
  }
}
