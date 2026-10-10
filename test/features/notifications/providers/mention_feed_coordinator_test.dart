import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';

class _RecordingRepository extends Fake implements NotificationsRepository {
  final List<MentionFilters> fetches = <MentionFilters>[];

  @override
  Future<bool> replaceMentionsFromApi({
    required bool includeEveryone,
    required bool includeRoles,
    required bool includeGuilds,
  }) async {
    fetches.add(
      MentionFilters(
        includeEveryone: includeEveryone,
        includeRoles: includeRoles,
        includeGuilds: includeGuilds,
      ),
    );
    return false;
  }
}

class _LocalMentionFilters extends MentionFiltersPreferences {
  @override
  MentionFilters build() => const MentionFilters();
}

void main() {
  test('synced filter change refetches a fetched feed with it', () async {
    final _RecordingRepository repository = _RecordingRepository();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        notificationsRepositoryProvider.overrideWithValue(repository),
        mentionFiltersPreferencesProvider.overrideWith(
          _LocalMentionFilters.new,
        ),
      ],
    );
    addTearDown(container.dispose);
    final ProviderSubscription<MentionFeedUiState> sub = container.listen(
      mentionFeedCoordinatorProvider,
      (_, _) {},
    );
    addTearDown(sub.close);

    await container
        .read(mentionFiltersPreferencesProvider.notifier)
        .applySynced(const MentionFilters(includeEveryone: false));
    await Future<void>.delayed(Duration.zero);
    expect(repository.fetches, isEmpty);

    await container.read(mentionFeedCoordinatorProvider.notifier).refresh();
    await container
        .read(mentionFiltersPreferencesProvider.notifier)
        .applySynced(const MentionFilters(includeRoles: false));
    await Future<void>.delayed(Duration.zero);

    expect(repository.fetches, const <MentionFilters>[
      MentionFilters(includeEveryone: false),
      MentionFilters(includeRoles: false),
    ]);
  });
}
