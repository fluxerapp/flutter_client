import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';

const Map<String, Permission> _permissionNames = <String, Permission>{
  'ADMINISTRATOR': Permission.administrator,
  'VIEW_CHANNEL': Permission.viewChannel,
  'SEND_MESSAGES': Permission.sendMessages,
  'READ_MESSAGE_HISTORY': Permission.readMessageHistory,
  'MANAGE_THREADS': Permission.manageThreads,
  'CREATE_PUBLIC_THREADS': Permission.createPublicThreads,
  'CREATE_PRIVATE_THREADS': Permission.createPrivateThreads,
  'SEND_MESSAGES_IN_THREADS': Permission.sendMessagesInThreads,
};

const Map<String, ThreadWriteAction> _actions = <String, ThreadWriteAction>{
  'send': ThreadWriteAction.send,
  'react': ThreadWriteAction.react,
  'pin': ThreadWriteAction.pin,
  'edit': ThreadWriteAction.edit,
  'delete': ThreadWriteAction.delete,
};

const Map<String, ThreadCreateKind> _kinds = <String, ThreadCreateKind>{
  'from_message': ThreadCreateKind.fromMessage,
  'public': ThreadCreateKind.public,
  'private': ThreadCreateKind.private,
  'forum_post': ThreadCreateKind.forumPost,
};

int _permissionsOf(List<dynamic> names) {
  var bits = 0;
  for (final dynamic name in names) {
    final Permission? permission = _permissionNames[name as String];
    if (permission == null) {
      throw StateError('unknown permission $name');
    }
    bits |= permission.value;
  }
  return bits;
}

ThreadActorContext _contextOf(Map<String, dynamic> row) {
  final Map<String, dynamic> actor = row['actor'] as Map<String, dynamic>;
  final Map<String, dynamic> thread =
      (row['thread'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
  return ThreadActorContext(
    permissions: _permissionsOf(actor['perms'] as List<dynamic>),
    isOwner: actor['isOwner'] as bool? ?? false,
    timedOut: actor['timedOut'] as bool? ?? false,
    isThreadOwner: actor['isThreadOwner'] as bool? ?? false,
    isMember: actor['isMember'] as bool? ?? false,
    thread: ThreadFacts(
      type: thread['type'] as int? ?? 11,
      archived: thread['archived'] as bool? ?? false,
      locked: thread['locked'] as bool? ?? false,
      invitable: thread['invitable'] as bool? ?? true,
    ),
  );
}

ThreadPatch _patchOf(Map<String, dynamic> patch) => ThreadPatch(
  name: patch.containsKey('name'),
  archived: patch['archived'] as bool?,
  autoArchiveDuration: patch.containsKey('auto_archive_duration'),
  locked: patch['locked'] as bool?,
  invitable: patch.containsKey('invitable'),
  rateLimitPerUser: patch.containsKey('rate_limit_per_user'),
  flags: patch['flags'] as int?,
  appliedTags: patch.containsKey('applied_tags'),
);

Object? _evaluate(Map<String, dynamic> row) {
  final ThreadActorContext ctx = _contextOf(row);
  final Map<String, dynamic> args =
      (row['args'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
  final ThreadDenial? denial;
  switch (row['fn'] as String) {
    case 'isThreadModerator':
      return isThreadModerator(
        ctx.permissions,
        isOwner: ctx.isOwner,
        timedOut: ctx.timedOut,
      );
    case 'canViewThread':
      denial = canViewThread(ctx);
    case 'threadWriteBlock':
      denial = threadWriteBlock(_actions[args['action']]!, ctx);
    case 'canUnarchive':
      denial = canUnarchive(ctx);
    case 'threadPatchRequirement':
      denial = threadPatchRequirement(
        _patchOf(
          (args['patch'] as Map<String, dynamic>?) ?? const <String, dynamic>{},
        ),
        args['currentFlags'] as int? ?? 0,
        ctx,
      );
    case 'canSetTags':
      denial = canSetTags(
        ctx,
        touchesModeratedTag: args['touchesModeratedTag'] as bool? ?? false,
      );
    case 'canJoinThread':
      denial = canJoinThread(ctx);
    case 'canAddThreadMember':
      final Map<String, dynamic> target =
          (args['target'] as Map<String, dynamic>?) ??
          const <String, dynamic>{'canViewParent': true, 'isModerator': false};
      denial = canAddThreadMember(
        ctx,
        targetCanViewParent: target['canViewParent'] as bool,
        targetIsModerator: target['isModerator'] as bool,
      );
    case 'canRemoveThreadMember':
      denial = canRemoveThreadMember(ctx);
    case 'canLeave':
      denial = canLeaveThread(ctx);
    case 'canDeleteThread':
      denial = canDeleteThread(ctx);
    case 'canCreateThread':
      denial = canCreateThread(ctx, _kinds[args['kind']]!);
    case 'canListArchivedThreads':
      denial = canListArchivedThreads(
        ctx,
        privateThreads: args['privateThreads'] as bool? ?? false,
      );
    default:
      throw StateError('unknown case function ${row['fn']}');
  }
  return denial?.code;
}

void main() {
  final List<dynamic> cases =
      jsonDecode(
            File(
              'test/core/permissions/thread_permission_cases.json',
            ).readAsStringSync(),
          )
          as List<dynamic>;

  group('thread permission case table', () {
    for (final dynamic raw in cases) {
      final Map<String, dynamic> row = raw as Map<String, dynamic>;
      test(row['name'] as String, () {
        expect(_evaluate(row), row['expect']);
      });
    }
  });

  group('threadViewPermissions', () {
    test('aliases SEND_MESSAGES to SEND_MESSAGES_IN_THREADS', () {
      final int parent =
          Permission.viewChannel.value | Permission.sendMessages.value;
      expect(
        hasPermission(threadViewPermissions(parent), Permission.sendMessages),
        isFalse,
      );
      final int withThreadSend =
          Permission.viewChannel.value | Permission.sendMessagesInThreads.value;
      expect(
        hasPermission(
          threadViewPermissions(withThreadSend),
          Permission.sendMessages,
        ),
        isTrue,
      );
    });

    test('administrators get every thread bit', () {
      final int perms = threadViewPermissions(Permission.administrator.value);
      expect(perms & threadPermissions, threadPermissions);
      expect(hasPermission(perms, Permission.sendMessages), isTrue);
    });
  });

  test('thread bits match the expected positions', () {
    expect(Permission.manageThreads.value, 1 << 34);
    expect(Permission.createPublicThreads.value, 1 << 35);
    expect(Permission.createPrivateThreads.value, 1 << 36);
    expect(Permission.sendMessagesInThreads.value, 1 << 38);
    expect(defaultPermissions & threadPermissions, 0);
  });
}
