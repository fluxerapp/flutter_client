import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/time_format_providers.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';

const Duration kMessageTimestampTooltipDelay = Duration(milliseconds: 750);

class MessageTimestampTooltip extends StatelessWidget {
  const MessageTimestampTooltip({
    required this.timestamp,
    required this.child,
    this.showDelay = kMessageTimestampTooltipDelay,
    super.key,
  });

  final DateTime timestamp;
  final Duration? showDelay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!usesDesktopPointerUi(context)) {
      return child;
    }
    return FluxerTooltip(
      richMessage: _FullTimestampLabel(timestamp: timestamp),
      showDelay: showDelay,
      maxWidth: FluxerTooltipMaxWidth.none,
      child: child,
    );
  }
}

class _FullTimestampLabel extends ConsumerWidget {
  const _FullTimestampLabel({required this.timestamp});

  final DateTime timestamp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      formatUserFullDateTimeWithSeconds(
        timestamp.toLocal(),
        Localizations.localeOf(context).toString(),
        use12Hour: ref.watch(use12HourTimeFormatProvider),
      ),
    );
  }
}
