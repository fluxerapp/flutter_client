import 'package:fluxer_app/core/permissions/permission.dart';

const int channelTypePrivateThread = 12;

final int threadPermissions =
    Permission.manageThreads.value |
    Permission.createPublicThreads.value |
    Permission.createPrivateThreads.value |
    Permission.sendMessagesInThreads.value;

enum ThreadDenial {
  missingAccess('MISSING_ACCESS'),
  missingPermissions('MISSING_PERMISSIONS'),
  communicationDisabled('COMMUNICATION_DISABLED'),
  threadArchived('THREAD_ARCHIVED'),
  threadLocked('THREAD_LOCKED'),
  unknownThreadMember('UNKNOWN_THREAD_MEMBER');

  const ThreadDenial(this.code);

  final String code;
}

enum ThreadWriteAction { send, react, pin, edit, delete }

enum ThreadCreateKind { fromMessage, public, private, forumPost }

class ThreadActor {
  const ThreadActor({
    required this.permissions,
    this.isOwner = false,
    this.timedOut = false,
  });

  final int permissions;
  final bool isOwner;
  final bool timedOut;
}

class ThreadFacts {
  const ThreadFacts({
    required this.type,
    this.archived = false,
    this.locked = false,
    this.invitable = true,
  });

  final int type;
  final bool archived;
  final bool locked;
  final bool invitable;
}

class ThreadActorContext extends ThreadActor {
  const ThreadActorContext({
    required super.permissions,
    required this.thread,
    super.isOwner,
    super.timedOut,
    this.isThreadOwner = false,
    this.isMember = false,
  });

  final ThreadFacts thread;
  final bool isThreadOwner;
  final bool isMember;
}

class ThreadPatch {
  const ThreadPatch({
    this.name = false,
    this.archived,
    this.autoArchiveDuration = false,
    this.locked,
    this.invitable = false,
    this.rateLimitPerUser = false,
    this.flags,
    this.appliedTags = false,
  });

  final bool name;
  final bool? archived;
  final bool autoArchiveDuration;
  final bool? locked;
  final bool invitable;
  final bool rateLimitPerUser;
  final int? flags;
  final bool appliedTags;
}

bool _has(int perms, int bit) => (perms & bit) == bit;

int withImplicitThreadBits(int perms) =>
    _has(perms, Permission.administrator.value)
    ? perms | allPermissions | threadPermissions
    : perms;

bool isThreadModerator(
  int perms, {
  required bool isOwner,
  required bool timedOut,
}) {
  if (isOwner || _has(perms, Permission.administrator.value)) {
    return true;
  }
  return !timedOut && _has(perms, Permission.manageThreads.value);
}

bool _isCommunicationBlocked(ThreadActor actor) =>
    actor.timedOut &&
    !actor.isOwner &&
    !_has(actor.permissions, Permission.administrator.value);

bool _isModerator(ThreadActor actor) => isThreadModerator(
  withImplicitThreadBits(actor.permissions),
  isOwner: actor.isOwner,
  timedOut: actor.timedOut,
);

int threadViewPermissions(int parentPerms) {
  final int perms = withImplicitThreadBits(parentPerms);
  final int withoutSend = perms & ~Permission.sendMessages.value;
  return _has(perms, Permission.sendMessagesInThreads.value)
      ? withoutSend | Permission.sendMessages.value
      : withoutSend;
}

bool isThreadModeratorFor(ThreadActor actor) => _isModerator(actor);

ThreadDenial? canViewThread(ThreadActorContext ctx) {
  final int perms = withImplicitThreadBits(ctx.permissions);
  if (!ctx.isOwner && !_has(perms, Permission.viewChannel.value)) {
    return ThreadDenial.missingAccess;
  }
  if (ctx.thread.type == channelTypePrivateThread &&
      !ctx.isMember &&
      !_isModerator(ctx)) {
    return ThreadDenial.missingAccess;
  }
  return null;
}

ThreadDenial? threadWriteBlock(
  ThreadWriteAction action,
  ThreadActorContext ctx,
) {
  if (action == ThreadWriteAction.delete) {
    return null;
  }
  if (_isCommunicationBlocked(ctx)) {
    return ThreadDenial.communicationDisabled;
  }
  final bool moderator = _isModerator(ctx);
  if (action == ThreadWriteAction.send) {
    return ctx.thread.locked && !moderator ? ThreadDenial.threadLocked : null;
  }
  if (ctx.thread.archived) {
    return ThreadDenial.threadArchived;
  }
  if (ctx.thread.locked && !moderator) {
    return ThreadDenial.threadLocked;
  }
  return null;
}

ThreadDenial? canUnarchive(ThreadActorContext ctx) {
  if (_isCommunicationBlocked(ctx)) {
    return ThreadDenial.communicationDisabled;
  }
  if (_isModerator(ctx)) {
    return null;
  }
  if (ctx.thread.locked) {
    return ThreadDenial.threadLocked;
  }
  return ctx.isMember || ctx.isThreadOwner
      ? null
      : ThreadDenial.missingPermissions;
}

