import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String? threadApiErrorMessage({
  required String? apiErrorCode,
  required FluxerLocalizations l10n,
}) {
  return switch (apiErrorCode) {
    'THREAD_ARCHIVED' => l10n.threadErrorArchived,
    'THREAD_LOCKED' => l10n.threadErrorLocked,
    'THREAD_ALREADY_CREATED_FOR_MESSAGE' => l10n.threadErrorAlreadyCreated,
    'MAX_ACTIVE_THREADS' => l10n.threadErrorMaxActiveThreads,
    'MAX_THREAD_MEMBERS' => l10n.threadErrorMaxMembers,
    'MAX_PINNED_THREADS_IN_FORUM' => l10n.threadErrorMaxPinnedPosts,
    'MAX_FORUM_TAGS' => l10n.threadErrorMaxForumTags,
    'FORUM_TAG_NAMES_MUST_BE_UNIQUE' => l10n.threadErrorTagNamesUnique,
    'NO_TAGS_AVAILABLE_TO_NON_MODERATORS' => l10n.threadErrorNoTagsForEveryone,
    'FORUM_TAG_REQUIRED' => l10n.threadErrorTagRequired,
    'UNKNOWN_FORUM_TAG' => l10n.threadErrorUnknownTag,
    'INVALID_THREAD_NOTIFICATION_SETTINGS' =>
      l10n.threadErrorInvalidNotificationSettings,
    'SEARCH_INDEX_NOT_READY' => l10n.threadErrorSearchIndexNotReady,
    'INVALID_CHANNEL_TYPE' => l10n.threadErrorInvalidChannelType,
    _ => null,
  };
}
