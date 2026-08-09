import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_candidate_builder.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_channel_resolver.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_default_input.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_result_generators.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_build_input.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import '../../../helpers/test_l10n.dart';

QuickSwitcherChannelResolver _resolver({
  required FluxerLocalizations l10n,
  List<Channel> guildChannels = const <Channel>[],
  List<DmConversation> conversations = const <DmConversation>[],
  List<Guild> guilds = const <Guild>[],
}) {
  return QuickSwitcherChannelResolver(
    l10n: l10n,
    guildChannelsById: <String, Channel>{
      for (final Channel channel in guildChannels) channel.id: channel,
    },
    conversationsById: <String, DmConversation>{
      for (final DmConversation convo in conversations) convo.id: convo,
    },
    guildsById: <String, Guild>{
      for (final Guild guild in guilds) guild.id: guild,
    },
  );
}

void main() {
  group('generateQuickSwitcherGeneralResults', () {
    late FluxerLocalizations l10n;

    setUp(() {
      l10n = testL10n;
    });

    test('groups matching users under a people header', () {
      final QuickSwitcherCandidateSets sets = QuickSwitcherCandidateSets(
        users: const <QuickSwitcherUserCandidate>[
          QuickSwitcherUserCandidate(
            id: '1',
            title: 'Alice',
            subtitle: 'alice',
            userId: '1',
            searchValues: <String>['Alice', 'alice'],
            sortWeight: 1,
          ),
        ],
        groupDms: const <QuickSwitcherGroupDmCandidate>[],
        textChannels: const <QuickSwitcherChannelCandidate>[],
        voiceChannels: const <QuickSwitcherChannelCandidate>[],
        guilds: const <QuickSwitcherGuildCandidate>[],
        virtualGuilds: const <QuickSwitcherVirtualGuildCandidate>[],
        settings: const <QuickSwitcherSettingsCandidate>[],
      );

      final List<QuickSwitcherResult> results =
          generateQuickSwitcherGeneralResults(
            search: 'alice',
            sets: sets,
            l10n: l10n,
          );

      expect(results, hasLength(2));
      expect(results.first, isA<QuickSwitcherHeaderResult>());
      expect((results.first as QuickSwitcherHeaderResult).title, 'People');
      expect(results.last, isA<QuickSwitcherUserResult>());
    });

    test('groups quick actions under settings, not communities', () {
      final QuickSwitcherCandidateSets sets = QuickSwitcherCandidateSets(
        users: const <QuickSwitcherUserCandidate>[],
        groupDms: const <QuickSwitcherGroupDmCandidate>[],
        textChannels: const <QuickSwitcherChannelCandidate>[],
        voiceChannels: const <QuickSwitcherChannelCandidate>[],
        guilds: const <QuickSwitcherGuildCandidate>[
          QuickSwitcherGuildCandidate(
            id: 'g1',
            title: 'Test Guild',
            guild: Guild(id: 'g1', name: 'Test Guild'),
            searchValues: <String>['Test Guild', 'g1'],
            sortWeight: 1,
          ),
        ],
        virtualGuilds: const <QuickSwitcherVirtualGuildCandidate>[
          QuickSwitcherVirtualGuildCandidate(
            id: 'home',
            title: 'Home',
            virtualGuildType: QuickSwitcherVirtualGuildType.home,
            searchValues: <String>['Home', 'DM'],
            sortWeight: 1,
          ),
        ],
        settings: const <QuickSwitcherSettingsCandidate>[
          QuickSwitcherSettingsCandidate(
            id: 'user-settings',
            title: 'User Settings',
            target: QuickSwitcherSettingsTarget.userSettings,
            searchValues: <String>['Settings', 'User'],
            sortWeight: 0,
          ),
        ],
      );

      final List<QuickSwitcherResult> results =
          generateQuickSwitcherGeneralResults(
            search: '',
            sets: sets,
            l10n: l10n,
          );

      final int communitiesHeaderIndex = results.indexWhere(
        (QuickSwitcherResult result) =>
            result is QuickSwitcherHeaderResult &&
            result.title == l10n.quickSwitcherSectionCommunities,
      );
      final int settingsHeaderIndex = results.indexWhere(
        (QuickSwitcherResult result) =>
            result is QuickSwitcherHeaderResult &&
            result.title == l10n.quickSwitcherSectionSettings,
      );

      expect(communitiesHeaderIndex, greaterThanOrEqualTo(0));
      expect(settingsHeaderIndex, greaterThan(communitiesHeaderIndex));

      final List<QuickSwitcherResult> communityRows = results.sublist(
        communitiesHeaderIndex + 1,
        settingsHeaderIndex,
      );
      final List<QuickSwitcherResult> settingsRows = results.sublist(
        settingsHeaderIndex + 1,
      );

      expect(communityRows, everyElement(isA<QuickSwitcherGuildResult>()));
      expect(settingsRows, contains(isA<QuickSwitcherVirtualGuildResult>()));
      expect(settingsRows, contains(isA<QuickSwitcherSettingsResult>()));
    });
  });

  group('generateQuickSwitcherQueryModeResults', () {
    late FluxerLocalizations l10n;

    setUp(() {
      l10n = testL10n;
    });

    test('filters text channels for hash prefix mode', () {
      final QuickSwitcherCandidateSets sets = QuickSwitcherCandidateSets(
        users: const <QuickSwitcherUserCandidate>[],
        groupDms: const <QuickSwitcherGroupDmCandidate>[],
        textChannels: <QuickSwitcherChannelCandidate>[
          const QuickSwitcherChannelCandidate(
            id: '10',
            title: 'general',
            subtitle: 'Guild',
            channelId: '10',
            guildId: 'g1',
            guildName: 'Guild',
            isVoice: false,
            searchValues: <String>['general', 'Guild'],
            sortWeight: 1,
          ),
        ],
        voiceChannels: const <QuickSwitcherChannelCandidate>[],
        guilds: const <QuickSwitcherGuildCandidate>[],
        virtualGuilds: const <QuickSwitcherVirtualGuildCandidate>[],
        settings: const <QuickSwitcherSettingsCandidate>[],
      );

      final List<QuickSwitcherResult> results =
          generateQuickSwitcherQueryModeResults(
            queryMode: QuickSwitcherQueryMode.textChannel,
            search: 'gen',
            sets: sets,
            l10n: l10n,
            memberSearchResults: const [],
            currentUserId: '1',
            excludedChannelIds: const <String>{},
          );

      expect(results, hasLength(2));
      expect(results.first, isA<QuickSwitcherHeaderResult>());
      expect(results.last, isA<QuickSwitcherTextChannelResult>());
    });
  });

  group('generateQuickSwitcherDefaultResults', () {
    test('includes recent DM visits from channel id', () {
      final FluxerLocalizations l10n = testL10n;
      final DateTime recent = DateTime(2026, 4, 2, 12);

      final List<QuickSwitcherResult> results =
          generateQuickSwitcherDefaultResults(
            QuickSwitcherDefaultInput(
              resolver: _resolver(
                l10n: l10n,
                conversations: <DmConversation>[
                  DmConversation(
                    id: '100',
                    type: 1,
                    recipientId: '200',
                    recipientName: 'Monty',
                    lastMessage: 'Hi',
                    lastMessageTime: recent,
                  ),
                ],
              ),
              recentVisits: <RecentChannelVisit>[
                RecentChannelVisit(channelId: '100', visitedAt: recent),
              ],
              unreadChannels: const [],
              excludedChannelIds: const <String>{},
            ),
          );

      expect(results, hasLength(1));
      expect(results.first, isA<QuickSwitcherUserResult>());
      expect((results.first as QuickSwitcherUserResult).title, 'Monty');
    });

    test('includes recent guild text and voice channels from visits', () {
      final FluxerLocalizations l10n = testL10n;
      final DateTime visitedAt = DateTime(2026, 4, 2, 12);

      final List<QuickSwitcherResult> results =
          generateQuickSwitcherDefaultResults(
            QuickSwitcherDefaultInput(
              resolver: _resolver(
                l10n: l10n,
                guildChannels: <Channel>[
                  const Channel(id: '10', guildId: 'g1', name: 'general'),
                  const Channel(
                    id: '20',
                    guildId: 'g1',
                    name: 'Lounge',
                    type: ChannelType.guildVoice,
                  ),
                ],
                guilds: const <Guild>[Guild(id: 'g1', name: 'Guild')],
              ),
              recentVisits: <RecentChannelVisit>[
                RecentChannelVisit(
                  channelId: '10',
                  guildId: 'g1',
                  visitedAt: visitedAt,
                ),
                RecentChannelVisit(
                  channelId: '20',
                  guildId: 'g1',
                  visitedAt: visitedAt.subtract(const Duration(minutes: 1)),
                ),
              ],
              unreadChannels: const [],
              excludedChannelIds: const <String>{},
            ),
          );

      expect(results, hasLength(2));
      expect(results.first, isA<QuickSwitcherTextChannelResult>());
      expect(
        (results.first as QuickSwitcherTextChannelResult).title,
        'general',
      );
      expect(results.last, isA<QuickSwitcherVoiceChannelResult>());
      expect((results.last as QuickSwitcherVoiceChannelResult).title, 'Lounge');
    });

    test('appends unread channels after recent visits without duplicates', () {
      final FluxerLocalizations l10n = testL10n;

      final List<QuickSwitcherResult> results =
          generateQuickSwitcherDefaultResults(
            QuickSwitcherDefaultInput(
              resolver: _resolver(
                l10n: l10n,
                guildChannels: const <Channel>[
                  Channel(id: '10', guildId: 'g1', name: 'general'),
                ],
                conversations: <DmConversation>[
                  DmConversation(
                    id: '100',
                    type: 1,
                    recipientId: '200',
                    recipientName: 'Monty',
                    lastMessage: 'Hi',
                    lastMessageTime: DateTime(2026, 4, 2, 12),
                  ),
                ],
                guilds: const <Guild>[Guild(id: 'g1', name: 'Guild')],
              ),
              recentVisits: <RecentChannelVisit>[
                RecentChannelVisit(
                  channelId: '10',
                  guildId: 'g1',
                  visitedAt: DateTime(2026, 4, 2, 12),
                ),
              ],
              unreadChannels: const <QuickSwitcherUnreadChannel>[
                QuickSwitcherUnreadChannel(channelId: '100', mentionCount: 2),
              ],
              excludedChannelIds: const <String>{},
            ),
          );

      expect(results, hasLength(2));
      expect(results.first, isA<QuickSwitcherTextChannelResult>());
      expect(results.last, isA<QuickSwitcherUserResult>());
    });
  });

  group('buildQuickSwitcherCandidateSets', () {
    test('includes home and guild candidates', () {
      final FluxerLocalizations l10n = testL10n;
      final QuickSwitcherCandidateSets sets = buildQuickSwitcherCandidateSets(
        QuickSwitcherBuildInput(
          l10n: l10n,
          currentUserId: '1',
          conversations: const [],
          friends: const [],
          guildChannels: const <Channel>[],
          guilds: const <Guild>[Guild(id: 'g1', name: 'Test Guild')],
          guildMembers: const [],
          hasFavorites: false,
        ),
      );

      expect(sets.virtualGuilds, hasLength(1));
      expect(sets.virtualGuilds.first.id, 'home');
      expect(sets.guilds, hasLength(1));
      expect(sets.guilds.first.title, 'Test Guild');
    });
  });
}