ThreadDenial? threadPatchRequirement(
  ThreadPatch patch,
  int currentFlags,
  ThreadActorContext ctx,
) {
  if (_isCommunicationBlocked(ctx)) {
    return ThreadDenial.communicationDisabled;
  }
  final bool moderator = _isModerator(ctx);
  final bool ownerOrModerator = moderator || ctx.isThreadOwner;
  if (patch.archived == false && ctx.thread.archived) {
    final ThreadDenial? unarchive = canUnarchive(ctx);
    if (unarchive != null) {
      return unarchive;
    }
  }
  final bool flagsChanged = patch.flags != null && patch.flags != currentFlags;
  final bool staysArchived = ctx.thread.archived && (patch.archived ?? true);
  final bool touchesOtherFields =
      patch.name ||
      patch.autoArchiveDuration ||
      patch.locked != null ||
      patch.invitable ||
      patch.rateLimitPerUser ||
      flagsChanged ||
      patch.appliedTags;
  if (staysArchived && touchesOtherFields) {
    return ThreadDenial.threadArchived;
  }
  final bool? locked = patch.locked;
  if (locked != null && locked != ctx.thread.locked && !moderator) {
    if (!(locked && ctx.isThreadOwner)) {
      return ThreadDenial.missingPermissions;
    }
  }
  if (ctx.thread.locked && !moderator) {
    return ThreadDenial.threadLocked;
  }
  if ((patch.name || patch.autoArchiveDuration) && !ownerOrModerator) {
    return ThreadDenial.missingPermissions;
  }
  if ((patch.archived ?? false) && !ctx.thread.archived && !ownerOrModerator) {
    return ThreadDenial.missingPermissions;
  }
  if (patch.invitable && !ownerOrModerator) {
    return ThreadDenial.missingPermissions;
  }
  if (patch.rateLimitPerUser && !moderator) {
    return ThreadDenial.missingPermissions;
  }
  if (flagsChanged && !moderator) {
    return ThreadDenial.missingPermissions;
  }
  return null;
}

ThreadDenial? canSetTags(
  ThreadActorContext ctx, {
  required bool touchesModeratedTag,
}) {
  if (_isCommunicationBlocked(ctx)) {
    return ThreadDenial.communicationDisabled;
  }
  final bool moderator = _isModerator(ctx);
  if (!moderator && !ctx.isThreadOwner) {
    return ThreadDenial.missingPermissions;
  }
  if (touchesModeratedTag && !moderator) {
    return ThreadDenial.missingPermissions;
  }
  return null;
}

ThreadDenial? canJoinThread(ThreadActorContext ctx) {
  final ThreadDenial? view = canViewThread(ctx);
  if (view != null) {
    return view;
  }
  if (ctx.thread.archived) {
    return ThreadDenial.threadArchived;
  }
  if (ctx.thread.locked && !_isModerator(ctx)) {
    return ThreadDenial.threadLocked;
  }
  return null;
}

ThreadDenial? canAddThreadMember(
  ThreadActorContext ctx, {
  required bool targetCanViewParent,
  required bool targetIsModerator,
}) {
  if (_isCommunicationBlocked(ctx)) {
    return ThreadDenial.communicationDisabled;
  }
  if (ctx.thread.archived) {
    return ThreadDenial.threadArchived;
  }
  final bool moderator = _isModerator(ctx);
  if (ctx.thread.locked && !moderator) {
    return ThreadDenial.threadLocked;
  }
  if (!_has(
    threadViewPermissions(ctx.permissions),
    Permission.sendMessages.value,
  )) {
    return ThreadDenial.missingPermissions;
  }
  if (ctx.thread.type == channelTypePrivateThread &&
      !ctx.thread.invitable &&
      !moderator &&
      !targetIsModerator) {
    return ThreadDenial.missingPermissions;
  }
  if (!targetCanViewParent) {
    return ThreadDenial.missingAccess;
  }
  return null;
}

ThreadDenial? canRemoveThreadMember(ThreadActorContext ctx) {
  if (_isCommunicationBlocked(ctx)) {
    return ThreadDenial.communicationDisabled;
  }
  if (ctx.thread.archived) {
    return ThreadDenial.threadArchived;
  }
  if (_isModerator(ctx)) {
    return null;
  }
  if (ctx.thread.type == channelTypePrivateThread && ctx.isThreadOwner) {
    return null;
  }
  return ThreadDenial.missingPermissions;
}

ThreadDenial? canLeaveThread(ThreadActorContext ctx) {
  if (!ctx.isMember) {
    return ThreadDenial.unknownThreadMember;
  }
  if (ctx.thread.archived) {
    return ThreadDenial.threadArchived;
  }
  return null;
}

ThreadDenial? canDeleteThread(ThreadActor actor) {
  if (_isCommunicationBlocked(actor)) {
    return ThreadDenial.communicationDisabled;
  }
  return _isModerator(actor) ? null : ThreadDenial.missingPermissions;
}

ThreadDenial? canCreateThread(ThreadActor actor, ThreadCreateKind kind) {
  final int perms = withImplicitThreadBits(actor.permissions);
  if (actor.isOwner) {
    return null;
  }
  if (!_has(perms, Permission.viewChannel.value)) {
    return ThreadDenial.missingAccess;
  }
  if (_isCommunicationBlocked(actor)) {
    return ThreadDenial.communicationDisabled;
  }
  final bool allowed = switch (kind) {
    ThreadCreateKind.forumPost => _has(perms, Permission.sendMessages.value),
    ThreadCreateKind.fromMessage =>
      _has(perms, Permission.createPublicThreads.value) &&
          _has(perms, Permission.readMessageHistory.value),
    ThreadCreateKind.public => _has(
      perms,
      Permission.createPublicThreads.value,
    ),
    ThreadCreateKind.private => _has(
      perms,
      Permission.createPrivateThreads.value,
    ),
  };
  return allowed ? null : ThreadDenial.missingPermissions;
}

ThreadDenial? canListArchivedThreads(
  ThreadActor actor, {
  required bool privateThreads,
}) {
  final int perms = withImplicitThreadBits(actor.permissions);
  if (!actor.isOwner && !_has(perms, Permission.readMessageHistory.value)) {
    return ThreadDenial.missingPermissions;
  }
  if (privateThreads && !_isModerator(actor)) {
    return ThreadDenial.missingPermissions;
  }
  return null;
}
