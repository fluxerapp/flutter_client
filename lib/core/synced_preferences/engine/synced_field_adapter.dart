import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:protobuf/protobuf.dart' as $pb;

/// Maps one synced_preferences proto field to local app state.
abstract class SyncedFieldAdapter<T> {
  SyncedPreferenceField get field;

  /// Wire field number from preferences.proto.
  int get fieldNumber => field.fieldNumber;

  /// Sync read. Async fields must override [readLocalValue] and throw here.
  T readLocal();

  /// Local value for flush/hydrate; override when reading from Drift/async.
  Future<T> readLocalValue() async => readLocal();

  Future<void> applyRemote(T value);

  T? readFromProto(pb.SyncedPreferences message);

  $pb.GeneratedMessage toProtoMessage(T local);

  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) => null;

  $pb.GeneratedMessage toProtoMessageForPush(
    T local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoMessage(local);
  }

  bool statesEqual(T a, T b);

  T mergeForMigration({required T local, required T remote}) => remote;

  bool verifyRoundtrip(T candidate);

  bool hasLocalData(T local) => true;

  bool hasRemoteData(T remote) => true;

  bool hasRemoteAdditions(T local, T remote) => false;

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
