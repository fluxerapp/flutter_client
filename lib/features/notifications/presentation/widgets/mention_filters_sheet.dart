import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kMentionFiltersSheetMaxHeight = 0.58;

/// Shows the mention filters bottom sheet. When the user taps Save the
Future<void> showMentionFiltersSheet(
  BuildContext context,
  WidgetRef ref,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final MentionFilters current = ref.read(mentionFiltersPreferencesProvider);
  bool includeEveryone = current.includeEveryone;
  bool includeRoles = current.includeRoles;
  bool includeGuilds = current.includeGuilds;

  await FluxerBottomSheet.show<void>(
    context,
    title: l10n.notificationsMentionFiltersTitle,
    maxHeight: _kMentionFiltersSheetMaxHeight,
    builder: (BuildContext sheetContext, VoidCallback close) => StatefulBuilder(
      builder: (BuildContext _, void Function(void Function()) setLocal) =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CheckboxListTile(
                  value: includeEveryone,
                  title: Text(l10n.notificationsMentionIncludeEveryone),
                  onChanged: (bool? value) =>
                      setLocal(() => includeEveryone = value ?? false),
                ),
                CheckboxListTile(
                  value: includeRoles,
                  title: Text(l10n.notificationsMentionIncludeRoles),
                  onChanged: (bool? value) =>
                      setLocal(() => includeRoles = value ?? false),
                ),
                CheckboxListTile(
                  value: includeGuilds,
                  title: Text(l10n.notificationsMentionIncludeGuilds),
                  onChanged: (bool? value) =>
                      setLocal(() => includeGuilds = value ?? false),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  child: FilledButton(
                    onPressed: () {
                      ref
                          .read(mentionFiltersPreferencesProvider.notifier)
                          .set(
                            MentionFilters(
                              includeEveryone: includeEveryone,
                              includeRoles: includeRoles,
                              includeGuilds: includeGuilds,
                            ),
                          );
                      close();
                    },
                    child: Text(l10n.save),
                  ),
                ),
              ],
            ),
          ),
    ),
  );
}
