import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class MuteSelection {
  const MuteSelection({this.durationSeconds});

  final int? durationSeconds;
}

const List<int> kMuteDurationsSeconds = <int>[
  900,
  1800,
  3600,
  10800,
  14400,
  28800,
  86400,
  259200,
];

String muteDurationLabel(int seconds, FluxerLocalizations l10n) {
  return switch (seconds) {
    900 => l10n.dmMuteFor15Min,
    1800 => l10n.dmMuteFor30Min,
    3600 => l10n.dmMuteFor1Hour,
    10800 => l10n.dmMuteFor3Hours,
    14400 => l10n.dmMuteFor4Hours,
    28800 => l10n.dmMuteFor8Hours,
    86400 => l10n.dmMuteFor24Hours,
    259200 => l10n.dmMuteFor3Days,
    _ => 'For ${seconds ~/ 60} minutes',
  };
}

String? formatMutedHintText(ChannelOverridesMuteConfig? config) {
  if (config == null) {
    return null;
  }
  final endTimeStr = config.endTime;
  if (endTimeStr == null) {
    return 'Muted';
  }
  final end = DateTime.tryParse(endTimeStr)?.toLocal();
  if (end == null) {
    return 'Muted';
  }
  return 'Muted until ${_formatMuteEnd(end)}';
}

String _formatMuteEnd(DateTime t) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final hour12 = t.hour > 12
      ? t.hour - 12
      : t.hour == 0
      ? 12
      : t.hour;
  final minute = t.minute.toString().padLeft(2, '0');
  final period = t.hour >= 12 ? 'PM' : 'AM';
  return '${months[t.month - 1]} ${t.day}, ${t.year} $hour12:$minute $period';
}

class MuteDurationSheetBody extends StatelessWidget {
  const MuteDurationSheetBody({required this.onSelected, super.key});

  final ValueChanged<MuteSelection> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);

    return FluxerBottomSheetGroupColumn(
      children: [
        FluxerMenuGroup(
          children: [
            for (final seconds in kMuteDurationsSeconds)
              FluxerBottomSheetMenuItem(
                label: muteDurationLabel(seconds, l10n),
                onTap: () =>
                    onSelected(MuteSelection(durationSeconds: seconds)),
              ),
            FluxerBottomSheetMenuItem(
              label: l10n.dmMuteForever,
              onTap: () => onSelected(const MuteSelection()),
            ),
          ],
        ),
      ],
    );
  }
}

Future<MuteSelection?> showMuteDurationSheet(
  BuildContext context, {
  required String muteTitle,
  bool useRootNavigator = false,
}) {
  return FluxerBottomSheet.show<MuteSelection>(
    context,
    title: muteTitle,
    variant: FluxerBottomSheetVariant.menu,
    useRootNavigator: useRootNavigator,
    builder: (sheetContext, _) => FluxerBottomSheetContent(
      child: MuteDurationSheetBody(
        onSelected: (selection) => Navigator.of(sheetContext).pop(selection),
      ),
    ),
  );
}
