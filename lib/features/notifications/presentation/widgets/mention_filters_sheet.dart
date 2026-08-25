import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kMentionFiltersSheetMaxHeight = 0.58;

/// Shows the mention filters bottom sheet. When the user taps Save the
/// preferences are persisted and the mention feed is refreshed; resolves to
/// `true` if the filters were applied, `false` if dismissed.
Future<bool> showMentionFiltersSheet(
  BuildContext context,
  WidgetRef ref,
) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final drift_db.NotificationMentionPref? current = await ref
      .read(fluxerDatabaseProvider)
      .notificationDao
      .getMentionPrefs();
  if (!context.mounted) {
    return false;
  }
  bool applied = false;
  bool includeEveryone = current?.includeEveryone ?? true;
  bool includeRoles = current?.includeRoles ?? true;
  bool includeGuilds = current?.includeGuilds ?? true;

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
                    onPressed: () => unawaited(
                      _applyAndClose(
                        ref,
                        sheetContext,
                        close,
                        includeEveryone: includeEveryone,
                        includeRoles: includeRoles,
                        includeGuilds: includeGuilds,
                        onApplied: () => applied = true,
                      ),
                    ),
                    child: Text(l10n.save),
                  ),
                ),
              ],
            ),
          ),
    ),
  );
  return applied;
}

Future<void> _applyAndClose(
  WidgetRef ref,
  BuildContext sheetContext,
  VoidCallback close, {
  required bool includeEveryone,
  required bool includeRoles,
  required bool includeGuilds,
  required VoidCallback onApplied,
}) async {
  await ref
      .read(fluxerDatabaseProvider)
      .notificationDao
      .upsertMentionPrefs(
        includeEveryone: includeEveryone,
        includeRoles: includeRoles,
        includeGuilds: includeGuilds,
      );
  if (sheetContext.mounted) {
    close();
  }
  await ref
      .read(mentionFeedCoordinatorProvider.notifier)
      .refreshWithFilters(
        includeEveryone: includeEveryone,
        includeRoles: includeRoles,
        includeGuilds: includeGuilds,
      );
  onApplied();
}
