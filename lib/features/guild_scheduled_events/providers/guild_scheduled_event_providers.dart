import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/guild_scheduled_events/data/guild_scheduled_event_repository.dart';
import 'package:fluxer_app/features/guild_scheduled_events/domain/guild_scheduled_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_scheduled_event_providers.g.dart';

@Riverpod(keepAlive: true)
GuildScheduledEventRepository guildScheduledEventRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  return GuildScheduledEventRepository(client);
}

@riverpod
class GuildScheduledEvents extends _$GuildScheduledEvents {
  @override
  List<GuildScheduledEvent> build(String guildId) {
    _fetchEvents();
    return [];
  }

  Future<void> _fetchEvents() async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      final events = await repo.listGuildScheduledEvents(guildId: guildId);
      state = events;
    } catch (_) {}
  }

  Future<void> refresh() async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      final events = await repo.listGuildScheduledEvents(guildId: guildId);
      state = events;
    } catch (_) {}
  }

  Future<GuildScheduledEvent?> createEvent({
    required String name,
    String? description,
    required DateTime scheduledStartTime,
    DateTime? scheduledEndTime,
    required int entityType,
    String? entityId,
    String? channelId,
    String? location,
  }) async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      final event = await repo.createGuildScheduledEvent(
        guildId: guildId,
        name: name,
        description: description,
        scheduledStartTime: scheduledStartTime,
        scheduledEndTime: scheduledEndTime,
        entityType: entityType,
        entityId: entityId,
        channelId: channelId,
        location: location,
      );
      state = [...state, event];
      return event;
    } catch (_) {
      return null;
    }
  }

  Future<void> deleteEvent(String eventId) async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      await repo.deleteGuildScheduledEvent(guildId: guildId, eventId: eventId);
      state = state.where((e) => e.id != eventId).toList();
    } catch (_) {}
  }
}

@riverpod
class EventSubscription extends _$EventSubscription {
  @override
  bool build({required String guildId, required String eventId}) {
    _checkSubscription();
    return false;
  }

  Future<void> _checkSubscription() async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      final subscribers = await repo.listEventSubscribers(
        guildId: guildId,
        eventId: eventId,
      );
      final authUserId = ref.read(fluxerAuthTokenProvider);
      state = authUserId != null && subscribers.contains(authUserId);
    } catch (_) {}
  }

  Future<void> toggle() async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      if (state) {
        await repo.unsubscribeFromEvent(guildId: guildId, eventId: eventId);
        state = false;
      } else {
        await repo.subscribeToEvent(guildId: guildId, eventId: eventId);
        state = true;
      }
    } catch (_) {}
  }
}

@riverpod
class UserScheduledEvents extends _$UserScheduledEvents {
  @override
  List<GuildScheduledEvent> build() {
    _fetchEvents();
    return [];
  }

  Future<void> _fetchEvents() async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      final events = await repo.listUserScheduledEvents();
      state = events;
    } catch (_) {}
  }

  Future<void> refresh() async {
    final repo = ref.read(guildScheduledEventRepositoryProvider);
    try {
      final events = await repo.listUserScheduledEvents();
      state = events;
    } catch (_) {}
  }
}
