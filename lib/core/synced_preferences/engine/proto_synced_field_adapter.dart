import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:protobuf/protobuf.dart' as $pb;

P mergeOrCreate<P extends $pb.GeneratedMessage>(
  P? wireBase,
  P Function() create,
) {
  if (wireBase == null) {
    return create();
  }
  final proto = create();
  proto.mergeFromMessage(wireBase);
  return proto;
}

abstract class ProtoSyncedFieldAdapter<T, P extends $pb.GeneratedMessage>
    extends SyncedFieldAdapter<T> {
  bool hasField(pb.SyncedPreferences message);

  P readSubMessage(pb.SyncedPreferences message);

  T fromProto(P proto);

  void writeProto(P proto, T local);

  P createEmptyProto();

  pb.SyncedPreferences wrapProto(P proto);

  @override
  T? readFromProto(pb.SyncedPreferences message) {
    if (!hasField(message)) {
      return null;
    }
    return fromProto(readSubMessage(message));
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    if (!hasField(wire)) {
      return null;
    }
    return readSubMessage(wire);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(T local) {
    final proto = createEmptyProto();
    writeProto(proto, local);
    return proto;
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    T local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    final proto = mergeOrCreate(wireSubMessage as P?, createEmptyProto);
    writeProto(proto, local);
    return proto;
  }

  @override
  T mergeForMigration({required T local, required T remote}) => remote;

  @override
  bool verifyRoundtrip(T candidate) {
    final proto = toProtoMessage(candidate) as P;
    final roundtripped = readFromProto(wrapProto(proto));
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }
}
