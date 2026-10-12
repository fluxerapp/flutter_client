import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart'
    as agreements_provider;

class GuildNsfwAgreementsSyncedField
    extends
        ProtoSyncedFieldAdapter<
          MatureContentAgreements,
          pb.GuildNsfwAgreements
        > {
  GuildNsfwAgreementsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.guildNsfwAgreements;

  @override
  bool get keepsUnpushedEditsAcrossLaunches => true;

  @override
  MatureContentAgreements readLocal() {
    throw UnsupportedError('Use readLocalValue for mature content agreements');
  }

  @override
  Future<MatureContentAgreements> readLocalValue() async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return const MatureContentAgreements();
    }
    return _ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .getMatureContentAgreements(userId);
  }

  @override
  Future<void> applyRemote(MatureContentAgreements value) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await _ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setMatureContentAgreements(userId, value);
    await _ref
        .read(agreements_provider.matureContentAgreementsProvider.notifier)
        .reload();
  }

  @override
  bool hasField(pb.SyncedPreferences message) =>
      message.hasGuildNsfwAgreements();

  @override
  pb.GuildNsfwAgreements readSubMessage(pb.SyncedPreferences message) =>
      message.guildNsfwAgreements;

  @override
  MatureContentAgreements fromProto(pb.GuildNsfwAgreements proto) =>
      MatureContentAgreements(
        agreedChannelIds: List.unmodifiable(proto.agreedChannelIds),
        agreedCategoryIds: List.unmodifiable(proto.agreedCategoryIds),
        agreedGuildIds: List.unmodifiable(proto.agreedGuildIds),
      );

  @override
  void writeProto(pb.GuildNsfwAgreements proto, MatureContentAgreements local) {
    proto.agreedChannelIds
      ..clear()
      ..addAll(local.agreedChannelIds);
    proto.agreedCategoryIds
      ..clear()
      ..addAll(local.agreedCategoryIds);
    proto.agreedGuildIds
      ..clear()
      ..addAll(local.agreedGuildIds);
  }

  @override
  pb.GuildNsfwAgreements createEmptyProto() => pb.GuildNsfwAgreements();

  @override
  pb.SyncedPreferences wrapProto(pb.GuildNsfwAgreements proto) =>
      pb.SyncedPreferences(guildNsfwAgreements: proto);

  @override
  bool statesEqual(MatureContentAgreements a, MatureContentAgreements b) =>
      setEquals(a.agreedChannelIds.toSet(), b.agreedChannelIds.toSet()) &&
      setEquals(a.agreedCategoryIds.toSet(), b.agreedCategoryIds.toSet()) &&
      setEquals(a.agreedGuildIds.toSet(), b.agreedGuildIds.toSet());

  @override
  bool hasLocalData(MatureContentAgreements local) =>
      local.agreedChannelIds.isNotEmpty ||
      local.agreedCategoryIds.isNotEmpty ||
      local.agreedGuildIds.isNotEmpty;
}
