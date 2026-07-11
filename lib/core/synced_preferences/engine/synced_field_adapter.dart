import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:protobuf/protobuf.dart' as $pb;

/// Maps one synced_preferences proto field to local app state.
abstract class SyncedFieldAdapter<T> {
  SyncedPreferenceField get field;

  /// Wire field number from preferences.proto.
  int get fieldNumber => field.fieldNumber;

  /// Current local value (sync; use [readLocalValue] when async).
  T readLocal();

  /// Local value for flush/hydrate; override when reading from Drift/async.
  Future<T> readLocalValue() async => readLocal();

  Future<void> applyRemote(T value);

  /// Extract this field from a decoded [pb.SyncedPreferences], or null
  T? readFromProto(pb.SyncedPreferences message);

  /// Encode local state as the fields proto sub-message.
  $pb.GeneratedMessage toProtoMessage(T local);

  /// Extract the wire sub-message for this field, if present.
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) => null;

  /// Encode local state for push, merging onto [wireSubMessage] when provided.
  $pb.GeneratedMessage toProtoMessageForPush(
    T local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoMessage(local);
  }

  /// Whether two values are the same for sync purposes.
  bool statesEqual(T a, T b);

  /// Combine local + server on first hydrate after upgrade.
  T mergeForMigration({required T local, required T remote});

  /// Local state survives encode → decode before push.
  bool verifyRoundtrip(T candidate);

  /// Local side has meaningful data worth pushing.
  bool hasLocalData(T local) => true;

  /// Remote side has meaningful data worth applying.
  bool hasRemoteData(T remote) => true;

  /// Remote has channel IDs (or equivalent) not present locally.
  bool hasRemoteAdditions(T local, T remote) => false;

  /// Inbound changes to apply while field is dirty/acked/in flight.
  bool hasInboundUpdatesWhileProtected(T local, T remote) {
    return hasRemoteAdditions(local, remote);
  }
}

bool verifyAdapterRoundtrip<T>({
  required SyncedFieldAdapter<T> adapter,
  required T candidate,
}) {
  return adapter.verifyRoundtrip(candidate);
}
