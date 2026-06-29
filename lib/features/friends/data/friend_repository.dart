import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/domain/friend_request_exception.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

class FriendRepository {
  final FluxerClient _client;
  final db.FluxerDatabase _db;

  const FriendRepository(this._client, this._db);

  Stream<List<Friend>> watchRelationships() {
    return _db.relationshipDao.watchRelationships().asyncMap((rows) async {
      final List<db.User> users = await _db.userDao.getUsersByIds(
        rows.map((row) => row.userId).toList(),
      );
      final Map<String, db.User> usersById = <String, db.User>{
        for (final db.User user in users) user.id: user,
      };
      return rows
          .map((row) => Friend.fromRow(row, usersById[row.userId]))
          .toList();
    });
  }

  Future<List<Friend>> getRelationships() async {
    try {
      final relationships = await _client.users.listUserRelationships();
      final companions = <db.RelationshipsCompanion>[];
      for (final rel in relationships) {
        await _db.userDao.upsertUser(userFromPartialSdk(rel.user));
        companions.add(_relationshipToCompanion(rel));
      }
      await _db.relationshipDao.upsertRelationships(companions);
      return relationships.map(Friend.fromSdk).toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to fetch relationships',
      );
    }
  }

  Future<void> sendFriendRequestByTag(
    String username,
    String discriminator,
  ) async {
    try {
      final RelationshipResponse relationship = await _client.users
          .sendFriendRequestByTag(
            body: FriendRequestByTagRequest(
              username: username,
              discriminator: discriminator,
            ),
          );
      await _upsertRelationship(relationship);
    } on DioException catch (e) {
      throw _parseFriendRequestError(e);
    }
  }

  Future<void> sendFriendRequest(String userId) async {
    try {
      final RelationshipResponse relationship = await _client.users
          .sendFriendRequest(
            userId: userId,
            body: const FriendRequestCreateRequest(),
          );
      await _upsertRelationship(relationship);
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to send friend request',
      );
    }
  }

  Future<void> acceptFriendRequest(String userId) async {
    try {
      final RelationshipResponse relationship = await _client.users
          .acceptOrUpdateFriendRequest(
            userId: userId,
            body: const RelationshipTypePutRequest(),
          );
      await _upsertRelationship(relationship);
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to accept friend request',
      );
    }
  }

  Future<void> updateNickname({
    required String userId,
    required String? nickname,
  }) async {
    try {
      final RelationshipResponse relationship = await _client.users
          .updateRelationshipNickname(
            userId: userId,
            body: RelationshipNicknameUpdateRequest(nickname: nickname),
          );
      await _upsertRelationship(relationship);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to update nickname');
    }
  }

  Future<void> removeRelationship(String userId) async {
    try {
      await _client.users.removeRelationship(userId: userId);
      await _db.relationshipDao.deleteRelationship(userId);
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to remove relationship',
      );
    }
  }

  Future<void> blockUser(String userId) async {
    try {
      final RelationshipResponse relationship = await _client.users
          .acceptOrUpdateFriendRequest(
            userId: userId,
            body: const RelationshipTypePutRequest(
              type: RelationshipTypes.blocked,
            ),
          );
      await _upsertRelationship(relationship);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to block user');
    }
  }

  Future<void> _upsertRelationship(RelationshipResponse relationship) async {
    await _db.userDao.upsertUser(userFromPartialSdk(relationship.user));
    await _db.relationshipDao.upsertRelationships([
      _relationshipToCompanion(relationship),
    ]);
  }

  static db.RelationshipsCompanion _relationshipToCompanion(
    RelationshipResponse relationship,
  ) {
    return db.RelationshipsCompanion.insert(
      userId: relationship.user.id,
      type: _typeToInt(relationship.type),
      nickname: Value(relationship.nickname),
      since: Value(relationship.since),
    );
  }

  static int _typeToInt(RelationshipTypes type) => type.json ?? 1;

  static FriendRequestException _parseFriendRequestError(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      return FriendRequestException(
        code: data['code'] as String?,
        message: data['message'] as String?,
      );
    }
    return FriendRequestException(message: e.message);
  }
}
