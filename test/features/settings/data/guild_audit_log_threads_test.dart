import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/settings/data/guild_settings_converters.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_summary_builder.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

import '../../../helpers/test_l10n.dart';

void main() {
  test('thread update entries resolve the thread from the response', () {
    final GuildAuditLogPage page = guildAuditLogPageFromSdk(
      GuildAuditLogListResponse.fromJson(<String, Object?>{
        'audit_log_entries': <Object?>[
          <String, Object?>{
            'id': '900',
            'action_type': 111,
            'user_id': 'user-1',
            'target_id': '1557003817436839936',
            'changes': <Object?>[
              <String, Object?>{
                'key': 'locked',
                'old_value': false,
                'new_value': true,
              },
            ],
          },
        ],
        'users': <Object?>[],
        'webhooks': <Object?>[],
        'threads': <Object?>[
          <String, Object?>{
            'id': '1557003817436839936',
            'type': 11,
            'parent_id': '1557003835627536417',
            'name': 'Changelog wording',
          },
        ],
      }),
      guildId: 'guild-1',
    );

    final Channel thread = page.threads['1557003817436839936']!;
    expect(thread.name, 'Changelog wording');
    expect(thread.type, ChannelType.publicThread);
    expect(thread.guildId, 'guild-1');
    expect(thread.parentId, '1557003835627536417');

    final GuildAuditLogSummaryParts summary =
        GuildAuditLogSummaryBuilder.buildSummary(
          entry: page.entries.single,
          l10n: testL10n,
          userNames: const <String, String>{'user-1': 'Alex'},
          channelNames: <String, String>{
            for (final Channel channel in page.threads.values)
              channel.id: channel.name,
          },
          roleNames: const <String, String>{},
        );
    expect(summary.targetLabel, 'Changelog wording');
  });

  test('responses without threads leave the thread map empty', () {
    final GuildAuditLogPage page = guildAuditLogPageFromSdk(
      GuildAuditLogListResponse.fromJson(<String, Object?>{
        'audit_log_entries': <Object?>[],
        'users': <Object?>[],
        'webhooks': <Object?>[],
      }),
      guildId: 'guild-1',
    );

    expect(page.threads, isEmpty);
  });
}
