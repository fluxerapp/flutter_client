import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_switch_control.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef MentionFiltersSheetExtraGroupBuilder =
    Widget Function(BuildContext sheetContext, VoidCallback close);

Future<void> showMentionFiltersSheet(
  BuildContext context, {
  required String title,
  MentionFiltersSheetExtraGroupBuilder? extraGroupBuilder,
}) {
  return FluxerBottomSheet.show<void>(
    context,
    title: title,
    variant: FluxerBottomSheetVariant.menu,
    useRootNavigator: true,
    builder: (BuildContext sheetContext, VoidCallback close) => Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        FluxerBottomSheet.bottomGapOf(sheetContext),
      ),
      child: FluxerBottomSheetGroupColumn(
        children: <Widget>[
          const _MentionFilterSwitches(),
          if (extraGroupBuilder != null) extraGroupBuilder(sheetContext, close),
        ],
      ),
    ),
  );
}

class _MentionFilterSwitches extends ConsumerWidget {
  const _MentionFilterSwitches();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MentionFilters filters = ref.watch(mentionFiltersPreferencesProvider);
    void apply(MentionFilters next) {
      ref.read(mentionFiltersPreferencesProvider.notifier).set(next);
    }

    return FluxerMenuGroup(
      children: <Widget>[
        _FilterSwitchRow(
          icon: PhosphorIconsBold.identificationBadge,
          label: l10n.notificationsMentionIncludeRoles,
          value: filters.includeRoles,
          onChanged: (bool value) => apply(
            MentionFilters(
              includeEveryone: filters.includeEveryone,
              includeRoles: value,
              includeGuilds: filters.includeGuilds,
            ),
          ),
        ),
        _FilterSwitchRow(
          icon: PhosphorIconsBold.at,
          label: l10n.notificationsMentionIncludeEveryone,
          value: filters.includeEveryone,
          onChanged: (bool value) => apply(
            MentionFilters(
              includeEveryone: value,
              includeRoles: filters.includeRoles,
              includeGuilds: filters.includeGuilds,
            ),
          ),
        ),
        _FilterSwitchRow(
          icon: PhosphorIconsBold.usersThree,
          label: l10n.notificationsMentionIncludeGuilds,
          value: filters.includeGuilds,
          onChanged: (bool value) => apply(
            MentionFilters(
              includeEveryone: filters.includeEveryone,
              includeRoles: filters.includeRoles,
              includeGuilds: value,
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterSwitchRow extends StatelessWidget {
  const _FilterSwitchRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetMenuItem(
      icon: icon,
      label: label,
      onTap: () => onChanged(!value),
      trailing: FluxerSwitchControl(value: value),
    );
  }
}
