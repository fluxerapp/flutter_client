import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/channel_frecency.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/channels/providers/channel_frecency_provider.dart';

const Duration kChannelFrecencyPushDebounce = Duration(milliseconds: 1500);

class ChannelFrecencySyncedField
    extends
        ProtoSyncedFieldAdapter<ChannelFrecencyUsage, pb.ChannelFrecencyState> {
  ChannelFrecencySyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.channelFrecency;

  @override
  Duration get pushDebounce => kChannelFrecencyPushDebounce;

  @override
  ChannelFrecencyUsage readLocal() => _ref.read(channelFrecencyProvider);

  @override
  Future<void> applyRemote(ChannelFrecencyUsage value) =>
      _ref.read(channelFrecencyProvider.notifier).applySynced(value);

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasChannelFrecency();

  @override
  pb.ChannelFrecencyState readSubMessage(pb.SyncedPreferences message) =>
      message.channelFrecency;

  @override
  ChannelFrecencyUsage fromProto(pb.ChannelFrecencyState proto) =>
      sanitizeChannelFrecencyUsage({
        for (final MapEntry(:key, :value) in proto.usage.entries)
          key: ChannelFrecencyUse(
            totalUses: value.totalUses,
            recentUses: [for (final use in value.recentUsesMs) use.toInt()],
          ),
      }, DateTime.now().millisecondsSinceEpoch);

  @override
  void writeProto(pb.ChannelFrecencyState proto, ChannelFrecencyUsage local) {
    proto.usage
      ..clear()
      ..addAll({
        for (final MapEntry(:key, :value) in local.entries)
          key: pb.ChannelFrecencyEntry(
            totalUses: value.totalUses,
            recentUsesMs: [for (final use in value.recentUses) Int64(use)],
          ),
      });
  }

  @override
  pb.ChannelFrecencyState createEmptyProto() => pb.ChannelFrecencyState();

  @override
  pb.SyncedPreferences wrapProto(pb.ChannelFrecencyState proto) =>
      pb.SyncedPreferences(channelFrecency: proto);

  @override
  bool statesEqual(ChannelFrecencyUsage a, ChannelFrecencyUsage b) =>
      channelFrecencyUsageEqual(a, b);

  @override
  ChannelFrecencyUsage mergeRemote({
    required ChannelFrecencyUsage local,
    required ChannelFrecencyUsage remote,
  }) => mergeChannelFrecencyUsage(
    local,
    remote,
    DateTime.now().millisecondsSinceEpoch,
  );

  @override
  ChannelFrecencyUsage mergeForMigration({
    required ChannelFrecencyUsage local,
    required ChannelFrecencyUsage remote,
  }) => mergeRemote(local: local, remote: remote);

  @override
  ChannelFrecencyUsage mergeProtectedInbound({
    required ChannelFrecencyUsage local,
    required ChannelFrecencyUsage remote,
    required ChannelFrecencyUsage? baseline,
  }) => mergeRemote(local: local, remote: remote);

  @override
  bool hasInboundUpdatesWhileProtected(
    ChannelFrecencyUsage local,
    ChannelFrecencyUsage remote,
  ) => true;

  @override
  bool hasLocalData(ChannelFrecencyUsage local) => local.isNotEmpty;
}
