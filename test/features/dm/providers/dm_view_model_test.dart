import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/data/friend_repository.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  test(
    'hasReceivedInitialConversations is false until first DM watch emit',
    () async {
      final StreamController<List<DmConversation>> controller =
          StreamController<List<DmConversation>>.broadcast();
      addTearDown(controller.close);

      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          dmRepositoryProvider.overrideWithValue(
            _FakeDmRepository(controller.stream),
          ),
          friendRepositoryProvider.overrideWithValue(_FakeFriendRepository()),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(dmViewModelProvider).hasReceivedInitialConversations,
        isFalse,
      );

      controller.add(const <DmConversation>[]);
      await Future<void>.delayed(Duration.zero);

      expect(
        container.read(dmViewModelProvider).hasReceivedInitialConversations,
        isTrue,
      );
    },
  );
}

class _FakeDmRepository implements DmRepository {
  _FakeDmRepository(this.stream);

  final Stream<List<DmConversation>> stream;

  @override
  Stream<List<DmConversation>> watchDmChannels() => stream;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeFriendRepository implements FriendRepository {
  @override
  Stream<List<Friend>> watchRelationships() => const Stream.empty();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
