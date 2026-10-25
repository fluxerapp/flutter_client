import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_slowmode_slider.dart';
import 'package:fluxer_app/features/threads/presentation/thread_settings_options.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ThreadDefaultsSection extends StatelessWidget {
  const ThreadDefaultsSection({
    required this.l10n,
    required this.autoArchive,
    required this.threadSlowmode,
    required this.onAutoArchiveChanged,
    required this.onThreadSlowmodeChanged,
    super.key,
  });

  final FluxerLocalizations l10n;
  final int autoArchive;
  final int threadSlowmode;
  final ValueChanged<int> onAutoArchiveChanged;
  final ValueChanged<int> onThreadSlowmodeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FluxerSelect<int>(
          label: l10n.threadDefaultAutoArchive,
          description: l10n.threadDefaultAutoArchiveDescription,
          value: autoArchive,
          stretch: true,
          enableSearch: false,
          items: threadAutoArchiveItems(l10n),
          onChanged: onAutoArchiveChanged,
        ),
        SizedBox(height: context.layout.s4),
        ChannelSlowmodeSlider(
          l10n: l10n,
          label: l10n.threadDefaultSlowmode,
          value: threadSlowmode,
          onChanged: onThreadSlowmodeChanged,
        ),
      ],
    );
  }
}

bool showChannelThreadDefaultsSection({
  required Channel channel,
  required bool canManageChannel,
}) {
  return canManageChannel && isTextThreadParentType(channel.type);
}
