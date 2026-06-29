import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_candidate_builder.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_default_input.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_result_converters.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_matcher.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

// Empty query list: up to 8 recent visits, then up to 8 unread.
List<QuickSwitcherResult> generateQuickSwitcherDefaultResults(
  QuickSwitcherDefaultInput input,
) {
  final List<QuickSwitcherResult> results = <QuickSwitcherResult>[];
  final Set<String> recentChannelIds = <String>{};
  for (final RecentChannelVisit visit in input.recentVisits) {
    if (input.excludedChannelIds.contains(visit.channelId)) {
      continue;
    }
    final QuickSwitcherResult? result = input.resolver.resultForChannelId(
      visit.channelId,
      viewContext: visit.guildId,
    );
    if (result == null) {
      continue;
    }
    results.add(result);
    recentChannelIds.add(visit.channelId);
    if (results.length >= kQuickSwitcherMaxRecentResults) {
      break;
    }
  }
  final List<QuickSwitcherUnreadChannel> unreadSorted =
      List<QuickSwitcherUnreadChannel>.from(input.unreadChannels)
        ..sort((QuickSwitcherUnreadChannel a, QuickSwitcherUnreadChannel b) {
          final int aTime =
              a.lastMessageTime?.millisecondsSinceEpoch ??
              (a.lastMessageId != null
                  ? dateTimeFromSnowflakeAsLocalOrNow(
                      a.lastMessageId!,
                    ).millisecondsSinceEpoch
                  : 0);
          final int bTime =
              b.lastMessageTime?.millisecondsSinceEpoch ??
              (b.lastMessageId != null
                  ? dateTimeFromSnowflakeAsLocalOrNow(
                      b.lastMessageId!,
                    ).millisecondsSinceEpoch
                  : 0);
          return bTime.compareTo(aTime);
        });
  int unreadCount = 0;
  for (final QuickSwitcherUnreadChannel unread in unreadSorted) {
    if (input.excludedChannelIds.contains(unread.channelId)) {
      continue;
    }
    if (recentChannelIds.contains(unread.channelId)) {
      continue;
    }
    final QuickSwitcherResult? result = input.resolver.resultForChannelId(
      unread.channelId,
      viewContext: unread.guildId,
    );
    if (result == null) {
      continue;
    }
    results.add(result);
    unreadCount++;
    if (unreadCount >= kQuickSwitcherMaxUnreadResults) {
      break;
    }
  }
  return results;
}

List<QuickSwitcherResult> generateQuickSwitcherQueryModeResults({
  required QuickSwitcherQueryMode queryMode,
  required String search,
  required QuickSwitcherCandidateSets sets,
  required FluxerLocalizations l10n,
  required List<Member> memberSearchResults,
  required String? currentUserId,
  required Set<String> excludedChannelIds,
  Map<String, String?> friendNicknameById = const <String, String?>{},
}) {
  List<QuickSwitcherCandidate> candidates;
  switch (queryMode) {
    case QuickSwitcherQueryMode.user:
      candidates = mergeMemberSearchCandidates(
        baseCandidates: sets.users,
        memberSearchResults: memberSearchResults,
        currentUserId: currentUserId,
        friendNicknameById: friendNicknameById,
      );
    case QuickSwitcherQueryMode.textChannel:
      candidates = sets.textChannels;
    case QuickSwitcherQueryMode.voiceChannel:
      candidates = sets.voiceChannels;
    case QuickSwitcherQueryMode.guild:
      candidates = sets.guilds;
  }
  if (search.isEmpty &&
      (queryMode == QuickSwitcherQueryMode.textChannel ||
          queryMode == QuickSwitcherQueryMode.voiceChannel)) {
    candidates = candidates
        .where(
          (QuickSwitcherCandidate candidate) =>
              !excludedChannelIds.contains(candidate.id),
        )
        .toList();
  }
  final List<QuickSwitcherCandidate> matches = matchQuickSwitcherCandidates(
    candidates,
    search,
    kQuickSwitcherMaxQueryModeResults,
  );
  if (matches.isEmpty) {
    return const <QuickSwitcherResult>[];
  }
  final QuickSwitcherResultType headerType = quickSwitcherQueryModeToResultType(
    queryMode,
  )!;
  return <QuickSwitcherResult>[
    createQuickSwitcherHeader('query-$queryMode', headerType, l10n),
    ...matches.map(
      (QuickSwitcherCandidate candidate) =>
          candidateToQuickSwitcherResult(candidate, l10n),
    ),
  ];
}

List<QuickSwitcherResult> generateQuickSwitcherGeneralResults({
  required String search,
  required QuickSwitcherCandidateSets sets,
  required FluxerLocalizations l10n,
}) {
  final List<
    ({
      QuickSwitcherResultType type,
      String headerId,
      List<QuickSwitcherCandidate> candidates,
    })
  >
  sections =
      <
        ({
          QuickSwitcherResultType type,
          String headerId,
          List<QuickSwitcherCandidate> candidates,
        })
      >[
        (
          type: QuickSwitcherResultType.user,
          headerId: 'people',
          candidates: sets.users,
        ),
        (
          type: QuickSwitcherResultType.groupDm,
          headerId: 'group-dm',
          candidates: sets.groupDms,
        ),
        (
          type: QuickSwitcherResultType.textChannel,
          headerId: 'text-channels',
          candidates: sets.textChannels,
        ),
        (
          type: QuickSwitcherResultType.voiceChannel,
          headerId: 'voice-channels',
          candidates: sets.voiceChannels,
        ),
        (
          type: QuickSwitcherResultType.guild,
          headerId: 'guilds',
          candidates: sets.guilds,
        ),
        (
          type: QuickSwitcherResultType.settings,
          headerId: 'settings',
          candidates: <QuickSwitcherCandidate>[
            ...sets.virtualGuilds,
            ...sets.settings,
          ],
        ),
      ];
  final List<QuickSwitcherResult> results = <QuickSwitcherResult>[];
  for (final ({
        QuickSwitcherResultType type,
        String headerId,
        List<QuickSwitcherCandidate> candidates,
      })
      section
      in sections) {
    final List<QuickSwitcherCandidate> matches = matchQuickSwitcherCandidates(
      section.candidates,
      search,
      kQuickSwitcherMaxGeneralResults,
    );
    if (matches.isEmpty) {
      continue;
    }
    results
      ..add(
        createQuickSwitcherHeader(
          'section-${section.headerId}',
          section.type,
          l10n,
        ),
      )
      ..addAll(
        matches.map(
          (QuickSwitcherCandidate candidate) =>
              candidateToQuickSwitcherResult(candidate, l10n),
        ),
      );
  }
  return results;
}
