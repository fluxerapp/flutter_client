import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_change_formatters.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' hide Locale;

void main() {
  final FluxerLocalizations l10n = lookupFluxerLocalizations(
    const Locale('en'),
  );

  List<String> format(Object? oldValue, Object? newValue) {
    return GuildAuditLogChangeFormatters.formatChangeLines(
      change: GuildAuditLogChange(
        key: 'features',
        oldValue: oldValue,
        newValue: newValue,
      ),
      actionType: AuditLogActionType.guildUpdate,
      l10n: l10n,
      channelNames: const <String, String>{},
      roleNames: const <String, String>{},
      userNames: const <String, String>{},
    );
  }

  test('pausing invites reads as paused invites', () {
    expect(
      format(<String>['BANNER'], <String>['BANNER', 'INVITES_DISABLED']),
      <String>['Paused invites.'],
    );
  });

  test('resuming invites reads as resumed invites', () {
    expect(
      format(<String>['INVITES_DISABLED', 'BANNER'], <String>['BANNER']),
      <String>['Resumed invites.'],
    );
  });

  test('cloning toggles follow the enabled and disabled flags', () {
    expect(
      format(<String>['CLONE_EMOJI_DISABLED'], <String>['CLONE_EMOJI_ENABLED']),
      <String>["Allowed others to clone this community's emojis."],
    );
    expect(format(<String>[], <String>['CLONE_STICKER_DISABLED']), <String>[
      "Stopped allowing others to clone this community's stickers.",
    ]);
  });

  test('every toggled feature gets its own line', () {
    expect(
      format(
        <String>['DETACHED_BANNER'],
        <String>['HIDE_OWNER_CROWN', 'TEXT_CHANNEL_FLEXIBLE_NAMES'],
      ),
      <String>[
        'Turned off the detached banner.',
        'Allowed flexible text channel names.',
        'Hid the community owner crown.',
      ],
    );
  });

  test('feature changes without a readable toggle are hidden', () {
    expect(format(<String>[], <String>['VERY_LARGE_GUILD']), isEmpty);
    expect(format(<String>['BANNER'], <String>['BANNER']), isEmpty);
  });

  test('other changes still format as one line', () {
    expect(
      GuildAuditLogChangeFormatters.formatChangeLines(
        change: const GuildAuditLogChange(
          key: 'name',
          oldValue: 'Old',
          newValue: 'New',
        ),
        actionType: AuditLogActionType.guildUpdate,
        l10n: l10n,
        channelNames: const <String, String>{},
        roleNames: const <String, String>{},
        userNames: const <String, String>{},
      ),
      <String>['Renamed the community to New.'],
    );
  });
}
