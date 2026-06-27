import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart'
    as preferences_dao;
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_media_policy_utils.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mature_content_agreements_provider.g.dart';

@Riverpod(keepAlive: true)
class MatureContentAgreements extends _$MatureContentAgreements {
  @override
  MatureContentAgreementsState build() {
    ref.watch(userSettingsViewModelProvider.select((state) => state.userId));
    unawaited(_load());
    return const MatureContentAgreementsState();
  }

  Future<void> _load() async {
    final String userId = ref.read(userSettingsViewModelProvider).userId;
    if (userId.isEmpty) {
      return;
    }
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final preferences_dao.MatureContentAgreements persisted = await database
        .userPreferencesDao
        .getMatureContentAgreements(userId);
    state = MatureContentAgreementsState(
      isLoaded: true,
      agreedChannelIds: persisted.agreedChannelIds.toSet(),
      agreedCategoryIds: persisted.agreedCategoryIds.toSet(),
      agreedGuildIds: persisted.agreedGuildIds.toSet(),
    );
  }

  Future<void> reload() => _load();

  Future<void> _persist() async {
    final String userId = ref.read(userSettingsViewModelProvider).userId;
    if (userId.isEmpty) {
      return;
    }
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    await database.userPreferencesDao.setMatureContentAgreements(
      userId,
      preferences_dao.MatureContentAgreements(
        agreedChannelIds: state.agreedChannelIds.toList(),
        agreedCategoryIds: state.agreedCategoryIds.toList(),
        agreedGuildIds: state.agreedGuildIds.toList(),
      ),
    );
  }

  Future<void> agreeToChannel(String channelId) async {
    if (state.agreedChannelIds.contains(channelId)) {
      return;
    }
    state = state.copyWith(
      agreedChannelIds: {...state.agreedChannelIds, channelId},
    );
    await _persist();
  }

  Future<void> agreeToCategory(String categoryId) async {
    if (state.agreedCategoryIds.contains(categoryId)) {
      return;
    }
    state = state.copyWith(
      agreedCategoryIds: {...state.agreedCategoryIds, categoryId},
    );
    await _persist();
  }

  Future<void> agreeToGuild(String guildId) async {
    if (state.agreedGuildIds.contains(guildId)) {
      return;
    }
    state = state.copyWith(agreedGuildIds: {...state.agreedGuildIds, guildId});
    await _persist();
  }

  Future<void> agreeForScope({
    required MatureContentAgreementScope scope,
    required String scopeId,
  }) async {
    switch (scope) {
      case MatureContentAgreementScope.guild:
        await agreeToGuild(scopeId);
      case MatureContentAgreementScope.category:
        await agreeToCategory(scopeId);
      case MatureContentAgreementScope.channel:
        await agreeToChannel(scopeId);
    }
  }

  bool hasEffectiveAgreement(ResolvedMatureGateContext context) {
    return hasMatureContentAgreement(agreements: state, context: context);
  }
}

Future<ResolvedMatureGateContext?> _resolveGateContextForChannel(
  Ref ref,
  String channelId,
) async {
  final db.FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
  final db.Channel? channelRow = await database.channelDao.getChannelById(
    channelId,
  );
  if (channelRow == null) {
    return null;
  }
  final Channel channel = Channel.fromRow(channelRow);
  final db.Server? guildRow = await database.guildDao.getServerById(
    channel.guildId,
  );
  final Guild? guild = guildRow == null ? null : Guild.fromRow(guildRow);
  Channel? parentCategory;
  final String? parentId = channel.parentId;
  if (parentId != null) {
    final db.Channel? parentRow = await database.channelDao.getChannelById(
      parentId,
    );
    if (parentRow != null) {
      final Channel parent = Channel.fromRow(parentRow);
      if (parent.isCategory) {
        parentCategory = parent;
      }
    }
  }
  return resolveMatureGateContext(
    channel: channel,
    guild: guild,
    parentCategory: parentCategory,
  );
}

@riverpod
Future<ResolvedMatureGateContext?> matureGateContext(
  Ref ref,
  String channelId,
) {
  return _resolveGateContextForChannel(ref, channelId);
}

@riverpod
Future<MatureContentGateReason> matureContentGateReason(
  Ref ref,
  String channelId,
) async {
  final SensitiveContentState settings = ref.watch(sensitiveContentProvider);
  final MatureContentAgreementsState agreements = ref.watch(
    matureContentAgreementsProvider,
  );
  final ResolvedMatureGateContext? context = await ref.watch(
    matureGateContextProvider(channelId).future,
  );
  if (!ref.mounted || context == null) {
    return MatureContentGateReason.none;
  }
  return resolveChannelGateReason(
    context: context,
    nsfwAllowed: settings.nsfwAllowed,
    agreements: agreements,
  );
}

@riverpod
Future<bool> shouldShowMatureContentGate(Ref ref, String channelId) async {
  final MatureContentGateReason reason = await ref.watch(
    matureContentGateReasonProvider(channelId).future,
  );
  if (!ref.mounted) {
    return false;
  }
  return reason != MatureContentGateReason.none;
}

@immutable
class MatureMediaPolicyRequest {
  const MatureMediaPolicyRequest({
    required this.channelId,
    required this.isMatureMedia,
  });

  final String channelId;
  final bool isMatureMedia;

  @override
  bool operator ==(Object other) {
    return other is MatureMediaPolicyRequest &&
        other.channelId == channelId &&
        other.isMatureMedia == isMatureMedia;
  }

  @override
  int get hashCode => Object.hash(channelId, isMatureMedia);
}

@riverpod
Future<MatureMediaPolicy> matureMediaPolicy(
  Ref ref,
  MatureMediaPolicyRequest request,
) async {
  if (!request.isMatureMedia) {
    return MatureMediaPolicy.none;
  }
  final SensitiveContentState settings = ref.watch(sensitiveContentProvider);
  final ClientSensitiveMediaFilterLevel filterLevel = await ref.watch(
    sensitiveMediaFilterForChannelProvider(request.channelId).future,
  );
  if (!ref.mounted) {
    return const MatureMediaPolicy(
      shouldBlur: true,
      shouldBlock: false,
      canReveal: false,
      gateReason: MatureContentGateReason.none,
    );
  }
  final ResolvedMatureGateContext? context = await ref.watch(
    matureGateContextProvider(request.channelId).future,
  );
  if (!ref.mounted) {
    return const MatureMediaPolicy(
      shouldBlur: true,
      shouldBlock: false,
      canReveal: false,
      gateReason: MatureContentGateReason.none,
    );
  }
  final MatureContentGateReason mediaGateReason = resolveMediaGateReason(
    nsfwAllowed: settings.nsfwAllowed,
    effectiveMatureContent: context?.effectiveMatureContent ?? false,
  );
  return resolveMatureMediaPolicy(
    isMatureMedia: request.isMatureMedia,
    filterLevel: filterLevel,
    mediaGateReason: mediaGateReason,
  );
}
