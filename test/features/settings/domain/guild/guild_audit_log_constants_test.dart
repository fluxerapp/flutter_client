import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_constants.dart';
import 'package:fluxer_dart/export.dart';

const List<AuditLogActionType> _threadActions = <AuditLogActionType>[
  AuditLogActionType.threadCreate,
  AuditLogActionType.threadUpdate,
  AuditLogActionType.threadDelete,
];

void main() {
  test('thread actions are filterable', () {
    expect(
      GuildAuditLogConstants.filterableActions.where(_threadActions.contains),
      _threadActions,
    );
  });

  test(
    'thread actions target channels with create, update and delete kinds',
    () {
      for (final AuditLogActionType action in _threadActions) {
        expect(
          GuildAuditLogConstants.getTargetType(action),
          AuditLogTargetType.channel,
        );
      }
      expect(
        GuildAuditLogConstants.getActionKind(AuditLogActionType.threadCreate),
        AuditLogActionKind.create,
      );
      expect(
        GuildAuditLogConstants.getActionKind(AuditLogActionType.threadUpdate),
        AuditLogActionKind.update,
      );
      expect(
        GuildAuditLogConstants.getActionKind(AuditLogActionType.threadDelete),
        AuditLogActionKind.delete,
      );
    },
  );
}
