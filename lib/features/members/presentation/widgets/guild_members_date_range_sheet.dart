import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/utils/guild_members_search_request_builder.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildMembersDateRangeSheet extends StatefulWidget {
  const GuildMembersDateRangeSheet({
    required this.initial,
    required this.onApply,
    this.onClose,
    super.key,
  });

  final GuildMembersDateRangeFilter initial;
  final ValueChanged<GuildMembersDateRangeFilter> onApply;
  final VoidCallback? onClose;

  static Future<void> show(
    BuildContext context, {
    required GuildMembersDateRangeFilter initial,
    required ValueChanged<GuildMembersDateRangeFilter> onApply,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.guildMembersDateRangeTitle,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: GuildMembersDateRangeSheet(
            initial: initial,
            onApply: onApply,
            onClose: close,
          ),
        );
      },
    );
  }

  @override
  State<GuildMembersDateRangeSheet> createState() =>
      _GuildMembersDateRangeSheetState();
}

class _GuildMembersDateRangeSheetState
    extends State<GuildMembersDateRangeSheet> {
  DateTime? _after;
  DateTime? _before;

  @override
  void initState() {
    super.initState();
    if (widget.initial.gte != null) {
      _after = DateTime.fromMillisecondsSinceEpoch(
        widget.initial.gte! * 1000,
        isUtc: true,
      ).toLocal();
    }
    if (widget.initial.lte != null) {
      _before = DateTime.fromMillisecondsSinceEpoch(
        widget.initial.lte! * 1000,
        isUtc: true,
      ).toLocal();
    }
  }

  Future<void> _pickAfter() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _after ?? DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    );
    if (picked != null && mounted) {
      setState(() => _after = picked);
    }
  }

  Future<void> _pickBefore() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _before ?? DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    );
    if (picked != null && mounted) {
      setState(() => _before = picked);
    }
  }

  void _apply() {
    widget.onApply(
      GuildMembersDateRangeFilter(
        gte: _after == null
            ? null
            : DateTime(
                    _after!.year,
                    _after!.month,
                    _after!.day,
                  ).toUtc().millisecondsSinceEpoch ~/
                  1000,
        lte: _before == null
            ? null
            : DateTime(
                    _before!.year,
                    _before!.month,
                    _before!.day,
                    23,
                    59,
                    59,
                  ).toUtc().millisecondsSinceEpoch ~/
                  1000,
      ),
    );
    widget.onClose?.call();
    if (widget.onClose == null) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FluxerMenuGroup(
          children: <Widget>[
            FluxerBottomSheetMenuItem(
              label: l10n.guildMembersDateAfter,
              hint: _after == null
                  ? l10n.guildMembersFilterAll
                  : _after.toString().split(' ').first,
              onTap: _pickAfter,
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.guildMembersDateBefore,
              hint: _before == null
                  ? l10n.guildMembersFilterAll
                  : _before.toString().split(' ').first,
              onTap: _pickBefore,
            ),
          ],
        ),
        SizedBox(height: layout.s4),
        Row(
          children: <Widget>[
            TextButton(
              onPressed: () {
                widget.onApply(GuildMembersDateRangeFilter.empty);
                widget.onClose?.call();
                if (widget.onClose == null) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.guildMembersClearAll),
            ),
            const Spacer(),
            FilledButton(onPressed: _apply, child: Text(l10n.save)),
          ],
        ),
      ],
    );
  }
}

typedef GuildMembersDatePreset = ({
  String label,
  Duration? duration,
  bool custom,
});

List<GuildMembersDatePreset> guildMembersDatePresets(FluxerLocalizations l10n) {
  return <GuildMembersDatePreset>[
    (label: l10n.guildMembersFilterAll, duration: null, custom: false),
    (
      label: l10n.guildMembersFilterPast1Hour,
      duration: const Duration(hours: 1),
      custom: false,
    ),
    (
      label: l10n.guildMembersFilterPast24Hours,
      duration: const Duration(hours: 24),
      custom: false,
    ),
    (
      label: l10n.guildMembersFilterPast7Days,
      duration: const Duration(days: 7),
      custom: false,
    ),
    (
      label: l10n.guildMembersFilterPast2Weeks,
      duration: const Duration(days: 14),
      custom: false,
    ),
    (
      label: l10n.guildMembersFilterPast3Weeks,
      duration: const Duration(days: 21),
      custom: false,
    ),
    (
      label: l10n.guildMembersFilterPast4Weeks,
      duration: const Duration(days: 28),
      custom: false,
    ),
    (
      label: l10n.guildMembersFilterPast3Months,
      duration: const Duration(days: 90),
      custom: false,
    ),
    (label: l10n.guildMembersFilterCustomRange, duration: null, custom: true),
  ];
}

GuildMembersDateRangeFilter datePresetToFilter(Duration duration) {
  final int gte =
      DateTime.now().subtract(duration).toUtc().millisecondsSinceEpoch ~/ 1000;
  return GuildMembersDateRangeFilter(gte: gte);
}

bool isDateFilterPresetActive(
  GuildMembersDateRangeFilter filter,
  GuildMembersDatePreset preset,
) {
  if (preset.custom) {
    return filter.isActive &&
        !isDatePresetMatch(filter, const Duration(hours: 1)) &&
        !isDatePresetMatch(filter, const Duration(hours: 24)) &&
        !isDatePresetMatch(filter, const Duration(days: 7)) &&
        !isDatePresetMatch(filter, const Duration(days: 14)) &&
        !isDatePresetMatch(filter, const Duration(days: 21)) &&
        !isDatePresetMatch(filter, const Duration(days: 28)) &&
        !isDatePresetMatch(filter, const Duration(days: 90));
  }
  if (preset.duration == null) {
    return !filter.isActive;
  }
  return isDatePresetMatch(filter, preset.duration!);
}
