import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/recent_mentions_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/notifications/providers/mention_filters_provider.dart';

RecentMentionsSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(
    Provider<RecentMentionsSyncedField>(RecentMentionsSyncedField.new),
  );
}

void main() {
  group('RecentMentionsSyncedField', () {
    test('unset wire fields read as included', () {
      final MentionFilters? filters = _field().readFromProto(
        pb.SyncedPreferences(
          recentMentions: pb.RecentMentionsSettings(includeRoles: false),
        ),
      );
      expect(filters, const MentionFilters(includeRoles: false));
    });

    test('absent field reads as no value', () {
      expect(_field().readFromProto(pb.SyncedPreferences()), isNull);
    });

    test('defaults are left unset on the wire like the web client', () {
      final pb.RecentMentionsSettings pushed =
          _field().toProtoMessageForPush(
                const MentionFilters(includeGuilds: false),
                wireSubMessage: pb.RecentMentionsSettings(
                  includeEveryone: false,
                ),
              )
              as pb.RecentMentionsSettings;
      expect(pushed.hasIncludeEveryone(), isFalse);
      expect(pushed.hasIncludeRoles(), isFalse);
      expect(pushed.hasIncludeGuilds(), isTrue);
      expect(pushed.includeGuilds, isFalse);
    });

    test('every filter combination survives a roundtrip', () {
      final RecentMentionsSyncedField field = _field();
      for (final bool everyone in <bool>[true, false]) {
        for (final bool roles in <bool>[true, false]) {
          for (final bool guilds in <bool>[true, false]) {
            expect(
              field.verifyRoundtrip(
                MentionFilters(
                  includeEveryone: everyone,
                  includeRoles: roles,
                  includeGuilds: guilds,
                ),
              ),
              isTrue,
            );
          }
        }
      }
    });
  });
}
