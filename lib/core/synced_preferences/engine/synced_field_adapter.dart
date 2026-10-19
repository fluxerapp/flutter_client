import 'dart:typed_data';

import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:protobuf/protobuf.dart' as $pb;

abstract class SyncedFieldAdapter<T> {
  SyncedPreferenceField get field;

  int get fieldNumber => field.fieldNumber;

  T readLocal();

  Future<T> readLocalValue() async => readLocal();

  Future<void> applyRemote(T value);

  T? readFromProto(pb.SyncedPreferences message);

  $pb.GeneratedMessage toProtoMessage(T local);

  int get fieldPushWireType => 2;

  Uint8List encodePushValueBytes(T local) {
    return toProtoMessage(local).writeToBuffer();
  }

  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) => null;

  $pb.GeneratedMessage toProtoMessageForPush(
    T local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoMessage(local);
  }

  bool statesEqual(T a, T b);

  Duration get pushDebounce => const Duration(milliseconds: 500);

  bool get keepsUnpushedEditsAcrossLaunches => false;

  T mergeRemote({required T local, required T remote}) => remote;

  T mergeForMigration({required T local, required T remote}) => remote;

  T mergeProtectedInbound({
    required T local,
    required T remote,
    required T? baseline,
  }) => mergeForMigration(local: local, remote: remote);

  bool verifyRoundtrip(T candidate);

  bool hasLocalData(T local) => true;

  bool hasRemoteData(T remote) => true;

  T? clearedRemoteValue() => null;

  bool hasRemoteAdditions(T local, T remote) => false;

  bool hasInboundUpdatesWhileProtected(T local, T remote) {
    return hasRemoteAdditions(local, remote);
  }

  bool ignoreAckedRemoteShrink(T local, T remote) => false;

  bool mergeAckedInbound(T local, T remote) => false;

  T mergeRecentlyAckedInbound({required T local, required T remote}) =>
      mergeForMigration(local: local, remote: remote);
}
